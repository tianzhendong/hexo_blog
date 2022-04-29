---
title: java容器
author: TianZD
top: true
cover: true
toc: true
mathjax: false
summary: java容器学习笔记，粗略学了一下，没有参考价值
tags:
  - java
  - 容器
  - 学习笔记
categories:
  - java
reprintPolicy: cc_by
abbrlink: 17ea147a
date: 2022-04-29 11:00:40
coverImg:
img:
password:
---



[TOC]

# 泛型

JDK1.5（即5.0）后增加，帮助我们建立类型安全的集合

**本质是数据类型的参数化**：

1. 把类型当作是参数一样进行传递；
2. <数据类型>只能是引用类型

好处：

1. 代码可读性更好，不用强制转换
2. 程序更加安全，只要编译时间没有警告，运行时期就不会出现ClassCastException异常；

## 类型擦除

编码时采用泛型写的参数类型，编译器会在编译时去掉，即“类型擦除”，类型参数再编译后会被替换成Object，运行时虚拟机并不知道泛型。

## 定义泛型

可以使用任何字符表示标识符，一般用下面的：

| 泛型标记 | 对应单词 | 说明                           |
| -------- | -------- | ------------------------------ |
| E        | Element  | 在容器中使用，表示容器中的元素 |
| T        | Type     | 表示普通的java类               |
| K        | Key      | 表示键，如map中的键key         |
| V        | Value    | 表示值                         |
| N        | Number   | 表示数值类型                   |
| ？       |          | 表示不确定的java类型           |

```java
//定义泛型类
public class Generic<T>{
    private T flag;
    public void setFlag(T flag){
        this.flag = flag;
    }
    public T getFlag(){
        return this.flag;
    }
}
```

```java
//泛型方法
public <泛型表示符号> void getName(泛型表示符号 name){

}
public <泛型表示符号> 泛型表示符号 getName(泛型表示符号 name){
}
```

```java
//静态方法定义，静态方法中不能使用类定义的泛型
public static<泛型表示符号> void getName(泛型表示符号 name){

}
public static<泛型表示符号> 泛型表示符号 getName(泛型表示符号 name){
}
```

```java
//通配符？，表示类型不确定的
public void showFlag(Generic<?> generic){

}

//通配符上限限定，如下，表示只能是number或者其子类
public void showFlag(Generic<? extend Number> generic){

}
//通配符下限限定，如下，表示只能是Integer或者其父类
public void showFlag(Generic<? super Integer> generic){

}
```

## 泛型总结

泛型主要用于编译阶段，编译生成的class文件不包含泛型中的类型信息，类型参数再编译后会被替换成Object

1. 基本类型不能用于泛型，但是可以用其对应的包装类

如
`Test<int> t;错误，可以用Test<Integer>t;`

2. 不能通过类型参数创建对象

T elm = new T();错误


# 容器

用来容纳和管理数据。

## 单例集合

将数据一个一个的进行存储；Collection接口，以单个数据未单位进行存储；

包括：

1. List接口：存储有序，可重复，“动态”数组，实现：ArrayList类、LinkedList类、Vector类
2. Set接口，存储无序，不可重复，数学中的“集合”,HashSet、TreeSet

## 双例集合

基于key与value的结构存储数据，Map接口，数学中的函数y=f（x）


# 单例集合

# Collection

Collection接口时单例集合的根接口，包括两个子接口List、Set接口

抽象方法：

| 方法                                | 说明                          |
| ----------------------------------- | ----------------------------- |
| boolean add(Object e)               | 增加元素                      |
| boolean remove(Object e)            | 删除                          |
| Boolean contains（Object e）        | 是否包含                      |
| int size（）                        | 元素数量                      |
| Boolean isEmpty（）                 | 是否为空                      |
| void clear（）                      | 清空所有元素                  |
| Iterator iterator（）               | 获取迭代器，用于遍历所有元素  |
| Boolean containsAll（Collection c） | 判断是否包含C容器中的所有元素 |
| Boolean addAll（Collection c）      | 将c中所有元素加到该容器       |
| Boolean removeAll（c）              | 移出和c容器中都包含的元素     |
| Boolean retainAll（c）              | 移除c中没有的元素             |
| Object[] toArray()                  | 转化成Object数组              |

# list接口

有序、可重复，有序只是存储有顺序

