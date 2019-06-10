- 目录
{:toc #markdown-toc}	


## 基本数据类型
在C中，仅有4种基本数据类型:**整型、浮点型、指针和聚合类型(例如数组和结构)**,所有其他类型都是从这4中类型中组合派生来的。
#### 整型家族
包括字符、短整型、整型、长整型,都分为有符号和无符号两种。    
标准规定:长整型至少应该和整型一样长，整型至少应该和短整型一样长。     
ANSI标准规范的各种整型数值的最小允许范围:       

| 类型              | 最小范围                 | 
| :----------------:| :-----------------------:|
| char              | 0到127                   |
| signed char       | -127到127                |
| unsigned char     | 0到255                   |
| short int         | -32767到32767            |
| unsigned short int| 0到65535                 |
| int               | -32767到32767            |
| unsigned int      | 0到65536                 |
| long int          | -2147483647到2147483647  |
| unsigned long int | 0到4294967295            |

short int至少16位，long int至少32位。至于缺省的int究竟是16位还是32位，或者其他值，则有编译器设计者决定。缺省的char要么是signed char，要么是unsigned char,取决于编译器。 

头文件limits.h说明了各种不同的整数类型的特点。  
CHAR_BIT是字符型的位数(至少8位)。CHAR_MIN和CHAR_MAX定义了缺省字符类型的范围，他们或者应该与SCHAR_MIN和SCHANR_MAX相同，或者应该与0与USHCAR_MAX相同；MB_LEN_MAX规定了一个多字节字符最多允许的字符数量。

|类型 |	signed 最小值 |	signed 最大值|	unsigned 最大值|
|:---- |:------------ |:------------ |:------------ |
|字符	|SCHAR_MIN|SCHAR_MAX|UCHAR_MAX|
|短整型	|SHRT_MIN|SHRT_MAX|USHRT_MAX|		
|整型	|INT_MIN|INT_MAX|UINT_MAX|
|长整型 |LONG_MIN|LONG_MAX|ULONG_MAX|

##### 整型字面值
字面值这个术语是字面值常量的缩写---这是一种实体，指定了自身的值，并且不允许改变。命名常量(named constant,声明为constant的变量)的创建，与普通变量相似，区别在于，被初始化后值便不能改变。

当一个程序内出现整型字面值时，它是属于整型家族9种不同类型中的哪一种呢？    
十进制整型字面值可能是int、long或者unsigned long。缺省情况下，它是最短类型但能完整容纳这个值。    
八进制和十六进制字面值可能是类型是int、unsigned int 、long或 unsigned long，缺省情况下，字面值的类型就是上述类型中最短但足以容纳整个值的类型。    
字符常量的类型总是int,不能在他们后面添加unsigned或long后缀。    

可以在有些字面值后面添加一个后缀来改变缺省的规则    
字面值后缀L或l可以使这个整数被解释为long整数值。        
字面值后缀U或u可以使这个整数被解释为unsigned整型值。    
字面值后缀UL可以使这个整数被解释为unsigned long整型值。    



##### 枚举
枚举类型就是指它的值为符号常量而不是字面值的类型。

可以下面这种形式声明:
enum Jar_Type{CUP,PINT,QUART,HALF_GALLON,GALLON};     
声明变量 enum Jar_Type milk_jug, gas_can, medicine_bottle;     
这种类型的变量实际上以整型的方式存储，这些符号名的实际值都是整型值。这里CUP是0，PINT是1，以此类推。 

或者声明：enum Jar_Type{CUP=8,PINT=16,QUART=32,HALF_GALLON=64,GALLON=128};     
另外，只对部分符号名用这种方式进行赋值也是合法的。如果某个符号名未显示指定一个值，那么它的值就比前面那个符号名的值大1.


提示:    
符号名被当作整型常量处理，声明为枚举类型的变量实际上是整数类型.
#### 浮点

#### 指针


## 基本声明  

## typedef

## 常量

## 作用域

## 链接属性 

## 存储类型

## static关键字

## 作用域 存储类型示例

## 总结




