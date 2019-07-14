- 目录
{:toc #markdown-toc}	

# JMM


## Reference

[Threads and Locks, Thread Model](https://docs.oracle.com/javase/specs/jls/se7/html/jls-17.html#jls-17.4)

[JSR133](https://www.jcp.org/en/jsr/detail?id=133  )

[Doug Lea  Blogs](http://www.cs.umd.edu/~pugh/java/memoryModel/)

[The "Double-Checked Locking is Broken" Declaration](http://www.cs.umd.edu/~pugh/java/memoryModel/DoubleCheckedLocking.html)

https://docs.oracle.com/javase/specs/jls/se7/html/jls-17.html

Java并发编程的艺术第3章节


## 简述

JMM定义了java的线程在访问内存时会发生什么。
所有实例域、静态域和数组元素都存储在堆内存，线程间共享。局部变量,方法参数和异常处理器参数不会在线程之间共享，没有内存可见性问题，不受内存模型影响。

Java内存模型的抽象示意图:



## 重排序
在执行程序时，为了提高性能，编译器和处理器常常会对指令做重排序。



#### as-if-serial语义
as-if-serial语义的意思是：不管怎么重排序（编译器和处理器为了提高并行度），单线程程序的执行结果不能被改变。编译器、runtime和处理器都必须遵守as-if-serial语义。

为了遵守as-if-serial语义，编译器和处理器不会对存在数据依赖关系的操作做重排序，因为这种重排序会改变执行结果。但是，如果操作之间不存在数据依赖关系，这些操作就可能被编译器和处理器重排序。

这里的数据依赖性是指:两个操作访问同一个变量，且这两个操作中有一个为写操作，此时这两个操作之间就存在数据依赖性。

当代码中存在控制依赖性时，会影响指令序列执行的并行度。为此，编译器和处理器会采用猜测（Speculation）执行来克服控制相关性对并行度的影响。


#### 重排序对多线程的影响

```
class Something{
	int a = 0;
	boolean flag = false;
	public void writer() {
		a = 1; // 1
		flag = true; // 2
	}
	
	public void reader() {
		if (flag) { 		  // 3
			int i = a * a; // 4
		}
	}
}

public class Main{
	public static void main(String[] args){
		final Something obj = new Something();
		
		//写数据的线程A
		new Thread(){
			public void run(){
				obj.write();
			}
		}.start();
		
		//读数据的线程B
		new Thread(){
			public void run(){
				obj.read();
			}
		}.start();
	
	}
}

```

这段程序如何运行呢?

1和2没有数据依赖性，编译器和处理器可以对这两个操作重排序，线程A执行时的执行顺序是(1、2)或者(2、1)。

3和4没有数据依赖性，编译器和处理器可以对这两个操作重排序，线程B执行的顺序是(3、4)或者(4、3)。操作3和操作4存在制依赖关系,这里的执行可能是:		temp = a*a; if(flag){i=temp;}

因此，重排序在这里破坏了多线程程序的语义！


#### 总结
在单线程程序中，对存在控制依赖和数据依赖的操作重排序，不会改变执行结果,这也是as-if-serial语义的要求；但在多线程程序中,重排序可能会改变程序的执行结果。





## 可见性

当一个线程向一个共享变量写入某个值，这个值对另一个线程是否可见，这个性质称为可见性。例如线程A将某个值写入到字段x中，而线程B读取字段x,而这个值可能并不会立即对线程B可见。

对开发人员而言，必须非常清楚知道什么情况下一个线程的写值对其他线程是可见的。

#### 可见性问题样例

```
class Runner extends Thread{
	private boolean quit = false;
	
	public void run(){
		while(!quit){
			//...
		}
		System.out.println("Done");
	}
	
	public void shutdown(){
		quit = true;
	}
}

public class Main(){
	public static void main(String[] args){
		Runner runner = new Runner();
		
		runner.start();
		runner.shutdown();
	}
}

可能Runner线程会永远在while循环中不停地循环。
```

#### 可见性的抽象理解

共享内存的抽象图




## synchronized
当线程释放锁时，JMM会把该线程对应的本地内存中的共享变量刷新到主内存中。

当线程获取锁时，JMM会把该线程对应的本地内存置为无效。从而使得被监视器保护的临界区代码必须从主内存中读取共享变量。

## volatile

volatile写的内存语义: 当写一个volatile变量时，JMM会把该线程对应的本地内存中的共享变量值刷新到主内存。

volatile读的内存语义: 当读一个volatile变量时，JMM会把该线程对应的本地内存置为无效。线程接下来将从主内存中读取共享变量。

某个线程对volatile字段进行的写操作的结果对其他线程立即可见。

## final

对于final域，编译器和处理器要遵守两个重排序规则。
1）在构造函数内对一个final域的写入，与随后把这个被构造对象的引用赋值给一个引用变量，这两个操作之间不能重排序。
2）初次读一个包含final域的对象的引用，与随后初次读这个final域，这两个操作之间不能重排序。




## happen-before规则
happens-before的概念最初由Leslie Lamport在其一篇影响深远的论文（《Time，Clocks and the Ordering of Events in a Distributed System》）中提出。Leslie Lamport使用happens-before来定义分布式系统中事件之间的偏序关系（partial ordering）。Leslie Lamport在这篇论文中给出了一个分布式算法，该算法可以将该偏序关系扩展为某种全序关系。

JSR-133使用happens-before的概念来指定两个操作之间的执行顺序。由于这两个操作可以在一个线程之内，也可以是在不同线程之间。因此，JMM可以通过happens-before关系向程序员提供跨线程的内存可见性保证（如果A线程的写操作a与B线程的读操作b之间存在happensbefore关系，尽管a操作和b操作在不同的线程中执行，但JMM向程序员保证a操作将对b操作可见）。


《JSR-133:Java Memory Model and Thread Specification》对happens-before关系的定义如下:
- 1）如果一个操作happens-before另一个操作，那么第一个操作的执行结果将对第二个操作可见，而且第一个操作的执行顺序排在第二个操作之前。这是JMM对程序员的承诺
- 2）两个操作之间存在happens-before关系，并不意味着Java平台的具体实现必须要按照happens-before关系指定的顺序来执行。如果重排序之后的执行结果，与按happens-before关系来执行的结果一致，那么这种重排序并不非法（也就是说，JMM允许这种重排序）。这是JMM对编译器和处理器重排序的约束规则。




as-if-serial语义保证单线程内程序的执行结果不被改变。as-if-serial语义给编写单线程程序的程序员创造了一个幻境：单线程程序是按程序的顺序来执行的。<br/>
happens-before关系保证正确同步的多线程程序的执行结果不被改变。happens-before关系给编写正确同步的多线程程序的程序员创造了一个幻境：正确同步的多线程程序是按happens-before指定的顺序来执行的。



**《JSR-133:Java Memory Model and Thread Specification》定义了如下happens-before规则:**
- 1）程序顺序规则：一个线程中的每个操作，happens-before于该线程中的任意后续操作。
- 2）监视器锁规则：对一个锁的解锁，happens-before于随后对这个锁的加锁。
- 3）volatile变量规则：对一个volatile域的写，happens-before于任意后续对这个volatile域的读。
- 4）传递性：如果A happens-before B，且B happens-before C，那么A happens-before C。
- 5）start()规则：如果线程A执行操作ThreadB.start()（启动线程B），那么A线程的ThreadB.start()操作happens-before于线程B中的任意操作。
- 6）join()规则：如果线程A执行操作ThreadB.join()并成功返回，那么线程B中的任意操作happens-before于线程A从ThreadB.join()操作成功返回。





## Double-Checked Locking



```
错误的代码，没有进行同步

public class MySystem {
	private static MySystem instance;
	public static MySystem getInstance() {
	if (instance == null) 			// 1：A线程执行
		instance = new Instance(); // 2：B线程执行
		return instance;
	}
}
```
假设A线程执行代码1的同时，B线程执行代码2。此时，线程A可能会看到instance引用的对象还没有完成初始化。
<br/><br/><br/><br/><br/><br/>



```
错误的代码，同步方式不对

public class MySystem { 			// 1
	private static MySystem instance; // 2
	public static MySystem getInstance() {// 3
		if (instance == null) {            // 4:第一次检查
			synchronized (MySystem.class) {// 5:加锁
			if (instance == null)      // 6:第二次检查
			instance = new MySystem(); // 7:问题的根源出在这里
			}                          // 8
		}                             // 9
		return instance;             	// 10
	}                                // 11
}
```
第7步（instance=new MySystem()）创建了一个对象。这一行代码可以分解为如下的3行伪代码, 而2和3之间，可能会被重排序<br/>
memory = allocate(); // 1：分配对象的内存空间 <br/>
ctorInstance(memory); // 2：初始化对象	<br/>
instance = memory; // 3：设置instance指向刚分配的内存地址<br/>


A线程执行到第7步（instance=new MySystem()）如果发生重排序，另一个并发执行的线程B就有可能在第4行判断instance不为null。线程B接下来将访问instance所引用的对象，但此时这个对象可能还没有被A线程初始化。
<br/><br/><br/><br/><br/><br/>





```
正确的代码，但是性能不好

public class MySystem {
	private static MySystem instance;
	
	public synchronized static MySystem getInstance() {
	if (instance == null)
		instance = new Instance();
		return instance;
	}
}
```
正确的代码，但是性能不好，因为每次多个线程频繁调用getInstance()方法时，线程阻塞造成性能开销。
<br/><br/><br/><br/><br/><br/>


```
基于volatile的解决方案

public class MySystem {
	private volatile static MySystem instance;
	
	public static MySystem getInstance() {
	if (instance == null)
		synchronized(MySystem.class){
			if (instance == null){
				instance = new Instance();
			}
			return instance;
		}
	}
}

```

当声明对象的引用为volatile后，3行伪代码中的2和3之间的重排序，在多线程环境中将会被禁止。
memory = allocate(); // 1：分配对象的内存空间 <br/>
ctorInstance(memory); // 2：初始化对象	<br/>
instance = memory; // 3：设置instance指向刚分配的内存地址<br/>
<br/><br/><br/><br/><br/><br/>



```
基于类初始化的解决方案(Initialization On Demand Holder idiom)
public class InstanceFactory {
	private static class InstanceHolder {
		public static Instance instance = new Instance();
	}
	public static Instance getInstance() {
		return InstanceHolder.instance ; // 这里将导致InstanceHolder类被初始化
	}
}
	
```

JVM在类的初始化阶段（即在Class被加载后，且被线程使用之前），会执行类的初始化。在执行类的初始化期间，JVM会去获取一个锁。这个锁可以同步多个线程对同一个类的初始化。


todo<br/>
根据Java语言规范，在首次发生下列任意一种情况时，一个类或接口类型T将被立即初始化。


todo<br/>
类初始化处理过程




