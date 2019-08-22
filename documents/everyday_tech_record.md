- 目录
{:toc #markdown-toc}	

## 2019-08-22
Gradle buildscript的解释		<br/>
https://www.jianshu.com/p/322f1427401b

Gradle		<br/>
https://dongchuan.gitbooks.io/gradle-user-guide-/
https://www.w3cschool.cn/gradle/
https://www.cnblogs.com/davenkin/p/gradle-learning-1.html


todo ::::Plugin : java maven war jetty


## 2019-08-21

C语言宏定义中do{}while(0)的用法原因 <br/>
http://www.spongeliu.com/415.html



Redis中内存分配  以及  基于的原理   <br/> 
https://zhuanlan.zhihu.com/p/51056407
https://zhuanlan.zhihu.com/p/51056407
https://zhuanlan.zhihu.com/p/38276637
https://halelu.github.io/2017/09/Redis-Source-Code-1/
https://blog.csdn.net/guodongxiaren/article/details/44747719
https://developer.apple.com/library/archive/documentation/
System/Conceptual/ManPages_iPhoneOS/man3/malloc_size.3.html



## 2019-8-20

Mybatis   <br/>
https://www.tutorialspoint.com/mybatis/index.htm
http://www.mybatis.org/mybatis-3/


Spring JDBC   <br/>
https://docs.spring.io/spring/docs/4.0.x/spring-framework-reference/html/jdbc.html

Java Mysql-jdbc tutorials   <br/>
http://www.herongyang.com/MySQL/Java-Program-and-MySQL-Server.html
https://www.tutorialspoint.com/jdbc/
https://www.javatpoint.com/java-jdbc
http://www.herongyang.com/JDBC/


## 2019-08-16

spring jdbc    <br/>
https://docs.spring.io/spring/docs/4.0.x/spring-framework-reference/html/jdbc.html
https://docs.spring.io/spring/docs/5.1.9.RELEASE/spring-framework-reference/data-access.html#jdbc

Java JDBC    <br/>
https://docs.spring.io/spring/docs/5.1.9.RELEASE/spring-framework-reference/data-access.html#jdbc
http://www.herongyang.com/JDBC/MySQL-JDBC-Driver.html
http://www.herongyang.com/JDBC/MySQL-PreparedStatement.html



JdbcTemplate is the central class in the JDBC core package. It handles the creation and release of resources, which helps you avoid common errors, such as forgetting to close the connection. It performs the basic tasks of the core JDBC workflow (such as statement creation and execution), leaving application code to provide SQL and extract results. The JdbcTemplate class:
* Runs SQL queries
* Updates statements and stored procedure calls
* Performs iteration over ResultSet instances and extraction of returned parameter values.
* Catches JDBC exceptions and translates them to the generic, more informative, exception hierarchy defined in the org.springframework.dao package. 



The NamedParameterJdbcTemplate class wraps a JdbcTemplate and delegates to the wrapped JdbcTemplate to do much of its work.    <br/>
 The NamedParameterJdbcTemplate class wraps a classic JdbcTemplate template. If you need access to the wrapped JdbcTemplate instance to access functionality that is present only in the JdbcTemplate class, you can use thegetJdbcOperations() method to access the wrapped JdbcTemplate through the JdbcOperations interface.



Controlling Database Connections    <br/>
在spring中，常用的连接池有：jdbc,dbcp,c3p0,JNDI4种，他们有不同的优缺点和适用场景

Spring obtains a connection to the database through a DataSource. A DataSource is part of the JDBC specification and is a generalized connection factory. It lets a container or a framework hide connection pooling and transaction management issues from the application code. As a developer, you need not know details about how to connect to the database. That is the responsibility of the administrator who sets up the datasource. You most likely fill both roles as you develop and test code, but you do not necessarily have to know how the production data source is configured.


When you use Spring’s JDBC layer, you can obtain a data source from JNDI, or you can configure your own with a connection pool implementation provided by a third party. Popular implementations are Apache Jakarta Commons DBCP and C3P0. Implementations in the Spring distribution are meant only for testing purposes and do not provide pooling.


You should use the DriverManagerDataSource class only for testing purposes, since it does not provide pooling and performs poorly when multiple requests for a connection are made.


Todo Spring-jdbc:    <br/>
Controlling Database Connections    <br/>
Using SQLExceptionTranslator    <br/>
管理数据库资源:连接 提交 异常    <br/>
模板模式

## 2019-08-13

**URL**   <br/>
URL is an acronym for Uniform Resource Locator and is a reference (an address) to a resource on the Internet.   <br/>
URLs are "write-once" objects. Once you've created a URL object, you cannot change any of its attributes (protocol, host name, filename, or port number).

https://docs.oracle.com/javase/tutorial/networking/urls/index.html
http://web.archive.org/web/20051219043731/http://archive.ncsa.uiuc.edu/SDG/Software/Mosaic/Demo/url-primer.html
https://www.geeksforgeeks.org/url-class-java-examples/
https://webmasters.stackexchange.com/questions/19101/what-is-the-difference-between-a-uri-and-a-url
https://stackoverflow.com/questions/176264/what-is-the-difference-between-a-uri-a-url-and-a-urn




**Class-loader and Class-Path**     <br/>
https://www.geeksforgeeks.org/classloader-in-java/
https://www.oracle.com/technetwork/articles/java/classloaders-140370.html
https://docs.oracle.com/javase/tutorial/ext/basics/load.html
https://docs.oracle.com/javase/tutorial/ext/basics/index.html
https://stackoverflow.com/questions/2424604/what-is-a-java-classloader


A bootstrap class loader that is built into the JVM is responsible for loading the classes of the Java runtime. This class loader only loads classes that are found in the boot classpath, and since these are trusted classes, the validation process is not performed as for untrusted classes. In addition to the bootstrap class loader, the JVM has an extension class loader responsible for loading classes from standard extension APIs, and a system class loader that loads classes from a general class path as well as your application classes.


Since there is more than one class loader, they are represented in a tree whose root is the bootstrap class loader. Each class loader has a reference to its parent class loader. When a class loader is asked to load a class, it consults its parent class loader before attempting to load the item itself. The parent in turn consults its parent, and so on. So it is only after all the ancestor class loaders cannot find the class that the current class loader gets involved. In other words, a delegation model is used.


When the runtime environment needs to load a new class for an application, it looks for the class in the following locations, in order:   <br/>
 1.Bootstrap classes: the runtime classes in rt.jar, internationalization classes in i18n.jar, and others.   <br/>
 2.Installed extensions: classes in JAR files in the lib/ext directory of the JRE, and in the system-wide, platform-specific extension directory (such as /usr/jdk/packages/lib/ext on the Solaris™ Operating System, but note that use of this directory applies only to Java™ 6 and later).   <br/>
 3.The class path: classes, including classes in JAR files, on paths specified by the system property java.class.path. If a JAR file on the class path has a manifest with the Class-Path attribute, JAR files specified by the Class-Path attribute will be searched also. By default, the java.class.path property's value is ., the current directory. You can change the value by using the -classpath or -cp command-line options, or setting the CLASSPATH environment variable. The command-line options override the setting of the CLASSPATH environment variable.



Option:	-verbose:class
Option:	-Djava.security.manager
System.out.println("boot:"+System.getProperty("sun.boot.class.path"));
System.out.println("ext:"+System.getProperty("java.ext.dirs"));
System.out.println("app:"+System.getProperty("java.class.path"));


选项-verbose:class打印class被加载的日志    <br/>
java -verbose:class  HelloApp


## 2019-08-12

动态代理:JDK 和CGLIB，Javassist，ASM <br/>
https://blog.csdn.net/luanlouis/article/details/24589193
代理模式

ASM 是一个 Java 字节码操控框架。它能够以二进制形式修改已有类或者动态生成类。ASM 可以直接产生二进制 class 文件，也可以在类被加载入 Java 虚拟机之前动态改变类行为。ASM 从类文件中读入信息后，能够改变类行为，分析类信息，甚至能够根据用户要求生成新类。

不过ASM在创建class字节码的过程中，操纵的级别是底层JVM的汇编指令级别，这要求ASM使用者要对class组织结构和JVM汇编指令有一定的了解。


Javassist是一个开源的分析、编辑和创建Java字节码的类库。直接使用java编码的形式，而不需要了解虚拟机指令，就能动态改变类的结构，或者动态生成类。


JDK通过 java.lang.reflect.Proxy包来支持动态代理, InvocationHandler <br/>
JDK提供了sun.misc.ProxyGenerator.generateProxyClass(String proxyName,class[] interfaces) 底层方法来产生动态代理类的字节码：<br/>
JDK中提供的生成动态代理类的机制有个鲜明的特点是： 某个类必须有实现的接口，而生成的代理类也只能代理某个类接口定义的方法


cglib（Code Generation Library) 生成动态代理类的机制----通过类继承,以在运行期扩展Java类与实现Java接口.

