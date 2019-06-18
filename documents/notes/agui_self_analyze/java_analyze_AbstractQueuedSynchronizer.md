- 目录
{:toc #markdown-toc}	

# AbstractQueuedSynchronizer分析

AbstractQueuedSynchronizer是构建并发包工具的基本框架,
最直接的参考资料有:
- Doug Lea的论文《 [The java.util.concurrent Synchronizer Framework](http://gee.cs.oswego.edu/dl/papers/aqs.pdf)》
- JDK中的AbstractQueuedSynchronizer源码



## java内存模型

[JMM 分析]({{ site.baseurl }}/documents/notes/agui_self_analyze/java_jmm)

## LockSupport

[LockSupport 分析]({{ site.baseurl }}/documents/notes/agui_self_analyze/java_locksupport)


## Wait Sets and Notification
对Thread中断的理解，这一步涉及针对acquireQueued方法的解释

参考:https://docs.oracle.com/javase/specs/jls/se7/html/jls-17.html#jls-17.2



## 论文初解

### REQUIREMENTS
#### Functionality

**two kinds of methods**<br/>
Synchronizers possess two kinds of methods :<br/>
at least one acquire operation that blocks the calling thread unless/until the
synchronization state allows it to proceed, <br/>
and at least one release operation that changes synchronization state in a way that
may allow one or more blocked threads to unblock.<br/>

**consistent conventions**<br/>
- Nonblocking synchronization attempts (for example, tryLock) as well as blocking versions.
- Optional timeouts, so applications can give up waiting.
- Cancellability via interruption, usually separated into one version of acquire that is cancellable, and one that isn't.

**exclusive/shared**<br/>
exclusive states – in which only one thread at a time may continue past a possible blocking point<br/>
shared states - in which multiple threads can at least sometimes proceed.<br/>
To be widely useful, the framework must support both modes of operation.<br/>


**Condition**<br/>
supporting monitor-style await/signal operations that may be associated with exclusive Lock classes, and whose implementations are intrinsically intertwined with their associated Lock classes.


#### Performance Goals

### DESIGN AND IMPLEMENTATION






## 原理解读





## AbstractQueuedSynchronizer分析

AbstractQueuedSynchronizer源码

Condition的源码

## 性能测试


## Usage



