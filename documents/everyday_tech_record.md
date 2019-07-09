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