cglib 创建某个类A的动态代理类的模式是： <br/>
	1.   查找A上的所有非final 的public类型的方法定义；<br/>
	2.   将这些方法的定义转换成字节码；<br/>
	3.   将组成的字节码转换成相应的代理的class对象；<br/>
	4.   实现 MethodInterceptor接口，用来处理 对代理类上所有方法的请求（这个接口和JDK动态代理InvocationHandler的功能和角色是一样的）

## 2019-08-05
JMX <br/>
https://docs.oracle.com/javase/tutorial/jmx/index.html <br/>
https://docs.oracle.com/javase/8/docs/technotes/guides/management/toc.html <br/>
-Dcom.sun.management.jmxremote  <br/>
-Dcom.sun.management.jmxremote.port=portNum <br/>
-Dcom.sun.management.jmxremote.authenticate=false <br/> 
-Dcom.sun.management.jmxremote.ssl=false <br/>


常见的java命令选项 <br/>
http://demo.bullfrog.live/jvm/environment

常见的java gc相关 <br/>
http://www.herongyang.com/Java-GC/


-Djava.security.egd=file:/dev/./urandom <br/>
https://stackoverflow.com/questions/137212/how-to-solve-slow-java-securerandom  <br/>
https://ruleoftech.com/2016/avoiding-jvm-delays-caused-by-random-number-generation  <br/>
http://www.thezonemanager.com/2015/07/whats-so-special-about-devurandom.html  <br/>
https://bugs.openjdk.java.net/browse/JDK-6202721  <br/>



