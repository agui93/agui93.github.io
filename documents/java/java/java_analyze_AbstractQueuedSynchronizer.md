- 目录
{:toc #markdown-toc}	

# AbstractQueuedSynchronizer分析

AbstractQueuedSynchronizer是构建并发包工具的基本框架,
最直接的参考资料有:
- Doug Lea的论文《 [The java.util.concurrent Synchronizer Framework](http://gee.cs.oswego.edu/dl/papers/aqs.pdf)》
- JDK中的AbstractQueuedSynchronizer源码
- https://docs.oracle.com/javase/8/docs/api/index.html?java/util/concurrent/atomic/package-summary.html



## java内存模型

[JMM 分析]({{ site.baseurl }}/documents/notes/agui_self_analyze/java_jmm)

## LockSupport

[LockSupport 分析]({{ site.baseurl }}/documents/notes/agui_self_analyze/java_locksupport)


## Wait Sets and Notification
[java wait notivication 分析]({{ site.baseurl }}/documents/notes/agui_self_analyze/java_wait_notification) 


## The java.util.concurrent Synchronizer Framework
- [The java.util.concurrent Synchronizer Framework 论文分析]({{ site.baseurl }}/documents/notes/agui_self_analyze/java_AbstractQueuedSynchronizer_paper)



## AbstractQueuedSynchronizer分析

AbstractQueuedSynchronizer源码

Condition的源码
样例代码，类图，时序图，TimeThread图

## 性能测试
度量维度，测试代码，度量结果，度量结论

## Usage



