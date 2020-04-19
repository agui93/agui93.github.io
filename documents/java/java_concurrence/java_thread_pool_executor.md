- 目录
{:toc #markdown-toc}	

# Java Concurrence



## 线程池

为什么使用线程池
如何使用线程池
线程池的使用原理
线程池的监控




## Executor框架

Executor的调度模型

组成的3大部分:任务  任务的执行  执行的结果
框架成员: ThreadPoolExecutor ScheduledThreadPoolExecutor Future Runnable Callable Executors

对成员的解释



## 常用模式

生产者-消费者模式: 通过阻塞队列解耦生产者和消费者，平衡生产者和消费者的处理能力.

使用生产者-消费者模式的场景



## 性能测试


## 线上问题的定位思路

大前提:线上不能调试
常见手段:日志、系统状态 dump线程










  