-Djava.net.preferIPv4Stack=true <br/>
https://docs.oracle.com/javase/8/docs/api/java/net/doc-files/net-properties.html <br/>
https://stackoverflow.com/questions/9882357/how-to-set-java-net-preferipv4stack-true-at-runtime <br/>
https://docs.oracle.com/javase/8/docs/technotes/guides/net/ipv6_guide/ <br/>
https://github.com/netty/netty/issues/5657 <br/>



-XX:ErrorFile <br/>
https://docs.oracle.com/javase/8/docs/technotes/guides/troubleshoot/felog001.html <br/>
https://stackoverflow.com/questions/22618582/java-how-to-specify-jvm-argument-xxerrorfile-and-preserve-automatic-pid-in-fi


-XX:HeapDumpOnOutOfMemoryError  <br/>
 -XX:HeapDumpPath <br/>
https://docs.oracle.com/javase/8/docs/technotes/guides/troubleshoot/clopts001.html#CHDFDIJI



-agentlib:jdwp <br/>
https://docs.oracle.com/javase/8/docs/technotes/tools/unix/jdb.html <br/>
https://www.ibm.com/support/knowledgecenter/en/SSYKE2_8.0.0/com.ibm.java.80.doc/user/jdb.html





-Xms256m -Xmx2048m <br/>
Java -X查看非标准项的设置 <br/>
https://stackoverflow.com/questions/14763079/what-are-the-xms-and-xmx-parameters-when-starting-jvm


-XX:+UseG1GC  <br/>
https://stackoverflow.com/questions/2881827/how-does-the-garbage-first-garbage-collector-work <br/>
https://docs.oracle.com/javase/7/docs/technotes/guides/vm/G1.html



-XX:-OmitStackTraceInFastThrow 
https://stackoverflow.com/questions/2411487/nullpointerexception-in-java-with-no-stacktrace



 -XX:+PrintGCDetails  <br/>
-XX:+PrintGCDateStamps  <br/>
https://blog.gceasy.io/2016/02/22/understand-garbage-collection-log/#more-401


-XX:+PrintGCApplicationConcurrentTime  <br/>
-XX:+PrintGCApplicationStoppedTime  <br/>
https://stackoverflow.com/questions/29666057/analyzing-gc-logs/29673564#29673564
http://www.herongyang.com/Java-GC/


## 2019-08-02
阅读::Linux网络编程(第二版)

编程环境:编辑器vim   gcc makefile  gdb  cmake     

Gcc
编译:		生成目标文件;		多文件编译;		-E预处理;		-S生成汇编语言;		gcc常用选项<br/>
头文件和库文件的默认搜索路径<br/>
静态链接库<br/>
动态链接库<br/>


Makefile<br/>
	http://www.cs.colby.edu/maxwell/courses/tutorials/maketutor/
	https://www.tutorialspoint.com/makefile/
	https://makefiletutorial.com/            
	https://opensource.com/article/18/8/what-how-makefile
	https://www.gnu.org/software/make/manual/html_node/index.html#toc-An-Introduction-to-Makefiles
	https://www.cs.swarthmore.edu/~newhall/unixhelp/howto_makefiles.html


