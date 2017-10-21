---
 UInttitle: SwiftNote1
date: 2017-10-20 21:10:15
tags: Swift
---

# 基本类型之常量、变量和声明

- let： `let maxNum = 1000`
- var：`var index = 2`

同时声明多个变量 `var x = 1, y = 2, z = 3`

Swift 变量的类型是严格定义的

*type inference*: 初次赋值一个变量时，swift会自动判断变量类型而不需要自己标示

按住Option，移到变量上，可以看见变量类型

显示声明的变量： `let website: String = "www.immoc.com"`

同时定义a b c为double类型的变量：`var a , b , c : Double`



# 基本类型之整型

##常用类型

- int
- float
- double
- boolean
- string
- tuple

##整型

`var imInt : Int = 80` 整形变量的存储由计算机内存决定 32bit or 16bit

`Int.max` 可以看整形表达的最大值 同理`Int.min`

编译层面上Swift就会报错

无符号整形：`UInt`  最小值是0

```swift
var imUInt: UInt = 80
UInt.min
0
```

`Int8 Int16 UInt16…`

二进制赋值 `let binaryInt: Int = 0b10001`

用下划线给整形进行分割 `let bignum = 1_000_000` 使程序易读



#基本类型之浮点数和类型转换

##浮点数

`let imFloat: Float = 3.1315926` 32位的表示

`let imDouble: Double = 3.1415926` 64位的表示

`let x = 3.1415926` 会自动判断是double类型

`var a = 1.25e10` 科学计数法表示数

`var b = 1.25e-8`

也可以用下划线进行分割使程序易读

## 类型转换

```swift
let x: UInt16 = 100
let y: UInt8 = 20
let m = x + UInt16(y)
```

必须显式地类型转换

double 和float 也不能直接相加，需要转换

整数和小数也要转换

`let w: Float = 3` 是可以的，因为3可以表示为浮点数

`let v: Int = 3.0` 是不行的

- CGFloat

  ```swift
  let red: Float = 0.2
  let green: CGFloat = 0.5
  let blue: CGFloat = 0.3
  UIColor(red: red, green: green, blue: blue, alpha: 1.0)
  ```



# 基本类型之布尔类型和简单的if语句

## 布尔类型

```swift
let imTrue: Bool = true
let imFalse = false
```

## if语句

```swift
if imTrue{
  print("i'm True")
}
else if 3+4 == 7{
  print(3+4==7)
}
else{
  print("I'm False")
}
```

条件可以不用小括号包起来，但是大括号不能省略

不可以使用“1”“0”表示boolean值



# 基本类型之元组

- Tuple

```swift
var point = (5, 2)
var httpResponse = (404, "Not Found")
```

可以是不同类型的变量

`var point2: (Int, Int, Int) = (10, 5, 2)` 显式地定义元组

`var httpResponse2: (Int, String) = (200, "OK")`

得到元组里不同分量的值

````swift
let (x, y) = point
point.0
point.1
````

也可以获取不同分量的值，但是不直观

给元组里不同分量命名并获取

```swift
let point3 = (x:3, y:2)
point3.x
point3.y

let point4:(x :Int, y: Int) = (10,5)
point4.x
point4.y
```

解包元组里的某一个分量

```swift
let loginResult = (true, "liuyubobobo")
let (isLoginSuccess, _) = loginResult
```

元组适合轻量级的数据



# 基本类型之其他：变量名、print和注释

- String

  `let website: String = "www.imooc.com"`

## 变量名

代码风格： 类型的名称首字母用大写

变量名不一定全部使用英文（？）可以用unicode的任意字符 可以用emoji！

```swift
var 名字 = "liuyubobobo"
print ("我的名字是" + 名字)
```

## Print

```swift
print("Hello")
let x = 1, y = 2, z = 3, b = true
print(x, y, z, b)//默认中间是空格
print(x, y, z, separator:",")//会使分隔符变成逗号而不是空格
print(x, y, z, separator:"--", terminator:":)")//把行尾从\n改成:)

print(y, "*", z, "=", y*z)
print("\(y) * \(z) = \(y*z)")//字符串插值
```

## 注释

多行注释之间也可以插入注释