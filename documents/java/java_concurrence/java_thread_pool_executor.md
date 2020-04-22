- 目录
{:toc #markdown-toc}	

# Java Concurrence


## 1.线程池

### 1.1 为什么使用线程池
	降低资源消耗;创建线程的消耗、销毁线程的消耗
	提高响应速度;
	提高线程的可管理性; 进行统一分配、调优和监控.

### 1.2 如何使用线程池
	创建线程池,合理地配置线程池
	向线程池提交任务
	关闭线程池
	
### 1.3 线程池的使用原理
	线程池的主要处理流程
	

### 1.4 线程池的监控
一般根据业务名称命名线程池，便于区分

继承线程池进行自定义，重写beforeExecute、afterExecute和terminated方法进行监控，例如监控任务的平均执行时间、最大执行时间和最小执行时间

JConsole工具

#### ThreadPoolExecutor

|   ThreadPoolExecutor中的属性和方法 | 含义  | 解释 |
|---------- |:------ |:--- |
| activeCount      | the approximate number of threads that are actively executing tasks |  线程池中正在执行任务的线程数量 | 
| completedTaskCount     |  the approximate total number of tasks that have completed execution |  线程池在运行过程中已完成的任务数量，小于或等于taskCount |
| taskCount|  the approximate total number of tasks that have ever been scheduled for execution |  线程池已经执行的和未执行的任务总数 |
| largestPoolSize     | the largest number of threads that have ever simultaneously been in the pool | 线程池里曾经创建过的最大线程数量。如果该值等于线程池的最大大小，表示线程池曾经满过 |
|poolSize     | the current number of threads in the pool  | 线程池当前的线程数量。如果线程池不销毁的话，线程池里的线程不会自动销毁，所以这个大小只增不减|
|maximumPoolSize |  the maximum allowed number of threads |  线程池的最大线程数量|
|corePoolSize |  the core number of threads  |线程池的核心线程数量|
|isShutdown | Returns true if this executor has been shut down.  |  |
|isTerminated | Returns true if all tasks have completed following shut down. Note that isTerminated is never  true unless either  shutdown or  shutdownNow was called first.   | |


#### ThreadMXBean

|   ThreadMXBean中的属性   | 含义 | 解释 |
|:---------- | :--- |:--- |
|getThreadCount| the current number of live threads including both daemon and non-daemon threads |    线程的数量，包括守护线程和非守护线程|
|getPeakThreadCount  | the peak live thread count since the Java virtual machine started or peak was reset   | |
|getTotalStartedThreadCount | the total number of threads created and also started since the Java virtual machine started  ||
|getDaemonThreadCount  |  the current number of live daemon threads |守护线程的数量|
| getAllThreadIds | Returns all live thread IDs. | 所有存活状态的线程 ID |
| getThreadInfo  |Returns the thread info for a thread | 线程具体的堆栈信息|

#### java.lang.management.ThreadInfo

General thread information <br/>
	&emsp; - Thread ID. <br/>
	&emsp; - Name of the thread.<br/>

Execution information <br/>
	&emsp;- Thread state <br/>
	&emsp;- The object upon which the thread is blocked due to <br/>
	&emsp;&emsp;&emsp;	waiting to enter a synchronization block/method, or <br/>
	&emsp;&emsp;&emsp;	waiting to be notified in a Object.wait method, or <br/>
	&emsp;&emsp;&emsp;	parking due to a LockSupport.park call. <br/>
	&emsp;- The ID of the thread that owns the object that the thread is blocked. <br/>
	&emsp;- Stack trace of the thread. <br/>
	&emsp;- List of object monitors locked by the thread. <br/>
	&emsp;- List of ownable synchronizers locked by the thread. <br/>

Synchronization Statistics <br/>
	&emsp;&emsp;The number of times that the thread has blocked for synchronization or waited for notification. <br/>
	&emsp;&emsp;The accumulated elapsed time that the thread has blocked for synchronization or waited for notification since thread contention monitoring was enabled. Some Java virtual machine implementation may not support this. The ThreadMXBean.isThreadContentionMonitoringSupported() method can be used to determine if a Java virtual machine supports this.



## Executor框架

Executor的调度模型



组成的3大部分:任务  任务的执行  执行的结果

框架成员: ThreadPoolExecutor ScheduledThreadPoolExecutor Future Runnable Callable Executors

ThreadPoolExecutor的图

对成员的解释



## 常用模式

生产者-消费者模式: 通过阻塞队列解耦生产者和消费者，平衡生产者和消费者的处理能力.

使用生产者-消费者模式的场景分析

线程池与生产者-消费者模式


## 阻塞队列
- ArrayBlockingQueue
- LinkedBlockingQueue
- PrioirtyBlockingQueue
- DelayQueue
- SynchronousQueue
- LinkedTransferQueue
- LinkedBlockingDeque



## 性能测试

- 系统负载、cpu利用率、网络流量、系统内存
- 性能指标  测试的目标
- 性能测试工具
- 定位性能瓶颈(数据库链接、线程池、cpu、内存等)，重新调整，再次测试


## 线上问题的定位思路

常见手段:日志、系统状态、 dump线程










  