GDB<br/>
	https://www.kancloud.cn/wizardforcel/gdb-tips-100/146708 <br/>
	**gdbinit**<br/>
	https://github.com/cyrus-and/gdb-dashboard	https://www.helplib.com/GitHub/article_129194
	https://www.cntofu.com/book/46/gdb/gdb_dashboard_debug_info_at_a_glance.md        	https://www.helplib.com/GitHub/article_129194 <br/>
	https://github.com/gdbinit/Gdbinit <br/>
	https://github.com/longld/peda <br/>
	https://github.com/hugsy/gef <br/>
	堆栈查看;	汇编含义的解读;	寄存器查看;	memeory查看


## 2019-07-26

https://zookeeper.apache.org/doc/r3.5.5/recipes.html#sc_leaderElection
<br/>分析zookeeper源码中的选举方案LeaderElectionSupportTest

查询到资料: 关于分布式的Shared Reentrant Read Write Lock<br/>
https://github.com/Netflix/curator/wiki/Shared-Reentrant-Read-Write-Lock
Apache-curator

https://github.com/fpj/zookeeper-book-example


## 2019-07-25


**ZooKeeper Recipes and Solutions**
https://zookeeper.apache.org/doc/r3.5.5/recipes.html#sc_leaderElection


**Zookeeper Atomic Broadcast (ZAB)**
https://zookeeper.apache.org/doc/r3.2.2/zookeeperInternals.html
https://distributedalgorithm.wordpress.com/tag/zookeeper/
 
**I0Itec-zkClient**
http://jm.taobao.org/2011/07/15/1047/
https://shift-alt-ctrl.iteye.com/blog/1955740
https://www.cnblogs.com/rilley/p/5451052.html



## 2019-07-24

**Zookeeper Leader Election**<br/>
https://zookeeper.apache.org/doc/r3.5.5/recipes.html#sc_leaderElection
https://www.tutorialspoint.com/zookeeper/zookeeper_leader_election
https://github.com/ruiposse/zookeeper-leader-election/blob/master/src/client/ZooKeeperClientThree.java
https://www.allprogrammingtutorials.com/tutorials/leader-election-using-apache-zookeeper.php
https://www.outbrain.com/techblog/2011/07/leader-election-with-zookeeper/



分类slf4j  logback  log4j2 jdk  jcl   log4j  
	spring中的log用的是org.apache.commons.logging
slf4j-api，logback结合使用
http://www.logback.cn/
https://segmentfault.com/a/1190000008315137#articleHeader9
https://segmentfault.com/a/1190000008315137
https://blog.csdn.net/johnson_moon/article/details/77532583
https://cloud.tencent.com/developer/article/1329362



配置:logback.xml   alps-logger.xml	RootLogger	RuntimeLoggerConfigure	LoggerFactory


**java==操作符**<br/>
https://stackoverflow.com/questions/7520432/what-is-the-difference-between-and-equals-in-java
https://stackoverflow.com/questions/1586223/how-does-the-tostring-equals-object-methods-work-differently-or-similar


**Autoboxing and unboxing**<br/>
https://stackoverflow.com/questions/27647407/why-do-we-use-autoboxing-and-unboxing-in-java
https://docs.oracle.com/javase/tutorial/java/data/autoboxing.html

Converting a primitive value (an int, for example) into an object of the corresponding wrapper class (Integer) is called autoboxing. The Java compiler applies autoboxing when a primitive value is:
* Passed as a parameter to a method that expects an object of the corresponding wrapper class.
* Assigned to a variable of the corresponding wrapper class.

Converting an object of a wrapper type (Integer) to its corresponding primitive (int) value is called unboxing. The Java compiler applies unboxing when an object of a wrapper class is:
* Passed as a parameter to a method that expects a value of the corresponding primitive type.
* Assigned to a variable of the corresponding primitive type.



|Primitive type	|Wrapper class|
| --- | --- |
|boolean|	Boolean|
|byte	|Byte|
|char	|Character|
|float	|Float|
|int	|Integer|
|long	|Long|
|short	|Short|
|double	|Double|




## 2019-07-23
how ZooKeeper works as well how to work with it?

ZooKeeper concept
- The ZooKeeper Data Model
- ZooKeeper Sessions
- ZooKeeper Watches
- ZooKeeper access control using ACLs
- Consistency Guarantees

