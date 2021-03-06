- 目录
{:toc #markdown-toc}	
# 网络


### 什么是网络


  网络就是几部计算机主机或者是网络打印机之类的接口设备， 透过网络线或者是无线网络的技术，将这些主机与设备连接起来， 使得数据可以透过网络媒体(网络线以及其他网络卡等硬件)来传输的一种方式。 

```
Ethernet & Token-Ring
ARPANET & TCP/IP 
Internet 
IEEE 标准规范
``` 


###  计算机网络组成组件

![网络组成组件]({{ site.baseurl }}/imgs/network/network_basics/network_components.png)

- **节点 (node)**：节点主要是具有网络地址 (IP) 的设备之称， 一般PC、Linux服务器、ADSL调制解调器与网络打印机等

- **服务器主机 (server)**：就网络联机的方向来说，提供数据以『响应』给用户的主机， 都可以被称为是一部服务器。

- **工作站 (workstation) 或客户端 (client)**：任何可以在计算机网络输入的设备都可以是工作站， 若以联机发起的方向来说，主动发起联机去『要求』数据的，就可以称为是客户端 (client)。

- **网络卡 (Network Interface Card, NIC)**：内建或者是外插在主机上面的一个设备， 主要提供网络联机的卡片，目前大都使用具有 RJ-45 接头的以太网络卡。一般 node 上都具有一个以上的网络卡， 以达成网络联机的功能。

- **网络接口**：利用软件设计出来的网络接口，主要在提供网络地址 (IP) 的任务。 一张网卡至少可以搭配一个以上的网络接口；而每部主机内部其实也都拥有一个内部的网络接口，那就是 loopback (lo) 这个循环测试接口！

- **网络形态或拓朴 (topology)**：各个节点在网络上面的链接方式，一般讲的是物理连接方式。 

- **网关 (route) 或通讯闸 (gateway)**：具有两个以上的网络接口， 可以连接两个以上不同的网段的设备，例如 IP 分享器就是一个常见的网关设备。那 ADSL 调制解调器算不算网关呢？ 其实不太能算，因为调制解调器通常视为一个在主机内的网卡设备，我们可以在一般 PC 上面透过拨号软件， 将调制解调器仿真成为一张实体网卡 (ppp) ，因此他不太能算是网关设备啦！



### 计算机网络区域范围

- 局域网络 (Local Area Network, LAN)  
- 广域网 (Wide Area Network, WAN)  

一般来说，LAN 指的是区域范围较小的环境，例如一栋大楼或一间学校，所以生活中有许许多多的 LAN 存在。 那这些 LAN 彼此串接在一起，全部的 LAN 串在一块就是一个大型的 WAN.  

目前可以使用『速度』作为一个网络区域范围的评量。 


### 计算机网络协议:OSI 七层协定


**OSI 七层协议各阶层的相关性**  
依据定义来说，越接近硬件的阶层为底层 (layer 1)，越接近应用程序的则是高层 (layer 7)。 不论是接收端还是发送端，每个一阶层只认识对方的同一阶层数据。

![osi_layer_to_layer]({{ site.baseurl }}/imgs/network/network_basics/osi_layer_to_layer.gif)  
<br><br>


**OSI 七层协议数据的传递方式**    
每个数据报的部分，上层的包裹是放入下层的数据中，而数据前面则是这个数据的表头。其中比较特殊的是第二层， 因为第二层 (数据链结层) 主要是位于软件封包 (packet) 以及硬件讯框 (frame) 中间的一个阶层， 他必须要将软件包装的包裹放入到硬件能够处理的包裹中，因此这个阶层又分为两个子层在处理相对应的数据。  
![osi_packet]({{ site.baseurl }}/imgs/network/network_basics/osi_packet.gif)  
<br><br>





**每一层负责的任务**  
OSI 七层协议只是一个参考的模型 (model)，网络社会并没有什么很知名的操作系统在使用 OSI 七层协定的联网程序代码。  
这是因为 OSI 所定义出来的七层协议在解释网络传输的情况来说，可以解释的非常棒，因此大家都拿 OSI 七层协议来做为网络的教学与概念的理解。至于实际的联网程序代码，那就交给 TCP/IP.  

| 分层序号       |分层    | 负责内容 | 
| :----:        | :----:| :---- | 
| Layer 1   | 物理层<br>Physical Layer     |   由于网络媒体只能传送 0 与 1 这种位串，因此物理层必须定义所使用的媒体设备之电压与讯号等， 同时还必须了解数据讯框转成位串的编码方式，最后连接实体媒体并传送/接收位串。 | 
| Layer 2   | 数据链结层<br>Data-Link Layer |   一层是比较特殊的一个阶层，因为底下是实体的定义，而上层则是软件封装的定义。因此第二层又分两个子层在进行数据的转换动作。<br> 在偏硬件媒体部分，主要负责的是 MAC (Media Access Control) ，我们称这个数据报裹为 MAC 讯框 (frame)， MAC 是网络媒体所能处理的主要数据报裹，这也是最终被物理层编码成位串的数据。MAC 必须要经由通讯协议来取得媒体的使用权， 目前最常使用的则是 IEEE 802.3 的以太网络协议。<br> 至于偏向软件的部分则是由逻辑链接层 (logical link control, LLC) 所控制，主要在多任务处理来自上层的封包数据 (packet) 并转成 MAC 的格式， 负责的工作包括讯息交换、流量控制、失误问题的处理等等。 |
| Layer 3   | 网络层<br>Network Layer      |     IP (Internet Protocol) 就是在这一层定义的。 同时也定义出计算机之间的联机建立、终止与维持等，数据封包的传输路径选择等等，因此这个层级当中最重要的除了 IP 之外，就是封包能否到达目的地的路由 (route) 概念！|
| Layer 4   | 传送层<br>Transport Layer    |   这一个分层定义了发送端与接收端的联机技术(如 TCP, UDP 技术)， 同时包括该技术的封包格式，数据封包的传送、流程的控制、传输过程的侦测检查与复原重新传送等等， 以确保各个数据封包可以正确无误的到达目的端。 |
| Layer 5   | 会谈层<br>Session Layer      |   在这个层级当中主要定义了两个地址之间的联机信道之连接与挂断，此外，亦可建立应用程序之对谈、 提供其他加强型服务如网络管理、签到签退、对谈之控制等等。如果说传送层是在判断资料封包是否可以正确的到达目标， 那么会谈层则是在确定网络服务建立联机的确认。 |
| Layer 6   | 表现层<br>Presentation Layer |   我们在应用程序上面所制作出来的数据格式不一定符合网络传输的标准编码格式的！ 所以，在这个层级当中，主要的动作就是：将来自本地端应用程序的数据格式转换(或者是重新编码)成为网络的标准格式， 然后再交给底下传送层等的协议来进行处理。所以，在这个层级上面主要定义的是网络服务(或程序)之间的数据格式的转换， 包括数据的加解密也是在这个分层上面处理。 |
| Layer 7   | 应用层<br>Application Layer  |   应用层本身并不属于应用程序所有，而是在定义应用程序如何进入此层的沟通接口，以将数据接收或传送给应用程序，最终展示给用户。 |


### 计算机网络协议： TCP/IP  


**OSI 与 TCP/IP 协议之相关性**    
![osi_layer_to_layer]({{ site.baseurl }}/imgs/network/network_basics/osi_tcpip.gif)  

一般来说，因为应用程序与程序设计师比较有关系，而网络层以下的数据则主要是操作系统提供的，因此， 我们又将 TCP/IP 当中的应用层视为使用者层，而底下的三层才是我们主要谈及的网络基础！<br>

那 TCP/IP 是如何运作的呢?  
0. 应用程序阶段：妳打开浏览器，在浏览器上面输入网址列，按下 [Enter]。此时网址列与相关数据会被浏览器包成一个数据， 并向下传给 TCP/IP 的应用层；
1. 应用层：由应用层提供的 HTTP 通讯协议，将来自浏览器的数据报起来，并给予一个应用层表头，再向传送层丢去；
2. 传送层：由于 HTTP 为可靠联机，因此将该数据丢入 TCP 封包内，并给予一个 TCP 封包的表头，向网络层丢去；
3. 网络层：将 TCP 包裹包进 IP 封包内，再给予一个 IP 表头 (主要就是来源与目标的 IP )，向链结层丢去；
4. 链结层：如果使用以太网络时，此时 IP 会依据 CSMA/CD 的标准，包裹到 MAC 讯框中，并给予 MAC 表头，再转成位串后， 利用传输媒体传送到远程主机上。



# TCP/IP的链接层相关协议


# TCP/IP 的网络层相关封包与数据


# TCP/IP 的传输层相关封包与数据




# Reference
[参考:鸟哥的linux私房菜](http://cn.linux.vbird.org/linux_server/0110network_basic.php)  
