- 目录
{:toc #markdown-toc}	

# Java sun.misc.Unsafe



## Reference
[Unsafe JavaDoc](http://www.docjar.com/docs/api/sun/misc/Unsafe.html) <br/>
[Unsafe example](http://mishadoff.com/blog/java-magic-part-4-sun-dot-misc-dot-unsafe/)

https://www.cnblogs.com/mickole/articles/3757278.html


## 获取Unsafe
直接Unsafe.getUnsafe()获取实例时SecurityException异常,原因是方法中会检查class是不是primary加载器加载的。

```
//通过反射获取
private static Unsafe unsafe;

static {
    try {
        Field theUnsafe = Unsafe.class.getDeclaredField("theUnsafe");
        theUnsafe.setAccessible(true);
        unsafe = (Unsafe) theUnsafe.get(null);
    } catch (Exception ignore) {
    }
}
```


## API



### Concurrency

### Memory
allocateMemory、reallocateMemory、freeMemory分别用于分配内存，扩充内存和释放内存





### 字段的定位
JAVA中对象的字段的定位可能通过staticFieldOffset方法实现，该方法返回给定field的内存地址偏移量，这个值对于给定的filed是唯一的且是固定不变的。

getIntVolatile方法获取对象中offset偏移地址对应的整型field的值,支持volatile load语义。

getLong方法获取对象中offset偏移地址对应的long型field的值

### 数组元素定位：

Unsafe类中有很多以BASE_OFFSET结尾的常量，比如ARRAY_INT_BASE_OFFSET，ARRAY_BYTE_BASE_OFFSET等，这些常量值是通过arrayBaseOffset方法得到的。arrayBaseOffset方法是一个本地方法，可以获取数组第一个元素的偏移地址。Unsafe类中还有很多以INDEX_SCALE结尾的常量，比如 ARRAY_INT_INDEX_SCALE ， ARRAY_BYTE_INDEX_SCALE等，这些常量值是通过arrayIndexScale方法得到的。arrayIndexScale方法也是一个本地方法，可以获取数组的转换因子，也就是数组中元素的增量地址。将arrayBaseOffset与arrayIndexScale配合使用，可以定位数组中每个元素在内存中的位置。




## Demo
**模拟的是Disruptor中的RingBuffer中的unsfe操作**
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

**AtomicInteger中的Unsafe样例**



