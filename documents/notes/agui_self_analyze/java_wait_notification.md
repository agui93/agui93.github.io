- 目录
{:toc #markdown-toc}	

# Wait Sets and Notification


## Reference
https://docs.oracle.com/javase/specs/jls/se7/html/jls-17.html#jls-17.2
Jdk:Thread,Object


## Intro
Every object, in addition to having an associated monitor, has an associated wait set. A wait set is a set of threads.

When an object is first created, its wait set is empty. Elementary actions that add threads to and remove threads from wait sets are atomic. Wait sets are manipulated solely through the methods Object.wait, Object.notify, and Object.notifyAll.

Wait set manipulations can also be affected by the interruption status of a thread, and by the Thread class's methods dealing with interruption. Additionally, the Thread class's methods for sleeping and joining other threads have properties derived from those of wait and notification actions.

每个对象都关联一个线程等待集合。当一个对象刚被创建时，等待集合是空的。向等待集合中添加线程和从等待集合中移除线程的基本操作是原子的。等待集合的操作仅仅是通过object对象的wait notify notifyAll系列的方法进行的。

等待集合的操作也可以被线程的中断状态影响，Thread类的方法可以操作中断状态。另外，用于sleeping和joining其他线程的Thread类的方法，****没翻译好*****


## Wait

Wait actions occur upon invocation of wait(), or the timed forms wait(long millisecs) and wait(long millisecs, int nanosecs).A call of wait(long millisecs) with a parameter of zero, or a call of wait(long millisecs, int nanosecs) with two zero parameters, is equivalent to an invocation of wait().

A thread returns normally from a wait if it returns without throwing an InterruptedException.

Let thread t be the thread executing the wait method on object m, and let n be the number of lock actions by t on m that have not been matched by unlock actions. One of the following actions occurs:



wait(),wait(long millisecs),wait(long millisecs,int nanosecs)方法可以触发等待操作。一般情况下，一个线程从一个等待中返回，不会抛出InterruptedException异常。

t 表示一个线程，m是一个对象，假设n是线程t在对象m上获得的锁的数量(未解锁对应的数量)，现在线程t在m对象上执行等待操作，那么可以出现下面的某个操作:


- If n is zero (i.e., thread t does not already possess the lock for target m), then an IllegalMonitorStateException is thrown.
- If this is a timed wait and the nanosecs argument is not in the range of 0-999999 or the millisecs argument is negative, then an IllegalArgumentException is thrown.
- If thread t is interrupted, then an InterruptedException is thrown and t's interruption status is set to false.
- Otherwise, the following sequence occurs:
	<br/>&ensp;&ensp; 1. Thread t is added to the wait set of object m, and performs n unlock actions on m.
	<br/>&ensp;&ensp; 2. Thread t does not execute any further instructions until it has been removed from m's wait set. The thread may be removed from the wait set due to any one of the following actions, and will resume sometime afterward:
	
	- A notify action being performed on m in which t is selected for removal from the wait set.
	- A notifyAll action being performed on m.
	- An interrupt action being performed on t.
	- If this is a timed wait, an internal action removing t from m's wait set that occurs after at least millisecs milliseconds plus nanosecs nanoseconds elapse since the beginning of this wait action.
	- An internal action by the implementation. Implementations are permitted, although not encouraged, to perform "spurious wake-ups", that is, to remove threads from wait sets and thus enable resumption without explicit instructions to do so.

&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;Each thread must determine an order over the events that could cause it to be removed from a wait set. That order does not have to be consistent with other orderings, but the thread must behave as though those events occurred in that order.

&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;For example, if a thread t is in the wait set for m, and then both an interrupt of t and a notification of m occur, there must be an order over these events. If the interrupt is deemed to have occurred first, then t will eventually return from wait by throwing InterruptedException, and some other thread in the wait set for m (if any exist at the time of the notification) must receive the notification. If the notification is deemed to have occurred first, then t will eventually return normally from wait with an interrupt still pending.
	<br/>&ensp;&ensp; 3. Thread t performs n lock actions on m.
	<br/>&ensp;&ensp; 4. If thread t was removed from m's wait set in step 2 due to an interrupt, then t's interruption status is set to false and the wait method throws InterruptedException.





## Notification

Notification actions occur upon invocation of methods notify and notifyAll.

Let thread t be the thread executing either of these methods on object m, and let n be the number of lock actions by t on m that have not been matched by unlock actions. One of the following actions occurs:

- If n is zero, then an IllegalMonitorStateException is thrown.
This is the case where thread t does not already possess the lock for target m.
- If n is greater than zero and this is a notify action, then if m's wait set is not empty, a thread u that is a member of m's current wait set is selected and removed from the wait set.
- There is no guarantee about which thread in the wait set is selected. This removal from the wait set enables u's resumption in a wait action. Notice, however, that u's lock actions upon resumption cannot succeed until some time after t fully unlocks the monitor for m.
- If n is greater than zero and this is a notifyAll action, then all threads are removed from m's wait set, and thus resume.

Notice, however, that only one of them at a time will lock the monitor required during the resumption of wait.

## Interruptions
Interruption actions occur upon invocation of Thread.interrupt, as well as methods defined to invoke it in turn, such as ThreadGroup.interrupt.

Let t be the thread invoking u.interrupt, for some thread u, where t and u may be the same. This action causes u's interruption status to be set to true.

Additionally, if there exists some object m whose wait set contains u, then u is removed from m's wait set. This enables u to resume in a wait action, in which case this wait will, after re-locking m's monitor, throw InterruptedException.

Invocations of Thread.isInterrupted can determine a thread's interruption status. The static method Thread.interrupted may be invoked by a thread to observe and clear its own interruption status.

## Interactions of Waits, Notification, and Interruption

The above specifications allow us to determine several properties having to do with the interaction of waits, notification, and interruption.

If a thread is both notified and interrupted while waiting, it may either:

- return normally from wait, while still having a pending interrupt (in other words, a call to Thread.interrupted would return true)
- return from wait by throwing an InterruptedException

The thread may not reset its interrupt status and return normally from the call to wait.

Similarly, notifications cannot be lost due to interrupts. Assume that a set s of threads is in the wait set of an object m, and another thread performs a notify on m. Then either:

- at least one thread in s must return normally from wait, or
- all of the threads in s must exit wait by throwing InterruptedException

Note that if a thread is both interrupted and woken via notify, and that thread returns from wait by throwing an InterruptedException, then some other thread in the wait set must be notified.