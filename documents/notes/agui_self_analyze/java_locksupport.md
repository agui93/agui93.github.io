- 目录
{:toc #markdown-toc}	

# LockSupport

**参考: JDK8 LockSupport**<br/>
本文简单地梳理下LockSupport


LockSupport通过一组公共静态方法，提供最基本的线程阻塞和唤醒功能，可以用于构建同步组件的基础工具。以park开头的一组方法用来阻塞当前线程，unpark(Thread thread)方法唤醒一个被阻塞的线程。


## INTRODUCTION

Basic thread blocking primitives for creating locks and other synchronization classes.<br/>
LockSupport是用来创建锁和其他同步类的基本的线程阻塞原语.

This class associates, with each thread that uses it, a permit. A call to {park} will return immediately if the permit is available, consuming it in the process; otherwise it may block.  A call to {unpark} makes the permit available, if it was not already available. <br/>
每个线程都关联一个permit(许可)。如果permit是可获得的,线程调用park方法,消耗permit后方法立即返回;如果permit不可用,那么本线程阻塞。调用unpark方法后，如果permit不可用的，那么perimit变为可用的。



Methods {park} and {unpark} provide efficient means of blocking and unblocking threads that do not encounter the problems that cause the deprecated methods {Thread.suspend} and {Thread.resume} to be unusable for such purposes: Races between one thread invoking {park} and another thread trying to {unpark} it will preserve liveness, due to the permit. Additionally, {park} will return if the caller's thread was interrupted, and timeout versions are supported. The {park} method may also return at any other time, for "no reason", so in general must be invoked within a loop that rechecks conditions upon return. In this sense {park} serves as an optimization of a "busy wait" that does not waste as much time  spinning, but must be paired with an {unpark} to be effective.


{park}和{unpark}方法能更高效地阻塞和唤醒线程,当一个线程调用park方法另一个线程同时尝试调用upark方法时,因为permit不会产生死锁;而已经过期的{Thread.suspend} and {Thread.resume} 方法会产生死锁。另外，{park}方法可以支持中断和超时。{park}方法可以无任何原因的情况下在任意时间点返回，因此，需要在一个循环里校验锁的条件。{park}不用浪费更多时间进行自旋，并且和{unpark}方法配套使用更高效。

The three forms of {park} each also support a {blocker} object parameter. This object is recorded while the thread is blocked to permit monitoring and diagnostic tools to identify the reasons that threads are blocked. (Such tools may access blockers using method {#getBlocker(Thread)}.) The use of these forms rather than the original forms without this parameter is strongly encouraged. The normal argument to supply as a {blocker} within a lock implementation is {this}.


有三种{park}方法参数可以附带{blocker}对象。线程阻塞时，可以根据这个参数监控和诊断线程阻塞的原因,{blocker}对象用{#getBlocker(Thread)}方法获取，建议使用参数要求{blocker}的{park}方法，一般{blocker}对象会使用{this}.

The {park} method is designed for use only in constructions of the form:
<pre> {while (!canProceed()) { ... LockSupport.park(this); }}</pre>
where neither {canProceed} nor any other actions prior to the call to {park} entail locking or blocking.  Because only one permit is associated with each thread, any intermediary uses of {park} could interfere with its intended effects.

使用{park}方法时常用循环形式，原因是每个线程只有一个permit，而{park}方法可能无故退出阻塞。



### Park

Disables the current thread for thread scheduling purposes unless the permit is available.
<br/><br/>
If the permit is available then it is consumed and the call returns immediately;<br/> 
otherwise the current thread becomes disabled for thread scheduling purposes and lies dormant until one of three things happens:
<br/>&ensp;&ensp;&ensp;&ensp;Some other thread invokes {unpark} with the current thread as the target;
<br/>&ensp;&ensp;&ensp;&ensp;or Some other thread {Thread#interrupt interrupts} the current thread; 
<br/>&ensp;&ensp;&ensp;&ensp;or The call spuriously (that is, for no reason) returns.
<br/><br/>
This method does <em>not</em> report which of these caused the method to return. Callers should re-check the conditions which caused the thread to park in the first place. Callers may also determine, for example, the interrupt status of the thread upon return.



如果permit可用，当前线程调用park方法后会立即返回。<br/>
如果permit不可用，阻塞当前线程进行线程调度，除非发生下面三种情况时，线程才会唤醒:
- 其他的某个线程调用了upark方法，参数是这个被阻塞的线程
- 其他的某个线程调用了{Thread#interrupt interrupts}方法中断被阻塞的线程
- 被阻塞的线程莫名地从park方法中返回，没有任何原因
这个方法不会提供什么原因引起方法返回的。使用者应该重新检测引起线程阻塞的条件。使用者还应该自己在线程返回是，线程的中断状态的检测和处理。



**parkNanos**: The specified waiting time elapses;<br/>
parkNanos方法另一种线程被唤醒的方式:等待的时间用完了

**parkUntil**: The specified deadline passes;<br/>
parkUntil方法另一种线程被唤醒的方式:到了指定的时间


### Unpark

Makes available the permit for the given thread, if it was not already available.  If the thread was blocked on {park} then it will unblock.  Otherwise, its next call to {park} is guaranteed not to block. This operation is not guaranteed to have any effect at all if the given thread has not been started.

如果传入的参数线程的permit不可用，upark方法会使线程的permit可用。<br/>
如果参数线程正阻塞在{park}方法上时，会唤醒参数线程。<br/>
否则，下次调用{park}方法时，线程不会阻塞。<br/>
如果传入的参数线程还没start,那么调用unpark方法没影响。<br/>


### Blocker

设置:{park}的Blocker参数<br/>
获取:getBlocker(Thread t)<br/>
{blocker}对象可以用于监控和诊断,一般传入blocker参数是当前对象{this}。



## SAMPLE USAGE
Here is a sketch of a first-in-first-out non-reentrant lock class:

```
  class FIFOMutex {
    private final AtomicBoolean locked = new AtomicBoolean(false);
    private final Queue<Thread> waiters = new ConcurrentLinkedQueue<Thread>();
    public void lock() {
      boolean wasInterrupted = false;
      Thread current = Thread.currentThread();
      waiters.add(current);
      // Block while not first in queue or cannot acquire lock
      while (waiters.peek() != current ||
             !locked.compareAndSet(false, true)) {
        LockSupport.park(this);
        if (Thread.interrupted()) // ignore interrupts while waiting
          wasInterrupted = true;
      }
      waiters.remove();
      if (wasInterrupted)          // reassert interrupt status on exit
        current.interrupt();
    }
    public void unlock() {
      locked.set(false);
      LockSupport.unpark(waiters.peek());
    }
  }
```

## 用例
AbstractQueuedSynchronizer中使用LockSupport进行线程的阻塞和唤醒



