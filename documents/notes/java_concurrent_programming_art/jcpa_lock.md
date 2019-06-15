- 目录
{:toc #markdown-toc}	


## Java中的锁       

### Lock接口
在Lock接口之前靠synchronized关键字实现锁功能，Java SE5之后，并发包中新增了Lock接口实现锁功能。
<br/>synchronized隐式地获取释放锁，固化了锁的释放和获取。
<br/>Lock接口显示的获取和释放，更加灵活。

**Lock接口提供的synchronized关键字不具备的主要特性**

| 特性 | 描述 | 
| :--- | :---- |
|尝试非阻塞地获取锁| 当前线程尝试获取锁，如果这一时刻锁没有被其他线程获取到，则成功获取并持有锁 |
|能被中断地获取锁  | 与synchronized不同，获取锁的线程能够响应中断，当获取锁的线程被中断时，中断异常将会被抛出，同时锁会被释放|
|超时获取锁       | 在指定的截止时间之前获取锁，如果截止时间到了仍旧无法获取锁，则返回|



<br/><br/><br/>
**Lock的API(解释详情参考JDK的Lock接口注释)**      

| 方法名称 | 描述 | 
| :--- | :---- |
|void lock() | Acquires the lock.  If the lock is not available then the current thread becomes disabled for thread scheduling purposes and lies dormant until the lock has been acquired.<br/><br/> 获取锁，调用该方法的当前线程将会获取锁，如果锁不可用则当前线程阻塞，如果获得锁后，从该方法返回|
|||
|void lockInterruptibly() throws InterruptedException| Acquires the lock unless the current thread is {Thread.interrupt} interrupted.<br/><br/>										Acquires the lock if it is available and returns immediately.<br/>															If the lock is not available then the current thread becomes disabled for thread scheduling purposes and lies dormant until one of two things happens: <br/>&ensp;&ensp;&ensp;&ensp; The lock is acquired by the current thread; or<br/>&ensp;&ensp;&ensp;&ensp; Some other thread {Thread#interrupt interrupts} the current thread, and interruption of lock acquisition is supported.<br/><br/>						If the current thread:<br/>&ensp;&ensp;&ensp;&ensp; has its interrupted status set on entry to this method; <br/>&ensp;&ensp;&ensp;&ensp; or is {Thread#interrupt interrupted} while acquiring the lock, and interruption of lock acquisition is supported,<br/> then {InterruptedException} is thrown and the current thread's interrupted status is cleared.<br/><br/>						可中断地获取锁，和lock()方法的不同之处在于该方法会响应中断，即在锁的获取中可以中断当前线程|
|||
|boolean tryLock()|Acquires the lock only if it is free at the time of invocation.<br/><br/>								Acquires the lock if it is available and returns immediately with the value {true}.<br/>If the lock is not available then this method will return immediately with the value {false}.<br/><br/>							尝试非阻塞地获取锁，调用该方法后立刻返回，如果能够获取则返回true,否则返回false|
|||
|boolean tryLock(long time, TimeUnit unit) throws InterruptedException|Acquires the lock if it is free within the given waiting time and the current thread has not been {Thread#interrupt interrupted}.<br/><br/>						If the lock is available this method returns immediately with the value {true}.<br/>	If the lock is not available then the current thread becomes disabled for thread scheduling purposes and lies dormant until one of three things happens:<br/>&ensp;&ensp;&ensp;&ensp;The lock is acquired by the current thread;<br/>&ensp;&ensp;&ensp;&ensp;Some other thread {Thread#interrupt interrupts} the	 current thread, and interruption of lock acquisition is supported; <br/>&ensp;&ensp;&ensp;&ensp; or The specified waiting time elapses.<br/><br/>	   If the lock is acquired then the value {true} is returned.<br/><br/>				If the current thread:<br/>&ensp;&ensp;&ensp;&ensp; has its interrupted status set on entry to this method; <br/>&ensp;&ensp;&ensp;&ensp; or is {Thread#interrupt interrupted} while acquiring the lock, and interruption of lock acquisition is supported,<br/> then {InterruptedException} is thrown and the current thread's interrupted status is cleared.<br/><br/>			If the specified waiting time elapses then the value {false}	 is returned.<br/>If the time is less than or equal to zero, the method will not wait at all.					<br/><br/>超时的获取锁，当前线程在以下3种情况下会返回：<br/>(1)当前线程在超时时间内获得了锁<br/>(2)当前线程在超时时间内被中断<br/> (3)超时时间结束，返回false|
|||
|void unlock()|Releases the lock.<br/><br/>释放锁|
|||
|Condition newCondition()|Returns a new {Condition} instance that is bound to this {Lock} instance.<br/><br/>				Before waiting on the condition the lock must be held by the current thread.<br/> A call to {Condition#await()} will atomically release the lock before waiting and re-acquire the lock before the wait returns.<br/><br/>				获取等待通知组件，该组件和当前的锁绑定，当前线程只有获得了锁，才能调用该组件的wait方法，而调用后，当前线程将释放锁。wait方法返回前需要重新获取锁。|

<br/><br/>
**LockUseCase**
<br/>在finally块中释放锁，目的是保证在获取到锁之后，最终能够被释放。
<br/>不要将获取锁的过程写在try块中，因为如果在获取锁（自定义锁的实现）时发生了异常，
异常抛出的同时，也会导致锁无故释放。
```
Lock lock = new ReentrantLock();
lock.lock();
try {
} finally {
lock.unlock();
}
```

```
A typical usage idiom for tryLock would be:

Lock lock = ...;
if (lock.tryLock()) {
	try {
	  // manipulate protected state
	} finally {
	  lock.unlock();
	}
} else {
	// perform alternative actions
}
```



### 队列同步器   
队列同步器用来构建锁或者其他同步组件的基础框架,
并发包的作者（Doug Lea）期望它能够成为实现大部分同步需求的基础。 


[AbstractQueuedSynchronizer分析]({{ site.baseurl }}/documents/notes/agui_self_analyze/java_analyze_AbstractQueuedSynchronizer)


### 重入锁


### 读写锁







