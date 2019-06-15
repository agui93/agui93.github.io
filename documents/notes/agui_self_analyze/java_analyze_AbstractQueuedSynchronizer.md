- 目录
{:toc #markdown-toc}	

## Java中的锁    

AbstractQueuedSynchronizer论文(作者Doug Lea)  [The java.util.concurrent Synchronizer Framework](http://gee.cs.oswego.edu/dl/papers/aqs.pdf)


锁是面向使用者的，定义了应用开发人员与锁交
互的接口，隐藏了实现细节；<br/>
同步器面向的是锁的实现者，简化了锁的实现方式，屏蔽了同步状态管理、线程的排队、等待与唤醒等底层操作。


队列同步器（以下简称同步器），是用来构建锁或者其他同步组件的基础框架，它使用了一个int成员变量表示同步状态，通过内置的FIFO队列来完成资源获
取线程的排队工作，并发包的作者（Doug Lea）期望它能够成为实现大部分同步需求的基础。


同步器既可以支持独占式地获取同步状态，也可以支持共享式地获取同步状态，这样就可以方便实现不同类型的同步组件（ReentrantLock、
ReentrantReadWriteLock和CountDownLatch等）。<br/>
同步器提供的3个方法（getState()、setState(int newState)和compareAndSetState(int expect,int update)）来进行操作，因为它们能够保证状态的改变是安全的。




#### 原理解读

LockSupport的作用

AbstractQueuedSynchronizer源码分析

Condition的分析