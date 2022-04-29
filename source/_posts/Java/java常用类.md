---
title: java常用类
author: TianZD
top: true
cover: true
toc: true
mathjax: false
summary: JavaSE基础，java中的常用类学习笔记，粗略学了一下，没有参考价值
tags:
  - java基础
  - java常用类
  - 学习笔记
categories:
  - java
reprintPolicy: cc_by
abbrlink: 6c6d8dca
date: 2022-04-29 10:57:09
coverImg:
img:
password:
---


[toc]

# 包装类

java是面向对象的语言，但不是纯面向对象的，因为基本数据类型不是对象，但是在实际应用的时候经常需要把基本数据类型转化成对象，为了解决这个问题，java在设计类时，为每一个基本数据类型设计了一个对应的类进行代表，统称为包装类（wrapper class）

包装类均位于java.lang包中：

|  基本数据类型  |  包装类   |
| :------------: | :-------: |
|      byte      |   Byte    |
|    boolean     |  Boolean  |
|     short      |   Short   |
|      char      | Character |
|      int       |  Integer  |
|      long      |   Long    |
|     float      |   Float   |
| double｜Double |           |

其中8种整型的为数字，具有统一父类：抽象类Number

```java
package JavaStudy;

/**
 * test Interger 包装类
 */
public class IntegerTest {
    public static void main(String[] args) {
        //基本数据类型转换为对象
        Integer i = new Integer(10);    //已被废弃，不推荐
        Integer i1 = Integer.valueOf(10);   //推荐
        //对象转换为基本数据类型
        int i2 = i1.intValue();
        double d = i1.doubleValue();
        //System.out.println(i2);
        System.out.println(i2+"\t"+d);
        //System.out.println(String.valueOf(i2)+"\t"+Double.toString(d)+"\t"+d);
        //将字符串转为包装类对象
        Integer i3 = Integer.valueOf("12");
        Integer i4 = Integer.parseInt("23");
        System.out.println(i3+"\t"+i4);
        //包装类对象转为字符串，字符串不是基本数据类型，属于引用数据类型
        String str = i3.toString();
        System.out.println(str);
        
        //*自动装箱*
        Integer a = 300;    //编译器帮你改成:Integer a = Integer.valueof(300);

        //自动拆箱
        int b = a； //编译器帮你改成int b = a.intValue();
    }
}
```

# String类

用的最多的类；

## String基础

1. String类又称作不可变字符序列
2. 位于java.lang包
3. java字符串就是Unicode字符序列，java就是j、a、v、a组成



#  String 方法

## 创建字符串

创建一个String对象，并初始化一个值。
String类是不可改变的，一旦创建了一个String对象，它的值就不能改变了。
如果想对字符串做修改，需要使用StringBuffer&StringBuilder类。

```java
//直接创建方式
String str1 = "abc";
//提供一个 字符数组 参数来初始化字符串
char[] strarray = {'a','b','c'};
String str2 = new String(strarray);

```

## 字符串遍历

```java
public static void main(String[] args) {
        String str = "keep walking！！！";
        //方法一
        char[] charArray = str.toCharArray();
        for (char i:charArray){
            System.out.println(i);
        }
        /*for (int i = 0; i < charArray.length; i++) {
            System.out.println(c[i]);
        }*/

        // 方法二
        for (int i = 0; i < str.length(); i++) {
            System.out.println(str.charAt(i));
        }

        //方法三
        for (int i = 0; i < str.length(); i++) {
            System.out.println(str.substring(i, i + 1));
        }
    }
```

## 字符串长度获取

int length()方法：返回字符串对象包含的字符数。

```java
int len = str.length();
```

## 连接字符串

String concat(String str)：连接两个字符串的方法
或者直接用‘+’操作符来连接

```java
//String对象的连接
str1.concat(str2);

"两个字符串连接结果："+str1+str2; 
```

## 字符串查找

int indexOf(String s)：字符串s在指定字符串中首次出现的索引位置，如果没有检索到字符串s，该方法返回-1

int lastIndexOf(String s)：字符串s在指定字符串中最后一次出现的索引位置，如果没有检索到字符串s，该方法返回-1；

如果s是空字符串，则返回的结果与length方法的返回结果相同，即返回整个字符串的长度。
如果s是空字符串，则返回的结果与length方法的返回结果相同，即返回整个字符串的长度。java