practical programming
* Building Blocks: A Guide to ZooKeeper Operations
* Bindings
* Program Structure, with Simple Example 
* Gotchas: Common Problems and Troubleshooting

**The ZooKeeper Data Model**<br/>
a hierarchal name space, each node in the namespace can have data associated with it as well as children.

**zNodes**<br/>
Every node in a ZooKeeper tree is referred to as a znode.
			
**ZooKeeper Stat Structure**<br/>
- czxid :The zxid of the change that caused this znode to be created.
- mzxid :The zxid of the change that last modified this znode.
- pzxid :The zxid of the change that last modified children of this znode.
- ctime :The time in milliseconds from epoch when this znode was created.
- mtime :The time in milliseconds from epoch when this znode was last modified.
- version :The number of changes to the data of this znode.
- cversion :The number of changes to the children of this znode.
- aversion :The number of changes to the ACL of this znode.
- ephemeralOwner :The session id of the owner of this znode if the znode is an ephemeral node. If it is not an ephemeral node, it will be zero.
- dataLength :The length of the data field of this znode.
- numChildren The number of children of this znode.




**Watches**<br/>
Clients can set watches on znodes. Changes to that znode trigger the watch and then clear the watch. When a watch triggers, ZooKeeper sends the client a notification.
	
	
	
**Data Access**<br/>
The data stored at each znode in a namespace is read and written atomically. Reads get all the data bytes associated with a znode and a write replaces all the data. <br/>
Each node has an Access Control List (ACL) that restricts who can do what.



**Ephemeral Nodes**<br/>
exists as long as the session that created the znode is active. When the session ends the znode is deleted. Because of this behavior ephemeral znodes are not allowed to have children.
			
			
**Sequence Nodes -- Unique Naming**<br/>
When creating a znode you can also request that ZooKeeper append a monotonically increasing counter to the end of path.<br/>
Queue Recipe example uses this feature.<br/>
			 

**Container Nodes**<br/>
When the last child of a container is deleted, the container becomes a candidate to be deleted by the server at some point in the future.<br/>
Given this property, you should be prepared to get KeeperException.NoNodeException when creating children inside of container znodes.
			
**TTL Nodes**<br/>
If the znode is not modified within the TTL and has no children it will become a candidate to be deleted by the server at some point in the future.



**Time in ZooKeeper**
<br/>**Zxid**<br/>
1.Every change to the ZooKeeper state receives a stamp in the form of a zxid (ZooKeeper Transaction Id). <br/>
2.This exposes the total ordering of all changes to ZooKeeper. Each change will have a unique zxid and if zxid1 is smaller than zxid2 then zxid1 happened before zxid2.
<br/>**Version numbers**<br/>
1.Every change to a node will cause an increase to one of the version numbers of that node. <br/>
2.The three version numbers are version (number of changes to the data of a znode), cversion (number of changes to the children of a znode), and aversion (number of changes to the ACL of a znode).
<br/>**Ticks**<br/>
1.When using multi-server ZooKeeper, servers use ticks to define timing of events such as status uploads, session timeouts, connection timeouts between peers, etc. <br/>
2.The tick time is only indirectly exposed through the minimum session timeout (2 times the tick time); <br/>
3.if a client requests a session timeout less than the minimum session timeout, the server will tell the client that the session timeout is actually the minimum session timeout.
<br/>**Real time**<br/>
ZooKeeper doesn't use real time, or clock time, at all except to put timestamps into the stat structure on znode creation and znode modification

## 2019-07-22

分布式系统是同时跨越多个物理主机，独立运行的多个软件组件所组成的系统。

主节点选举、崩溃检测和元数据存储(大多数流行的任务，如选举主节点，跟踪有效的从节点，维 护应用元数据)

ZooKeeper使用共享存储模型来实现应用间 的协作和同步原语。对于共享存储本身，又需要在进程和存储间进行网络通信。

消息延迟	处理器性能	时钟偏移


实现主-从模式的系统，必须解决三个关键问题：<br/>
**主节点崩溃**<br/> 1.新的主要主节点需要能够恢复到旧的主要主节点崩溃时的状态<br/>
2.主节点有效，备份主节点却 认为主节点已经崩溃<br/> 3.网络分区,出现脑裂(系统中两个或者多个部分开始独立工作，导致整体行为不一致性)<br/>

**从节点崩溃**<br/>
1.主节点具有检测从节点的崩溃的能力<br/>
2.从节点也许执行了部分任务，也许全部执行完，但没有报告结果。如果整个运算过程产生了其他 作用，有必要执行某些恢复过程来清除之前的状态

