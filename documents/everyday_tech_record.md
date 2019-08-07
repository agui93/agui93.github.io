- 目录
{:toc #markdown-toc}	





## 2019-07-19
Disruptor源码中的perfTest

**Latency Performance Testing**	<br/>
PingPongQueueLatencyTest VS PingPongSequencedLatencyTest



**Throughput Performance Test** <br/>	

Unicast:1P-1C	 <br/>		
OneToOneQueueThroughputTest   OneToOneQueueBatchedThroughputTest  <br/>
VS    <br/>						 
OneToOneSequencedThroughputTest  OneToOneSequencedBatchThroughputTest   OneToOneSequencedPollerThroughputTest   OneToOneSequencedLongArrayThroughputTest 


Pipeline: 1P – 3C <br/>		
OneToThreePipelineQueueThroughputTest
VS
OneToThreePipelineSequencedThroughputTest


Sequencer: 3P – 1C <br/>		
ThreeToOneQueueThroughputTest    VS    ThreeToOneSequencedThroughputTest   ThreeToOneSequencedBatchThroughputTest


Multicast: 1P – 3C <br/>
OneToThreeQueueThroughputTest   VS   OneToThreeSequencedThroughputTest


Diamond: 1P – 3C	<br/>		
OneToThreeDiamondQueueThroughputTest   VS   OneToThreeDiamondSequencedThroughputTest






## 2019-07-18
Disruptor源码中的test阅读



## 2019-07-17
读Disruptor源码, 结合下图已梳理流程清晰

![Disruptor Concepts]({{ site.baseurl }}/imgs/everyday_tech_record/disruptor_concepts.png)

```
/**
 *
 * Disruptor:
 * ==========
 *                        track to prevent wrap
 *             +---------------------------------------------------+
 *             |                                                   | 
 *             |              get                                  | 
 *             |  +----------------------------+                   |
 *             |  |                            |                   v
 *             |  v                            |             +-----EP2
 * +----+    +====+    +====+   +-----+     +====+  waitFor  |
 * | P1 |--->| RB |<---| SB1|   | EP1 |<----|SB2 |<----------+
 * +----+    +====+    +====+   +-----+     +====+           |
 *      claim  |   get    ^        |                         |
 *             |          |        |                         +-----EP3
 *             |          +--------+                               ^
 *             |            waitFor                                |
 *             |                                                   |
 *             +---------------------------------------------------+
 *                  track to prevent wrap
 *
 * P1   - Publisher 1    ;publish时会发完signal,唤醒waitFor
 * RB   - RingBuffer
 * SB1  - SequenceBarrier 1 ;使用的dependentSequence是ringBuffer的cursor
 * EP1  - EventProcessor 1  ;
 * SB2  - SequenceBarrier 2 ;使用的dependentSequence是EP1的消费执行位置sequence,确保EP2和EP3消费时不超过EP1
 * EP2  - EventProcessor 2  ;
 * EP3  - EventProcessor 3  ;
 *
 */
 ```
￼
 
 




## 2019-07-16 待整理
//a Store/Store barrier between this write and any previous store.   <br/>
UNSAFE.putOrderedLong(this, VALUE_OFFSET, value);   <br/>
https://bugs.java.com/bugdatabase/view_bug.do?bug_id=6275329   <br/>
https://stackoverflow.com/questions/1468007/atomicinteger-lazyset-vs-set/14020946


//Store/Store barrier between this write and any previous write and a Store/Load barrier between this write and any subsequent volatile read.    <br/>
UNSAFE.putLongVolatile(this, VALUE_OFFSET, value);


Unsafe.putLong    <br/>
区别是什么???   <br/>
https://stackoverflow.com/questions/1468007/atomicinteger-lazyset-vs-set/14020946   <br/>
https://stackoverflow.com/questions/48615456/what-is-difference-between-getxxxvolatile-vs-getxxx-in-java-unsafe   <br/>
http://www.cs.umd.edu/~pugh/java/memoryModel/jsr-133-faq.html#conclusion   <br/>
https://www.cnblogs.com/mickole/articles/3757278.html   <br/>
https://stackoverflow.com/questions/30600621/java-unsafe-storefence-documentation-wrong   <br/>
https://www.jianshu.com/p/2ab5e3d7e510   <br/>
http://gee.cs.oswego.edu/dl/jmm/cookbook.html   <br/>




为了保证内存可见性，Java编译器在生成指令序列的适当位置会插入内存屏障指令来禁 止特定类型的处理器重排序。JMM把内存屏障指令分为4类

LoadLoad Barriers:     Load1; LoadLoad; Load2   <br/>	确保Load1的读取指令，执行先于，load2及load2后续的读取指令   <br/>
LoadStore Barries:	    Load1; LoadStore; Store2   <br/>	确保Load1的读取指令，执行先于，Store2及Store2后续的存储指令   <br/>
StoreStore Barries:     Store1; StoreStore; Store2   <br/>	确保Store1的存储指令，执行先于，Store2及Store2后续的存储指令   <br/>
StoreLoad Barries:     Store1; StoreLoad; Load2   <br/>	确保Store1的存储指令，执行先于，load2及load2后续的读取指令   <br/>

StoreLoad Barriers是一个“全能型”的屏障，它同时具有其他3个屏障的效果。现代的多处 理器大多支持该屏障（其他类型的屏障不一定被所有处理器支持）。执行该屏障开销会很昂 贵，因为当前处理器通常要把写缓冲区中的数据全部刷新到内存中（Buffer Fully Flush）。



volatile写的内存语义如下。 当写一个volatile变量时，JMM会把该线程对应的本地内存中的共享变量值刷新到主内 存。   <br/>
volatile读的内存语义如下。 当读一个volatile变量时，JMM会把该线程对应的本地内存置为无效。线程接下来将从主 内存中读取共享变量。

在每个volatile写操作的前面插入一个StoreStore屏障。    <br/>
在每个volatile写操作的后面插入一个StoreLoad屏障。    <br/>
在每个volatile读操作的后面插入一个LoadLoad屏障。    <br/>
在每个volatile读操作的后面插入一个LoadStore屏障。   <br/>


https://stackoverflow.com/questions/15360598/what-does-a-loadload-barrier-really-do





## 2019-07-08  

阅读JDK-ThreadPoolExecutor注释:
- Thread pools address two different problems; 解决的场景
- newCachedThreadPool vs newFixedThreadPool vs newSingleThreadExecutor;常用工具
- Core and maximum pool sizes; 讨论coreSize maxSize queue与创建线程、运行线程的关系
- On-demand construction; prestartCoreThread、prestartAllCoreThreads与提交任务时创建运行线程的区别
- Creating new threads; 默认或自定义的线程工厂类,the thread's name, thread group, priority, daemon status
- Keep-alive times;  大于coreSize小于maxSize的线程idle时间到限制情形;小于coreSize的线程idle时间到限制情形;
- Queuing; Direct handoffs(SynchronousQueue);  Unbounded queues(LinkedBlockingQueue); Bounded queues(ArrayBlockingQueue)   关于maxSize与queue类型和queue的限制数量的平衡，及不同平衡下cpu使用率与吞吐量的关系，不同平衡方式的适用场景
- Rejected tasks;  AbortPolicy,CallerRunsPolicy,DiscardPolicy,DiscardOldestPolicy
- Hook methods;扩展beforeExecute,afterExecute;扩展方法中抛出异常的场景
- Queue maintenance;  
- Finalization;  不在使用pool,且未shutdown的场景时，如何处理



## 2019-07-09  


阅读JDK-ThreadPoolExecutor源码思考
- 关注整体的性能指标:cpu、throughput 、memory
- 线程池参数配置: coreSize maxSize workQueue keepAliveTime  threadFactory  rejectHandler
- 最终要求: 参数配置与原理之间的关系, 参数配置与关注指标的关系, 不同参数配置下的典型适用场景, 使用ThreadPoolExecutor

探究:
- coreSize maxSize queue与创建线程、运行线程的关系
- prestartCoreThread、prestartAllCoreThreads的用法
- 自定义ThreadFactory;可以定制the thread’s name, thread group, priority, daemon status
- keepAliveTime 与allowCoreThreadTimeOut用法
- io密集型、计算密集型、混合型的任务下场景的选择


## 2019-07-10

读ArrayBlockingQueue LinkedBlockingQueue SynchronousQueue实现,<br/>
看注释时查询到的资料jdk中集合的简介: <br/>
https://docs.oracle.com/javase/8/docs/technotes/guides/collections/index.html <br/>
https://docs.oracle.com/javase/tutorial/index.html <br/>

**ArrayBlockingQueue**
```
	//ArrayBlockingQueue:通过生成消费的模式,使用lock + notEmpty + notFull同步
	
	Object[] items;  //The queued items
	int takeIndex;   //items index for next take, poll, peek or remove 
	int putIndex;    //items index for next put, offer, or add 
	int count;       //Number of elements in the queue 
	final ReentrantLock lock;      //Main lock guarding all access 
	private final Condition notEmpty;      //Condition for waiting takes 
	private final Condition notFull; 	//Condition for waiting puts 
```

**LinkedBlockingQueue** 实现核心是:<br/>
count == capacity时插入数据，不需要等待的方法插入失败,需要等待的方法通过notFull等待，插入数据后如果count < capacity,notFull发出signal通知.  <br/>
count == 0时获取数据,不需要等待的方法返回null,需要等待的方法通过notEmpty等待，获取数据后如果count>0,notEmpty发出signal通知.   <br/>
```
 //Linked list node class
static class Node<E> {
    E item;
    /**
     * One of:
     * - the real successor Node
     * - this Node, meaning the successor is head.next
     * - null, meaning there is no successor (this is the last node)
     */
    Node<E> next;
    Node(E x) { item = x; }
}


private final int capacity;/** The capacity bound, or Integer.MAX_VALUE if none */
private final AtomicInteger count = new AtomicInteger();/** Current number of elements */

transient Node<E> head; //Head of linked list.Invariant: head.item == null
private transient Node<E> last;//Tail of linked list. Invariant: last.next == null

private final ReentrantLock takeLock = new ReentrantLock();    /** Lock held by take, poll, etc */
private final Condition notEmpty = takeLock.newCondition();    /** Wait queue for waiting takes */

private final ReentrantLock putLock = new ReentrantLock();    /** Lock held by put, offer, etc */
private final Condition notFull = putLock.newCondition();    /** Wait queue for waiting puts */
```


## 2019-07-11
读SynchronousQueue源码中关于TransferQueue的实现

参考: http://www.cs.rochester.edu/research/synchronization/pseudocode/duals.html <br/>
参考: http://www.cs.rochester.edu/u/scott/papers/2004_DISC_dual_DS.pdf <br/>
参考: https://juejin.im/post/5ae754c7f265da0ba76f8534


## 2019-07-12
sun.misc.Unsafe类
参考:http://www.docjar.com/docs/api/sun/misc/Unsafe.html <br/>
参考:http://mishadoff.com/blog/java-magic-part-4-sun-dot-misc-dot-unsafe/ <br/>

模拟的是Disruptor中的RingBuffer中的unsfe操作
```
//获取数组的转换因子，也就是数组中元素的地址增量
final int scale = unsafe.arrayIndexScale(Object[].class);
int REF_ELEMENT_SHIFT;
if (4 == scale) {
    REF_ELEMENT_SHIFT = 2;
} else if (8 == scale) {
    REF_ELEMENT_SHIFT = 3;
} else {
    System.out.println("error scale");
    return;
}
int BUFFER_PAD = 128 / scale;

int bufferSize = 2 * 2 * 2 * 2;
int indexMask = bufferSize - 1;


//实际数组的大小 = BUFFER_PAD + bufferSize + BUFFER_PAD;在有效元素的前后各有BUFFER_PAD个元素空位，用于做缓存行填充
Object[] entries = new Object[bufferSize + 2 * BUFFER_PAD];


//赋值时跳过了BUFFER_PAD个元素
for (int i = 0; i < bufferSize; i++) {
    entries[BUFFER_PAD + i] = new Element("name" + i, 200 + i);
}


//获取数组中真正保存元素数据的开始位置; BUFFER_PAD << REF_ELEMENT_SHIFT 实际上是BUFFER_PAD * scale的等价高效计算方式
int REF_ARRAY_BASE = unsafe.arrayBaseOffset(Object[].class) + (BUFFER_PAD << REF_ELEMENT_SHIFT);

//获取数组中的元素
for (int i = 0; i < bufferSize; i++) {
    System.out.println(unsafe.getObject(entries, REF_ARRAY_BASE + ((i & indexMask) << REF_ELEMENT_SHIFT)));
}
    
```



## 2019-07-15

算法ceilingNextPowerOfTwo的java实现
public static int ceilingNextPowerOfTwo(final int x){
    return 1 << (32 - Integer.numberOfLeadingZeros(x - 1));
}


equals 与 hashCode方法: 
https://www.geeksforgeeks.org/equals-hashcode-methods-java/
https://www.geeksforgeeks.org/override-equalsobject-hashcode-method/
https://stackoverflow.com/questions/27581/what-issues-should-be-considered-when-overriding-equals-and-hashcode-in-java



equals vs  operator==  
https://stackoverflow.com/questions/7520432/what-is-the-difference-between-and-equals-in-java
https://www.geeksforgeeks.org/difference-equals-method-java/


How to print address of an object?
https://stackoverflow.com/questions/18396927/how-to-print-the-address-of-an-object-if-you-have-redefined-tostring-method