```java
int idx = str.indexOf("a");//字符a在str中首次出现的位置
int idx = str.lastIndexOf("a");

```

## 获取指定位置的字符串

char charAt(int index)方法：返回指定索引出的字符

```java
String str = "abcde";
char thischar = str.charAt(3);//索引为3的thischar是"d"

```

## 获取子字符串

String substring()方法：实现截取字符串，利用字符串的下标索引来截取(字符串的下标是从0开始的，在字符串中空格占用一个索引位置)

substring(int beginIndex)：截取从指定索引位置开始到字符串结尾的子串
substring(int beginIndex, int endIndex)：从beginIndex开始，到endIndex结束(不包括endIndex)

```java
String str = "abcde";
String substr1 = str.substring(2);//substr1为"cde"
String substr2 = str.substring(2,4);//substr2为"cd"

```

## 去除字符串首尾的空格()

String trim()方法

```java
String str = " ab cde ";
String str1 = str.trim();//str1为"ab cde"
```

## 字符串替换

1. String replace(char oldChar, char newChar)：将指定的字符/字符串oldchar全部替换成新的字符/字符串newChar
2. String replaceAll(String regex, String replacement)：使用给定的参数 replacement替换字符串所有匹配给定的正则表达式的子字符串
3. String replaceFirst(String regex, String replacement)：使用给定replacement 替换此字符串匹配给定的正则表达式的第一个子字符串
   regex是正则表达式，替换成功返回替换的字符串，替换失败返回原字符串

```java
String str = "abcde";
String newstr = str.replace("a","A");//newstr为"Abcde"
```

## 判断字符串的开始与结尾

boolean startsWith()

1. boolean startsWith(String prefix)：判断此字符串是否以指定的后缀prefix开始
2. boolean startsWith(String prefix, int beginidx)：判断此字符串中从beginidx开始的子串是否以指定的后缀prefix开始
   boolean endsWith(String suffix)：判断此字符串是否以指定的后缀suffix结束

```java
String str = "abcde";
boolean res = str.startsWith("ab");//res为true
boolean res = str.StartsWith("bc",1);//res为true
boolean res = str.endsWith("de");//res为true
```

## 判断字符串是否相等

boolean equals(Object anObject)：将此字符串与指定的对象比较，区分大小写
boolean equalsIgnoreCase(String anotherString)：将此 String 与另一个 String 比较，不考虑大小写

```java
String str1 = "abcde";
String str2 = str1;//字符串str1和str2都是一个字符串对象
String str3 = "ABCDE";
boolean isEqualed = str1.equals(str2);//返回true
boolean isEqualed = str1.equals(str3);//返回false
boolean isEqualed = str1.equlasIgnoreCase(str3);//返回true

```

## 比较两个字符串

int compareTo(Object o)：把这个字符串和另一个对象比较。
int compareTo(String anotherString)：按字典顺序比较两个字符串。
比较对应字符的大小(ASCII码顺序)，如果参数字符串等于此字符串，则返回值 0；如果此字符串小于字符串参数，则返回一个小于 0 的值；如果此字符串大于字符串参数，则返回一个大于 0 的值。

```java
String str1 = "abcde";
String str2 = "abcde123";
String str3 = str1;
int res = str1.compareTo(str2);//res = -3
int res = str1.compareTo(str3);//res = 0
int res = str2.compareTo(str1);//res = 3

```

## 把字符串转换为相应的数值

String转int型：

```java
//第一种
int i = Integer.parseInt(String str)
//第二种
int i = Integer.valueOf(s).intValue();

```

String转long型：

```java
long l = Long.parseLong(String str);
1
```

String转double型：

```java
double d = Double.valueOf(String str).doubleValue();//doubleValue()不要也可
double d = Double.parseDouble(str);

```

int转string型：

```java
//第一种
String s = String.valueOf(i)；
//第二种
String s = Integer.toString(i);
//第三种
String s = "" + i;

```

## 字符大小写转换

String toLowerCase()：将字符串中的所有字符从大写字母改写为小写字母
String toUpperCase()：将字符串中的所有字符从小写字母改写为大写字母