**通信故障**<br/>
1.多个从节点执行相同任务的可能性(比如网络分区导致，重新分配一个任务可能会导致两个从节点执 行相同的任务)<br/>
2.通信故障导致的对锁等同步原语的影响<br/>
			
首先，客户端可以告诉ZooKeeper某些数据的状态是临时状态 （ephemeral）；其次，同时ZooKeeper需要客户端定时发送是否存活的 通知，如果一个客户端未能及时发送通知，那么所有从属于这个客户端 的临时状态的数据将全部被删除。		通过这两个机制，在崩溃或通信故障 发生时，我们就可以预防客户端独立运行而发生的应用宕机。

如果我们不能控制系统中的消息延迟， 就不能确定一个客户端是崩溃还是运行缓慢，因此，当我们猜测一个客 户端已经崩溃，而实际上我们也需要假设客户端仅仅是执行缓慢，其在后续还可能执行一些其他操作。



<br/><br/>
**分布式协作的难点**<br/>
1.应用启动后，所有不同的进程通过某种方法，需要知道应用的配置信息<br/>
2.配置信息也许发生了变化，所有进 程需要变更配置信息<br/>
3.组成员关系的问题，当负载变化时，我们 希望增加或减少新机器和进程<br/>

在开发分布式应用时，就会遇到真正 困难的问题，就不得不面对故障，如崩溃、通信故障等各种情况。这 些问题会在任何可能的点突然出现，甚至无法列举需要处理的所有的情 况。	



FLP定律:证明了在 异步通信的分布式系统中，进程崩溃，所有进程可能无法在这个比特位 的配置上达成一致

CAP定律:一致性 （Consistency）、可用性（Availability）和分区容错性（Partitiontolerance），该定律指出，当设计一个分布式系统时，我们希望这三种 属性全部满足，但没有系统可以同时满足这三种属性
ZooKeeper的设计尽可能满足一致性和可用性，当然，在发生网络分区 时ZooKeeper也提供了只读能力。




## 2019-07-19
Disruptor源码中的perfTest

**Latency Performance Testing**	<br/>
PingPongQueueLatencyTest VS PingPongSequencedLatencyTest



**Throughput Performance Test** <br/>	

Unicast:1P-1C	 <br/>		
OneToOneQueueThroughputTest   OneToOneQueueBatchedThroughputTest  <br/>
VS    <br/>						 
OneToOneSequencedThroughputTest  OneToOneSequencedBatchThroughputTest   OneToOneSequencedPollerThroughputTest   OneToOneSequencedLongArrayThroughputTest 


Pipeline: 1P – 3C <br/>		
OneToThreePipelineQueueThroughputTest
VS
OneToThreePipelineSequencedThroughputTest


Sequencer: 3P – 1C <br/>		
ThreeToOneQueueThroughputTest    VS    ThreeToOneSequencedThroughputTest   ThreeToOneSequencedBatchThroughputTest


Multicast: 1P – 3C <br/>
OneToThreeQueueThroughputTest   VS   OneToThreeSequencedThroughputTest


Diamond: 1P – 3C	<br/>		
OneToThreeDiamondQueueThroughputTest   VS   OneToThreeDiamondSequencedThroughputTest






## 2019-07-18
Disruptor源码中的test阅读



## 2019-07-17
读Disruptor源码, 结合下图已梳理流程清晰

![Disruptor Concepts]({{ site.baseurl }}/imgs/everyday_tech_record/disruptor_concepts.png)

```
/**
 *
 * Disruptor:
 * ==========
 *                        track to prevent wrap
 *             +---------------------------------------------------+
 *             |                                                   | 
 *             |              get                                  | 
 *             |  +----------------------------+                   |
 *             |  |                            |                   v
 *             |  v                            |             +-----EP2
 * +----+    +====+    +====+   +-----+     +====+  waitFor  |
 * | P1 |--->| RB |<---| SB1|   | EP1 |<----|SB2 |<----------+
 * +----+    +====+    +====+   +-----+     +====+           |
 *      claim  |   get    ^        |                         |
 *             |          |        |                         +-----EP3
 *             |          +--------+                               ^
 *             |            waitFor                                |
 *             |                                                   |
 *             +---------------------------------------------------+
 *                  track to prevent wrap
 *
 * P1   - Publisher 1    ;publish时会发完signal,唤醒waitFor
 * RB   - RingBuffer
 * SB1  - SequenceBarrier 1 ;使用的dependentSequence是ringBuffer的cursor
 * EP1  - EventProcessor 1  ;
 * SB2  - SequenceBarrier 2 ;使用的dependentSequence是EP1的消费执行位置sequence,确保EP2和EP3消费时不超过EP1
 * EP2  - EventProcessor 2  ;
 * EP3  - EventProcessor 3  ;
 *
 */
 ```