| 方法                           | 说明                                         |
| ------------------------------ | -------------------------------------------- |
| void add(int index,Object e    | 再指定位置插入元素，其余元素后移一位         |
| Object set(int index, Object e | 修改指定位置的元素，原来位置的元素的值返回   |
| Object get（int index）        | 返回指定位置的元素                           |
| Object remove(int index)       | 删除元素，并返回删除的元素                   |
| int indexOf(Object o)          | 返回第一匹配元素的索引，若无，则返回-1       |
| int lastIndexOf(Object o)      | 返回最后一个匹配到的元素索引，若无，则返回-1 |

## ArrayList容器类

LIst接口的实现类，是List存储特征的具体实现，

底层使用数组实现的存储，**特点：查询效率高（使用数组实现），增删效率低（增删后其余元素的索引都要变），线程不安全。**

## 方法使用

```java
package container;
import java.util.ArrayList;
import java.util.List;
/**
 * test ArrayList
 */
public class ArrayListTest {
    public static void main(String[] args) {
        //实例化，通过list引用指向ArrayList对象
        List<String> list = new ArrayList< >();

        //添加元素
        System.out.println(list.add("tian"));   //通过collection接口中的方法添加元素，并返回true
        list.add(1,"zhen");     //通过List接口方法添加元素
        list.add(2,"dong");     //通过List接口方法添加元素

        //获取元素
        //System.out.println(list.get(0));    //返回第一个元素
        for(int i = 0;i< list.size();i++){
            System.out.println(list.get(i));
        }

        //判断是否包含某元素
        System.out.println("是否包含tian："+list.contains("tian"));

        //查找元素位置
        System.out.println(list.indexOf("tian"));   //返回第一次出现tian的位置
        System.out.println(list.lastIndexOf("tian"));   //返回最后一次出现tian的位置

        //删除元素
        String str1 = list.remove(0);   //删除第一个元素并返回,List定义，删除指定位置
        System.out.println("删除的元素："+ str1);

        boolean flag = list.remove("zhen");//删除指定元素，collection方法

        //替换元素
        String str2 = list.set(0, "Tian");
        System.out.println("被替换额元素："+str2);

        //判断是否为空
        System.out.println(list.isEmpty());

        //清空容器

        list.clear();

        //判断是否为空
        System.out.println(list.isEmpty());

        for(String i : list){       //增强for循环
            System.out.println(i);
        }
    }
}
```

```java
 //转换为Object[]数组，不能将转换的数组做强制类型转换，只能强制类型转换单个元素，不能是数组
        Object[] obj1 = list.toArray();
        for(Object str : obj1){
            System.out.println(str);
        }

        //转换泛型类型数组，指定类型的数组
        String[] str2 = list.toArray(new String[list.size()]);
        for(String i:str2){
            System.out.println(i);
        }
```

## ArrayList相关

**数组初始化采用延迟初始化，首先创先长度为0的空数组，使用时再分配长度10的。扩容采用1.5倍**

1. 那我们本身就有数组了，为什么要用ArrayList呢？、

**原生的数组会有一个特点：你在使用的时候必须要为它创建大小，而ArrayList不用。**

2.  ArrayList是怎么实现的吧，为什么ArrayList就不用创建大小呢？

**其实是这样的，我看过源码。当我们new ArrayList()的时候，默认会有一个空的Object数组，大小为0。当我们第一次add添加数据的时候，会给这个数组初始化一个大小，这个大小默认值为10；**

数组的大小是固定的，而ArrayList的大小是可变的；因为ArrayList是实现了**动态扩容**的，假设我们给定数组的大小是10，要往这个数组里边填充元素，我们只能添加10个元素。而ArrayList不一样，ArrayList我们在使用的时候可以往里边添加20个，30个，甚至更多的元素。

3. ArrayList怎样实现动态扩容的？


使用ArrayList在每一次add的时候，它都会先去计算这个数组够不够空间，如果空间是够的，那直接追加上去就好了。如果不够，那就得扩容。在源码里边，有个**grow**方法，每一次扩原来的**1.5**倍。比如说，初始化的值是10嘛。现在我第11个元素要进来了，发现这个数组的空间不够了，所以会扩到15；空间扩完容之后，会调用**arraycopy**来对数组进行拷贝。


## vector容器类

vector底层也是用数组实现的，相关的方法都加了同步检查，因此是”线程安全，效率低“

相关方法见Arraylist

**初始化采用立即初始化，扩容采用2倍。**


## Stack容器

**Stack栈容器，是vector的一个子类，实现了标准的后进先出**通过5个方法对vector进行扩展，允许将向量视为堆栈。


**栈中元素的位置从上往下，从1开始，不是从0

**
方法：

| 方法                 | 用途                                         |
| -------------------- | -------------------------------------------- |
| Boolean empty()      | 测试是否为空                                 |
| E peek()             | 看这个堆栈的顶部的对象，并没有从堆栈中删除它 |
| E pop()              | 删除顶部的对象，并返回该对象的值函数         |
| E push()             | 把一个项目放到堆栈的顶部                     |
| int search(Object o) | 返回元素在栈中的位置，没有则-1               |

```java
package container;

import java.util.Stack;

/**
 * test stack
 */
public class StackTest {
    public static void main(String[] args) {
        //实例化，不能用list引用，因为stack中定义了新的方法
        Stack<String > stack = new Stack<>();
        //将元素添加到栈容器中，压栈
        String a = stack.push("tian");
        //System.out.println(a);
        stack.push("zhen");
        stack.push("dong");

        //获取元素，后进先出，只能从栈顶取pop()
        String pop = stack.pop();
        System.out.println("删除的元素为："+pop);
        //测试是否为空empty()
        System.out.println(stack.empty());
        //返回栈顶元素
        System.out.println("此时栈顶元素为"+stack.peek());
        //查看元素的位置search(),注意：栈中元素的位置是从1开始的，不是从0
        System.out.println("tian的位置："+stack.search("tian"));
    }
}
```

## LinkedList容器类

**底层用双向链表实现的存储，特点：查询效率低，增删效率高，线程不安全**

有序，可重复的

由于 LinkedList 基于链表实现，存储元素过程中，无需像 ArrayList 那样进行扩容。但有得必有失，LinkedList 存储元素的节点需要额外的空间存储前驱和后继的引用。另一方面，LinkedList 在链表头部和尾部插入效率比较高，但在指定位置进行插入时，效率一般。原因是，在指定位置插入需要定位到该位置处的节点，此操作的时间复杂度为 O(N)。


特有方法：

| 方法               | 说明                 |
| ------------------ | -------------------- |
| void addFirst(E e) | 插入到开头           |
| void addLast(E e)  | 插入到末尾           |
| getFirst()         | 返回第一个元素       |
| getLast()          | 返回最后一个元素     |
| removeFirst()      | 移除第一个元素并返回 |
| removeLast()       | 移除最后一个并返回   |
| E pop()            | 等效于removeFirst()  |
| void push(E e)     | 等效于addFirst(E e)  |
| boolean isEmpty()  | 判断是否为空         |

```java
LinkedList<String> dataList = new LinkedList<>(); // 创建 LinkedList
dataList.add("test"); // 添加数据
dataList.add(1, "test1"); // 指定位置，添加数据
dataList.addFirst("first"); // 添加数据到头部
dataList.addLast("last"); // 添加数据到尾部
dataList.get(0); // 获取指定位置数据
dataList.getFirst(); // 获取头部数据
dataList.getLast(); // 获取尾部数据
dataList.remove(1); // 移除指定位置的数据
dataList.removeFirst(); // 移除头部数据
dataList.removeLast(); // 移除尾部数据
dataList.clear(); // 清空数据
```



# set接口

set继承自collection，没有新增方法。

无序，不可重复，无序是指set中的元素没有索引，只能遍历查找；不可重复值不要允许加入重复的元素。

常用的实现类：HashSet和TreeSet，一般用HashSet.

## Haseset容器类

Hashset无重复、无序的，是线程不安全的，允许有null元素。采用哈希算法实现，底层实际用HashMap实现，因此**查询和增删效率较高**。

>**无序**：底层用hashmap存储元素，hashmap底层用的是数组和链表实现元素的存储。元素在数组中存放时（初始化为长度16），并不是有序存放的也不是随机的，而是对元素的哈希值进行运算决定元素在数组中的位置。

>**不重复**：当两个元素的哈希值进行运算后得到相同的在数组中的位置时，会调用equals（）方法判断两个元素是否相同，如果相同，则不会添加，如果不同，则会使用单向链表保存该元素。

```java
package container;

import java.util.HashSet;
import java.util.Set;

public class HashSetTest {
    public static void main(String[] args) {
        //实例化HashSet
        Set<String> s1 = new HashSet<>();
        //添加元素
        s1.add("tian");
        s1.add("zhen");
        s1.add("dong");

        //获取元素，set中没有索引，没有对应的get方法
        for(String s : s1){
            System.out.println(s);  //输出结果和添加元素的顺序无关
        }
        System.out.println("-----------");
        //删除元素
        s1.remove("dong");
        for(String s : s1){
            System.out.println(s);  //输出结果和添加元素的顺序无关
        }
        //返回元素个数
        System.out.println("-----------");
        System.out.println(s1.size());
    }
}
```

**存储自定义类对象，需要在类中重写equals（）和hashCode（）**

```java
package container;

import java.util.Objects;

public class Test {
    private String u1;
    private int a;

    public String getU1() {
        return u1;
    }

    public void setU1(String u1) {
        this.u1 = u1;
    }

    public int getA() {
        return a;
    }

    public void setA(int a) {
        this.a = a;
    }

    public Test(String u1, int a) {
        this.u1 = u1;
        this.a = a;
    }

    public Test() {
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Test test = (Test) o;
        return a == test.a && Objects.equals(u1, test.u1);
    }
    //重新hashCode
    @Override
    public int hashCode() {
        return Objects.hash(u1, a);
    }

    public static void main(String[] args) {
        Test t1 = new Test("tian",12);
        Test t2 = new Test("tian",12);
        System.out.println(t1.hashCode());
        System.out.println(t2.hashCode());

    }
}
```

## TreeSet容器类

>可以对元素进行排序的容器，底层用TreeMap实现，内部位置了一个简化版的TreeMap，通过key存储Set元素，内部需要对元素进行排序，因此需要给定排序规则

排序规则：

1. 通过元素自身实现比较规则，元素自身定义了比较规则；
2. 通过比较器指定比较规则。

**1.自定义比较规则**

```java
public class Users extend comparable<Users>{
    ...
    ...
    ..
    //定义比较规则
    //整数：大，负数：小，0：相等
    //重写compareTo
    public int compareTo(Users o){
        if(this.age>o.getUserage()){
            return 1;
        }
        if(this.age==o.getUserage()){
            this.username.compareTo(o.username);//username是字符串，String中已经定义了compareTo（）
        }
        return -1;
    }
}
```


**2.通过比较器实现比较规则**
创建一个比较器，然后再实例化TreeSet时把比较器传递进去

```java
//创建比较器
public class UsersComparator implements Comparator<Users>{
    //定义比较规则
    //重写
    public int compare(Users o1,Users o2){
        if(o1.getUserage>o2.getUserage){
            return 1;
        }
        return -1;
    }
}
....
//实例化TreeSet
Set<Users> s1 = new TreeSet<>( new UsersComparator);
```


# 双例集合

## Map接口

>Map接口中的元素是成对出现的，由键-值两个部分组成，键不可重复，但是值可以重复

Map常用方法：

| 方法                                | 说明                                                       |
| ----------------------------------- | ---------------------------------------------------------- |
| V put(K key,V value)                | 添加元素对，如果key已有值，则会替换，并会返回被替换的value |
| void putAll(Map m)                  | 从指定map中复制映射关系到此map中                           |
| V remove(Object key)                | 删除key对应的value并返回value                              |
| V get(Object key)                   | 获取key对应的value                                         |
| Boolean containsKey（Object key）   | 判断是否包含该key                                          |
| boolean containsValue(Object value) | 判断是否包含该value                                        |
| Set keySet()                        | 获取map中所有的key，并存储的set中                          |
| Set<Map.Entry<K,V>> entrySet()      | 返回一个Set基于Map.Entry类型包含Map中所有映射              |
| void clear()                        | 删除map中所有的映射                                        |



## HashMap容器类

> 采用hash算法实现，是map接口最常用的实现类，底层采用了哈希表存储数据，要求键不能重复，如果发生重复，新的值会替换旧的值，在查找、删除、修改方面都有比较高的效率

```java
package container;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * 获取hashmap中key对应值的三中方法
 */
public class HashMapTest {
    public static void main(String[] args) {
        //实例化hashmap
        Map<String ,String> map1 = new HashMap<>();
        Map<String,String> map2 =new HashMap<>();
        //添加元素
        map1.put("a","b");
        //替换a对应的值并返回被替换的值，若未发生替换，则返回空
        map1.put("a","A");
        map1.put("b","B");
        map1.put("c","C");
        map2.put("d","D");

        //合并map2到map1，如果有key相同的，map2中的会覆盖map1中的值
        map1.putAll(map2);

        //方法1，通过get方法
        System.out.println("==========方法一============");
        System.out.println("a--------"+map1.get("a"));
        System.out.println("b--------"+map1.get("b"));
        System.out.println("c--------"+map1.get("c"));

        //方法二，通过keySet
        System.out.println("==========方法二============");
        Set<String> set1 = map1.keySet();
        for (String s:set1){
            System.out.println(s+"-------"+map1.get(s));
        }

        //方法三，通过Map.entry,entry是map中的子接口，有getKey和getValue两个方法
        System.out.println("==========方法三=======");
        Set<Map.Entry<String,String>> set2 = map1.entrySet();
        for(Map.Entry<String,String> entry:set2){
            String key = entry.getKey();
            String value = entry.getValue();
            System.out.println(key+"-------"+value);
        }
    }
}

/*
==========方法一============
a--------A
b--------B
c--------C
==========方法二============
a-------A
b-------B
c-------C
==========方法三=======
a-------A
b-------B
c-------C
```


## hashmap底层存储

>hashmap底层实现采用了哈希表；数据结构中由数组和链表实现对数据的存储，各自特点如下：

1. 数组：占用空间连续，寻址容易查询速度看，但是增删效率低
2. 链表：占用空间不连续，寻址困难，查询速度慢，但是增删效率搞

>哈希表本质是数组+链表，查询和增删效率高


1. 初始化数组，延迟初始化，调用时通过resize方法生成2<<4=16的数组长度，并进行0.75的扩容；将值传到NODE<K,V>节点类中，再存储到数组中
2. 计算hash值：调用key对象的hashcode方法计算key的hashcode值，根据hashcode值计算hash值（值在[0，数组长度-1]之间），公式：hash值=hashcode &（数组长度-1）
3. 添加元素，根据计算的hash值，放在数组的相应索引下，如果该位置已有索引：如果两个key值相同，则进行覆盖，如果不相同，则在该位置形成单向链表
4. 如果链表长度大于8，则转换成红黑树，如果红黑树小于6，则转换为链表


## TreeMap

>TreeMap和HashMap同样实现了map接口。HashMap效率要高于TreeMap，但是TreeMap是可以对键进行排序的，底层基于红黑树实现

使用TreeMap要给定排序规则：

1. 通过元素自身实现比较规则，元素自身定义了比较规则；
2. 通过比较器指定比较规则。


# Iterator迭代器接口

>collection接口继承了Iterator接口，包含一个iterator方法，会返回一个Iterator接口类型的对象，包含了三个方法用于实现对单例容器的迭代处理。

方法：

| 方法              | 说明                                                       |
| ----------------- | ---------------------------------------------------------- |
| boolean hasNext() | 判断游标当前位置是否铀元素，有返回True                     |
| Object next()     | 获取当前游标所在位置的元素，并将游标移动到下一位置         |
| void remove()     | 删除游标当前位置元素，在执行完next后使用，并且只能执行一次 |

```java
package container;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class IterotorTest {
    public static void main(String[] args) {
        //实例化容器
        List<String> list = new ArrayList<>();
        list.add("a");
        list.add("b");
        list.add("c");
        //迭代器
        Iterator<String> iterator =list.iterator();
        //通过while循环获取元素
        System.out.println("通过while=========");
        while (iterator.hasNext()){
            String value = iterator.next();
            System.out.println(value);
        }
        //通过for
        System.out.println("通过for=====");;
        for(Iterator<String> i = list.iterator();i.hasNext();){
            String value = i.next();
            System.out.println(value);
        }
    }
}
```

# Collections工具类

>Collections是一个工具类，提供了对Set、List、Map进行排序、填充、查找元素的辅助方法，该类中所有的方法都为静态方法。

常用方法：

| 方法                          | 说明                                                       |
| ----------------------------- | ---------------------------------------------------------- |
| void sort(List)               | 对list容器内的元素排序，规则按照升序                       |
| void shuffle(List)            | 对List随机排列，打乱                                       |
| void reverse(List)            | 逆序排列                                                   |
| void fill(List,Object)        | 用一个特定的对象重写整个List容器                           |
| int binarySearch(List,Object) | 对于顺序的容器，采用折半查找法查找特定对象，放回对象的索引 |

```java
package container;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public class CollectionsMethodsTest {
    public static void main(String[] args) {
        //实例化容器
        List<String> list = new ArrayList<>();
        list.add("c");
        list.add("a");
        list.add("b");
        //sort排序
        Collections.sort(list);
        for (Iterator<String > i=list.iterator();i.hasNext();){
            String s = i.next();
            System.out.println(s);
        }
        System.out.println("================");
        //shuffle打乱顺序
        Collections.shuffle(list);
        for (Iterator<String > i=list.iterator();i.hasNext();){
            String s = i.next();
            System.out.println(s);
        }
    }
}
```

