- 目录
{:toc #markdown-toc}	



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