￼
 
 




## 2019-07-16 待整理
//a Store/Store barrier between this write and any previous store.   <br/>
UNSAFE.putOrderedLong(this, VALUE_OFFSET, value);   <br/>
https://bugs.java.com/bugdatabase/view_bug.do?bug_id=6275329   <br/>
https://stackoverflow.com/questions/1468007/atomicinteger-lazyset-vs-set/14020946


//Store/Store barrier between this write and any previous write and a Store/Load barrier between this write and any subsequent volatile read.    <br/>
UNSAFE.putLongVolatile(this, VALUE_OFFSET, value);


Unsafe.putLong    <br/>
区别是什么???   <br/>
https://stackoverflow.com/questions/1468007/atomicinteger-lazyset-vs-set/14020946   <br/>
https://stackoverflow.com/questions/48615456/what-is-difference-between-getxxxvolatile-vs-getxxx-in-java-unsafe   <br/>
http://www.cs.umd.edu/~pugh/java/memoryModel/jsr-133-faq.html#conclusion   <br/>
https://www.cnblogs.com/mickole/articles/3757278.html   <br/>
https://stackoverflow.com/questions/30600621/java-unsafe-storefence-documentation-wrong   <br/>
https://www.jianshu.com/p/2ab5e3d7e510   <br/>
http://gee.cs.oswego.edu/dl/jmm/cookbook.html   <br/>




为了保证内存可见性，Java编译器在生成指令序列的适当位置会插入内存屏障指令来禁 止特定类型的处理器重排序。JMM把内存屏障指令分为4类

LoadLoad Barriers:     Load1; LoadLoad; Load2   <br/>	确保Load1的读取指令，执行先于，load2及load2后续的读取指令   <br/>
LoadStore Barries:	    Load1; LoadStore; Store2   <br/>	确保Load1的读取指令，执行先于，Store2及Store2后续的存储指令   <br/>
StoreStore Barries:     Store1; StoreStore; Store2   <br/>	确保Store1的存储指令，执行先于，Store2及Store2后续的存储指令   <br/>
StoreLoad Barries:     Store1; StoreLoad; Load2   <br/>	确保Store1的存储指令，执行先于，load2及load2后续的读取指令   <br/>

StoreLoad Barriers是一个“全能型”的屏障，它同时具有其他3个屏障的效果。现代的多处 理器大多支持该屏障（其他类型的屏障不一定被所有处理器支持）。执行该屏障开销会很昂 贵，因为当前处理器通常要把写缓冲区中的数据全部刷新到内存中（Buffer Fully Flush）。



volatile写的内存语义如下。 当写一个volatile变量时，JMM会把该线程对应的本地内存中的共享变量值刷新到主内 存。   <br/>
volatile读的内存语义如下。 当读一个volatile变量时，JMM会把该线程对应的本地内存置为无效。线程接下来将从主 内存中读取共享变量。

在每个volatile写操作的前面插入一个StoreStore屏障。    <br/>
在每个volatile写操作的后面插入一个StoreLoad屏障。    <br/>
在每个volatile读操作的后面插入一个LoadLoad屏障。    <br/>
在每个volatile读操作的后面插入一个LoadStore屏障。   <br/>


https://stackoverflow.com/questions/15360598/what-does-a-loadload-barrier-really-do





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
- io密集型、计算密集型、混合型的任务下场景的选择


## 2019-07-10

读ArrayBlockingQueue LinkedBlockingQueue SynchronousQueue实现,<br/>
看注释时查询到的资料jdk中集合的简介: <br/>
https://docs.oracle.com/javase/8/docs/technotes/guides/collections/index.html <br/>
https://docs.oracle.com/javase/tutorial/index.html <br/>

**ArrayBlockingQueue**
```
	//ArrayBlockingQueue:通过生成消费的模式,使用lock + notEmpty + notFull同步
	
	Object[] items;  //The queued items
	int takeIndex;   //items index for next take, poll, peek or remove 
	int putIndex;    //items index for next put, offer, or add 
	int count;       //Number of elements in the queue 
	final ReentrantLock lock;      //Main lock guarding all access 
	private final Condition notEmpty;      //Condition for waiting takes 
	private final Condition notFull; 	//Condition for waiting puts 
```

