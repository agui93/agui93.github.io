- 目录
{:toc #markdown-toc}	

## AbstractQueuedSynchronizer分析

AbstractQueuedSynchronizer是构建并发包工具的基本框架,
最直接的参考资料有:
- Doug Lea的论文《 [The java.util.concurrent Synchronizer Framework](http://gee.cs.oswego.edu/dl/papers/aqs.pdf)》
- JDK中的AbstractQueuedSynchronizer源码



#### java内存模型



#### LockSupport


Basic thread blocking primitives for creating locks and other synchronization classes.

This class associates, with each thread that uses it, a permit. A call to {park} will return immediately if the permit is available, consuming it in the process; otherwise it may block.  A call to {unpark} makes the permit available, if it was not already available. 

**park()方法**<br/>
Disables the current thread for thread scheduling purposes unless the permit is available.
<br/><br/>
If the permit is available then it is consumed and the call returns immediately; otherwise the current thread becomes disabled for thread scheduling purposes and lies dormant until one of three things happens:
<br/>&ensp;&ensp;&ensp;&ensp;Some other thread invokes {unpark} with the current thread as the target;
<br/>&ensp;&ensp;&ensp;&ensp;or Some other thread {Thread#interrupt interrupts} the current thread; 
<br/>&ensp;&ensp;&ensp;&ensp;or The call spuriously (that is, for no reason) returns.
<br/><br/>
This method does <em>not</em> report which of these caused the method to return. Callers should re-check the conditions which caused the thread to park in the first place. Callers may also determine, for example, the interrupt status of the thread upon return.

**unpark(Thread thread)方法**<br/>
Makes available the permit for the given thread, if it was not already available.  If the thread was blocked on {park} then it will unblock.  Otherwise, its next call to {park} is guaranteed not to block. This operation is not guaranteed to have any effect at all if the given thread has not been started.


#### 原理解读




#### AbstractQueuedSynchronizer分析

AbstractQueuedSynchronizer源码

Condition的源码