```java
String str1 = "abcde";
String str2 = str1.toUpperCase();//str2 = "ABCDE";
String str3 = str2.toLowerCase();//str3 = "abcde";

```

## 字符串分割

String[] split()：根据匹配给定的正则表达式来拆分字符串，将分割后的结果存入字符数组中。

String[] split(String regex)：regex为正则表达式分隔符, . 、 $、 | 和 * 等转义字符，必须得加 \\；多个分隔符，可以用 | 作为连字符。
String[] split(String regex, int limit)：limit为分割份数

```java
String str = "Hello World A.B.C"
String[] res = str.split(" ");//res = {"Hello","World","A.B.C"}
String[] res = str.split(" ",2);//res = {"Hello","World A.B.C"}
String[] res = str.split("\\.");//res = {"Hello World A","B","C"}

String str = "A=1 and B=2 or C=3"
String[] res = str.split("and|or");//res = {"A=1 "," B=2 "," C=3"}

```

## 字符数组与字符串的转换

public String(char[] value) ：通过char[]数组来创建字符串
char[] toCharArray()：将此字符串转换为一个新的字符数组。

```java
String str = "abcde";
char mychar[] = str.toCharArray();//char[0] = 'a'; char[1] = 'b'...

```

## 字符串与byte数组的转换

byte[] getBytes()

byte[] getBytes()：使用平台的默认字符集将此 String 编码为 byte 序列，并将结果存储到一个新的 byte 数组中。
byte[] getBytes(String charsetName)：使用指定的字符集将此 String 编码为 byte 序列，并将结果存储到一个新的 byte 数组中。

```java
byte[] Str2 = Str1.getBytes();


```

## StringBuffer&StringBuilder类

与String类最大的不同在于这两个类可以对字符串进行修改。
StringBuilder相较StringBuffer来说速度较快，多数情况下使用StringBuilder，但是StringBuilder的方法不是线性安全的（不能同步访问），所以在应用程序要求线程安全的情况下，必须使用StringBuffer。

## 创建StringBuffer字符串

```java
StringBuffer str = new StringBuffer("");
```

## 添加字符(最常用方法)

public StringBuffer append(String s)：将指定的字符串追加到字符序列中

```java
str.append("abc");//此时str为“abc”
```

## 删除字符串中的指定字符

public delete(int start,int end)：移除此序列中的子字符串的内容

public deleteCharAt(int i)：删除指定位置的字符

```java
str.delete(0,1);//此时str为“c”
str.deleteCharAt(str.length()-1);//删除最后一个字符

```

## 翻转字符串

public StringBuffer reverse()

```
str.reverse();

```

## 换字符串中内容

replace(int start,int end,String str)：用String类型的字符串str替换此字符串的子字符串中的内容

```java
String s = "1";
str.replace(1,1,s);//此时str为"a1c"

```

## 插入字符

public insert(int offset, int i)：将int参数形式的字符串表示形式插入此序列中

```java
str.insert(1,2);
```

## 字符串长度

int length()：返回长度（字符数）
void setLength(int new Length)：设置字符序列的长度

```java
str.length();
str.setLength(4);
```

## 当前容量

int capacity()：获取当前容量
void ensureCapacity(int minimumCapacity)：确保容量小于指定的最小值

```java
str.capacity();
```

## 将其转变为String

String toString()

```java
str.toString();//将StringBuffer类型的序列转变为String类型的字符串
```

## 设置指定索引处的字符

void setCharAt(int index，char ch)：将给定索引处的字符设置为ch

其余方法和String类型的方法大致相同。



# MathMethod