**LinkedBlockingQueue** 实现核心是:<br/>
count == capacity时插入数据，不需要等待的方法插入失败,需要等待的方法通过notFull等待，插入数据后如果count < capacity,notFull发出signal通知.  <br/>
count == 0时获取数据,不需要等待的方法返回null,需要等待的方法通过notEmpty等待，获取数据后如果count>0,notEmpty发出signal通知.   <br/>
```
 //Linked list node class
static class Node<E> {
    E item;
    /**
     * One of:
     * - the real successor Node
     * - this Node, meaning the successor is head.next
     * - null, meaning there is no successor (this is the last node)
     */
    Node<E> next;
    Node(E x) { item = x; }
}


private final int capacity;/** The capacity bound, or Integer.MAX_VALUE if none */
private final AtomicInteger count = new AtomicInteger();/** Current number of elements */

transient Node<E> head; //Head of linked list.Invariant: head.item == null
private transient Node<E> last;//Tail of linked list. Invariant: last.next == null

private final ReentrantLock takeLock = new ReentrantLock();    /** Lock held by take, poll, etc */
private final Condition notEmpty = takeLock.newCondition();    /** Wait queue for waiting takes */

private final ReentrantLock putLock = new ReentrantLock();    /** Lock held by put, offer, etc */
private final Condition notFull = putLock.newCondition();    /** Wait queue for waiting puts */
```


## 2019-07-11
读SynchronousQueue源码中关于TransferQueue的实现

参考: http://www.cs.rochester.edu/research/synchronization/pseudocode/duals.html <br/>
参考: http://www.cs.rochester.edu/u/scott/papers/2004_DISC_dual_DS.pdf <br/>
参考: https://juejin.im/post/5ae754c7f265da0ba76f8534


## 2019-07-12
sun.misc.Unsafe类
参考:http://www.docjar.com/docs/api/sun/misc/Unsafe.html <br/>
参考:http://mishadoff.com/blog/java-magic-part-4-sun-dot-misc-dot-unsafe/ <br/>

模拟的是Disruptor中的RingBuffer中的unsfe操作
```
//获取数组的转换因子，也就是数组中元素的地址增量
final int scale = unsafe.arrayIndexScale(Object[].class);
int REF_ELEMENT_SHIFT;
if (4 == scale) {
    REF_ELEMENT_SHIFT = 2;
} else if (8 == scale) {
    REF_ELEMENT_SHIFT = 3;
} else {
    System.out.println("error scale");
    return;
}
int BUFFER_PAD = 128 / scale;

int bufferSize = 2 * 2 * 2 * 2;
int indexMask = bufferSize - 1;


//实际数组的大小 = BUFFER_PAD + bufferSize + BUFFER_PAD;在有效元素的前后各有BUFFER_PAD个元素空位，用于做缓存行填充
Object[] entries = new Object[bufferSize + 2 * BUFFER_PAD];


//赋值时跳过了BUFFER_PAD个元素
for (int i = 0; i < bufferSize; i++) {
    entries[BUFFER_PAD + i] = new Element("name" + i, 200 + i);
}


//获取数组中真正保存元素数据的开始位置; BUFFER_PAD << REF_ELEMENT_SHIFT 实际上是BUFFER_PAD * scale的等价高效计算方式
int REF_ARRAY_BASE = unsafe.arrayBaseOffset(Object[].class) + (BUFFER_PAD << REF_ELEMENT_SHIFT);

//获取数组中的元素
for (int i = 0; i < bufferSize; i++) {
    System.out.println(unsafe.getObject(entries, REF_ARRAY_BASE + ((i & indexMask) << REF_ELEMENT_SHIFT)));
}
    
```



## 2019-07-15

算法ceilingNextPowerOfTwo的java实现
public static int ceilingNextPowerOfTwo(final int x){
    return 1 << (32 - Integer.numberOfLeadingZeros(x - 1));
}


equals 与 hashCode方法: 
https://www.geeksforgeeks.org/equals-hashcode-methods-java/
https://www.geeksforgeeks.org/override-equalsobject-hashcode-method/
https://stackoverflow.com/questions/27581/what-issues-should-be-considered-when-overriding-equals-and-hashcode-in-java



equals vs  operator==  
https://stackoverflow.com/questions/7520432/what-is-the-difference-between-and-equals-in-java
https://www.geeksforgeeks.org/difference-equals-method-java/


How to print address of an object?
https://stackoverflow.com/questions/18396927/how-to-print-the-address-of-an-object-if-you-have-redefined-tostring-method











