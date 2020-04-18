- 目录
{:toc #markdown-toc}	


## 并发编程挑战
建议:JDK并发包的并发容器和工具类已经通过了充分的测试和优化,对于Java开发工程师而言应该多使用这些来解决并发问题。       
要求:理解并掌握JDK并发包



### 上下文切换
CPU通过时间片分配算法循环执行任务，当前任务执行一个时间片后会切换到下一个任务，切换前会保存上一个任务的状态。         

线程有创建和上下文切换的开销。(代码验证和实验结果对比)    



工具:度量上下文切换带来的消耗。       
- 使用Lmbench3可以测量上下文切换的时长。
- 使用vmstat可以测量上下文切换的次数。



**如何减少上下文切换**       
- **无锁并发编程**。多线程竞争锁时，会引起上下文切换，所以多线程处理数据时，可以用一些办法来避免使用锁，如将数据的ID按照Hash算法取模分段，不同的线程处理不同段的数据。
- **CAS算法**。Java的Atomic包使用CAS算法来更新数据，而不需要加锁。
- **使用最少线程**。避免创建不需要的线程，比如任务很少，但是创建了很多线程来处理，这样会造成大量线程都处于等待状态。
- **协程**。在单线程里实现多任务的调度，并在单线程里维持多个任务间的切换。





### 死锁
**后果**:一旦产生死锁，就会造成系统功能不可用.

**定位**:一旦出现死锁，业务是可感知的，因为不能继续提供服务了，通过dump线程查看到底是哪个线程出现了问题。

**避免死锁**的几个常见方法:                
- 避免一个线程同时获取多个锁。
- 避免一个线程在锁内同时占用多个资源，尽量保证每个锁只占用一个资源。
- 尝试使用定时锁，使用lock.tryLock（timeout）来替代使用内部锁机制。
- 对于数据库锁，加锁和解锁必须在一个数据库连接里，否则会出现解锁失败的情况。

### 资源限制的挑战

**什么是资源限制**       
资源限制是指在进行并发编程时，程序的执行速度受限于计算机硬件资源或软件资源。        
例如:网络带宽 硬盘读写速度 CPU处理速度 数据库连接数  socket连接数等       


**资源限制引发的问题**        
在并发编程中，将代码执行速度加快的原则是将代码中串行执行的部分变成并发执行，        
但是如果将某段串行的代码并发执行，因为受限于资源，仍然在串行执行，这时候程序不仅不
会加快执行，反而会更慢，因为增加了上下文切换和资源调度的时间。



**如何解决资源限制的问题**       
对于硬件资源限制，可以考虑使用集群并行执行程序。       
对于软件资源限制，可以考虑使用资源池将资源复用。比如使用连接池将数据库和Socket
连接复用，或者在调用对方webservice接口获取数据时，只建立一个连接。        



**在资源限制情况下进行并发编程**        
如何在资源限制的情况下，让程序执行得更快呢？       
方法就是，根据不同的资源限制调整程序的并发度