![image-20210726211114617](https://gitee.com/tianzhendong/img/raw/master//images/image-20210726211114617.png)



# Random

```java
Random rand = new Random();

//[0,1) 之间的double类型数据
a = rand.nextDouble();
//随机int类型允许范围之内的整形数据
b = rand.nextInt();
//随机生成[0,1)之间的float类型的数据
c  = rand.nextFloat();
//随机boolean
d = rand.nextBoolean();
//随机[0,10)的int
e = rand.nextInt(10)
```

# TimeClass


# 用long变量的值表示时间。

```java
long now = System.currentTimeMillis()    //获取现在时间，用距离基准时间的毫秒数表示

Date d1 = new Date()    //获取当前时间，年月日表示
d1.getTime()    //获取当前时间对应的毫秒数


```

# DateFormat类

把时间对象转化成指定格式的字符串，是一个抽象类，一般使用其子类SimpleDateFormat类

```java
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 测试时间对象和字符串相互转换
 * 使用DateFormat、SimpleDATe Format
 */

public class TestDateFormat {
    public static void main(String[] args) throws ParseException {
        //定义日期的格式，可以自己定义
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        //SimpleDateFormat df = new SimpleDateFormat("今年第几周,第几天");

        //将字符串转为时间对象
        Date d1 = df.parse("2021-06-03 19:40:00");
        System.out.println(d1.getTime());   //d1.getTime()获取时间对应的毫秒数

        //将Date对象转化成字符串
        Date d2 = new Date(1000L*3600*23);
        String str1 = df.format(d2);
        System.out.println(str1);

    }
}
```


# Calendar类

Calendar是一个抽象类，GregorianCalendar类是其子类，使用的是公历；

月份的表示，0表示一月。  周日用1表示，周六用7表示。

```java
package JavaStudy;

import java.awt.desktop.SystemEventListener;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * 测试Calendar类和GregorianCalendar类
 */

public class TestCalendar {
    public static void main(String[] args) {
        //生成一个日期，2021年6月3日
        GregorianCalendar calendar = new GregorianCalendar(2021,5,3,19,59,00) ;

        int year = calendar.get(Calendar.YEAR); //print:2021
        int month = calendar.get(Calendar.MONTH);   //print : 5
        int day = calendar.get(Calendar.DAY_OF_MONTH);  //print:3
        int day2 = calendar.get(Calendar.DATE); //calendar.date = calendar.day_of_mouth
        int date = calendar.get(Calendar.DAY_OF_WEEK);  //print 4
        System.out.println(year);
        System.out.println(month);
        System.out.println(day);
        System.out.println(day2);
        System.out.println(date);

        //set date
        GregorianCalendar calendar2 = new GregorianCalendar(    );

        calendar2.set(Calendar.YEAR,2021);   //set year = 2021
        calendar2.set(Calendar.MONTH,5);    //set monty = 5
        calendar2.add(Calendar.MONTH, -4 ); //set month = month -4


        //日历和时间转换
        Date d= calendar.getTime(); // calendar to date
        GregorianCalendar calendar4 = new GregorianCalendar();
        calendar4.setTime(new Date());  //date to calendar
    }
}
```



# File



File用来表示文件和文件夹

```java
package JavaStudy;

import java.awt.desktop.SystemEventListener;
import java.io.File;
import java.io.IOException;
import java.util.Date;

/**
 * File类
 */

public class TestFile {
    public static void main(String[] args) throws IOException {
        System.out.println(System.getProperty("user.dir")); //获取当前项目路径
        File f1 = new File("e:/movies/1.mp4");  //文件
        File f2 = new File("e:/movies.mp4"); //文件夹
        File f3 = new File("a.txt");    //相对路径，默认放在user.dir目录下
        f2.createNewFile(); //创建文件夹f2
        f3.createNewFile(); //创建文件
        //f1.createNewFile();
        System.out.println(f2.exists());    //文件是否存在
        System.out.println(f2.isDirectory());    //是否是目录
        System.out.println(f2.isFile());    //是否是文件夹
        System.out.println(new Date(f2.lastModified()));    //最后修改时间
        System.out.println(f2.length());    //文件大小
        System.out.println(f2.getName());    //文件名字
        System.out.println(f2.getPath());    //文件路径

        
        f2.delete();    //删除对应的文件
        f3.delete();

        File f1 = new File("e:/movies/1");  //目录

        boolean flag = f1.mkdir();  //创建一个目录，中间目录缺失的话，则创建失败
        System.out.println(flag);   //目录创建失败

        boolean flag1 = f1.mkdirs();  //创建多个目录，中间目录缺失的话，则创建缺失的目录
        System.out.println(flag1);   //目录创建


    }
}

```


# enum枚举

本质上也是类

```java
enum    枚举名{
    枚举体（常量列表）
}

//创建枚举类型
enum Season{
    SPRING,SUMMER,AUTUMN,WINDER
}

//枚举遍历
for(Season k:Season.values()){
    .....
}


```



