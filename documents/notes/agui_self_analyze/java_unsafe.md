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
compareAndSwapInt 、compareAndSwapLong  、compareAndSwapObject <br/>
park、unpark

### Memory
allocateMemory、reallocateMemory、freeMemory分别用于分配内存，扩充内存和释放内存


### offSet and indexScale
arrayBaseOffset方法可以获取数组第一个元素的偏移地址，例如 ARRAY_BOOLEAN_BASE_OFFSET、ARRAY_OBJECT_BASE_OFFSET

arrayIndexScale方法获取数组的转换因子，也就是数组中元素的地址增量，例如ARRAY_BOOLEAN_INDEX_SCALE、ARRAY_OBJECT_INDEX_SCALE

配合arrayBaseOffset与arrayIndexScale可以定位数组中每个元素在内存中的位置.



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



