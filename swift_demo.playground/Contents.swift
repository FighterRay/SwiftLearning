//: Playground - noun: a place where people can play

import UIKit


//MARK:-- swift基础语法

/*
* 语法格式
* 常量:   let 常量名称： 类型 = 值
* 变量:   var 变量名称： 类型 = 值
* 注意:   当类型不写时，由于左推导类型，可以自动识别类型等号左右的空格均等
*/

//var 变量修饰符
var str = "variable"
//let 常量修饰符
let cardId = "constant"



//MARK:-- 基本数据类型
/*
* Int、Float、Double、Bool(特殊)等
* Bool在swift中表示true和false
*/
var numA = 10;
var numB: Float = 10;

//四则运算需要类型匹配
var sum = numA + Int(numB)

//Bool 值只能为true和false
var flag = false

// ? 代表 可选类型
var colorName: String?
colorName = "blueColor"
let redColor = "redColor"

//新运算符 ??  等同于三目运算符
var color = colorName ?? redColor

//MARK:-- String
/*
* 注意：
* 左推导类型
*
*/
var string: String = "abcd"

//字符串起点和终点
var startIndex = string.startIndex

var endIndex = string.endIndex
//追加
string.appendContentsOf("efge")
string = string + str
//插入
string.insert("0", atIndex: startIndex)

//截取
startIndex = startIndex.advancedBy(1)
endIndex = string.characters.indexOf(Character("e"))!
//let range = Range(start:startIndex, end: endIndex)
let range = startIndex..<endIndex

str = string.substringWithRange(range)

//转化
var OCstring = NSString(string: string)

let numStr = "123.32"

let newNum = Float(numStr)
//MARK:-- 元祖
let httpMessage = (statusCode:404,message:"Not Found!")

httpMessage.0
httpMessage.1

httpMessage.statusCode
httpMessage.message

//MARK:-- 数组、字典 指定数组存放类型
var shopList = ["water","meat","greens"]
shopList.append("oil")
shopList.insert("This is", atIndex: 0)

//数组的其他两种初始化方法
var shopList1 = Array<String>()
var shopList2 = [String]()
//初始化OC数组
var shopList3 = []


//字典的初始化
var collegeDict = [
    "成都": "成都理工",
    "重庆": "重庆邮电大学",
]
collegeDict["成都"] = "电子科技大学"
collegeDict
//字典的初始化方法
var collegeDict1 = Dictionary<String,String>()
var collegeDict2 = [String:String]()
//
var collegeDict3 = [:]

//MARK:-- 控制流 使用`if`和`switch`来进行条件操作，使用`for-in`、`for`、`while`和`do-while`来进行循环。包裹条件和循环变量括号可以省略，但是语句体的大括号是必须的。
for product in shopList {
    if product == "meat"{
        product
    }
}

//针对于值缺失的情况判断 等同于OC中 if name {...}
var name: String?
if let objc = name {
    objc
}

//switch支持任意类型的数据以及各种比较操作——不限于整数或等值测试。遇到匹配的语句后会自动break，如需要执行剩下操作需加入关键字fallthrough
let vegetable = "red pepper"
switch vegetable {
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich."
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
//    fallthrough
default:
    let vegetableComment = "Everything tastes good in soup."
}

//使用`for-in`来遍历字典，此列需要两个变量来表示每个键值对。
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
//for循环中使用`..<`和`...`来表示范围
var firstForLoop = 0
for i in 0..<3 {
    firstForLoop += i
}
firstForLoop

for _ in 1 ... 3 {
    firstForLoop += 2
}
firstForLoop
//使用`while`来重复运行一段代码直到不满足条件。循环条件可以在开头也可以在结尾。do-while 换为 repeat-while
var n = 2
while n < 100 {
    n = n * 2
}
n

var m = 2
repeat {
    m = m * 2
} while m < 100
m
//使用`func`来声明一个函数，使用名字和参数来调用函数。使用`->`来指定函数返回值。

func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}
greet("Bob", day: "Tuesday")

func eatFoot(name: String, _ foot: String) -> String {
    return "\(name) today eat \(foot)!"
}
eatFoot("Bob", "meat")

//使用一个元组来返回多个值。
func getHttpMessage() -> (Int, String) {
    return (404, "Not found")
}
getHttpMessage()

//函数的参数数量是可变的，用一个数组来获取它们：
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(42, 597, 12)
//函数可以作为另一个函数的返回值。
func addOne(number: Int) -> Int {
    return 1 + number
}
func makeIncrementer() -> (Int -> Int) {
    return addOne
}
var increment = makeIncrementer()
increment(7)
//函数也可以当做参数传入另一个函数。
func hasAnyMatches(list: [Int], _ condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 8, 12]
hasAnyMatches(numbers, lessThanTen)
//函数实际上是一种特殊的闭包，你可以使用`{}`来创建一个匿名闭包。使用`in`来分割参数并返回类型
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})
numbers
//类似OC闭包写法
var block:(String) -> String = {
    (name: String) -> String in
    return "hello " + name
}

block("Xcode")

//枚举

enum CompassPoint {
    case North
    case South
    case East
    case West
}

var directionToHead = CompassPoint.East

directionToHead = .North

switch directionToHead {
    case .North:
        print("Lots of planets have a north")
    default:
        print("hhh")
}

//enum BarCode: Int{
//    case UPCA(Int, Int, Int, Int) = 0
//    case QRCode(String) = 1
//}

//var productBarcode = BarCode.QRCode("1234")

//switch productBarcode {
//case .QRCode(var product):
//    print("QR code:\(product)")
//    product = "123"
//default:
//    break
//}
//
//switch productBarcode {
//case .UPCA(let numberSystem, let manufacturer, let product, let check):
//    print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
//case .QRCode(let productCode):
//    print("QR code: \(productCode).")
//}

//productBarcode = BarCode.QRCode("hehehe")

//递归枚举
enum ArithmeticExpression {
    case Number(Int)
    indirect case Addition(ArithmeticExpression, ArithmeticExpression)
    indirect case Muplication(ArithmeticExpression, ArithmeticExpression)
}

func evaluate(expression: ArithmeticExpression) -> Int {
    switch expression {
    case .Number(let value):
        return value
    case .Addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .Muplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}

let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let numOfSum = ArithmeticExpression.Addition(five, four)
let product = ArithmeticExpression.Muplication(numOfSum, ArithmeticExpression.Number(2))
print(evaluate(product))


//计算属性
struct Point {
    var x = 0.0, y = 0.0
    
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point();
    var size = Size();
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set (newCenter){
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.center.x),\(square.center.y))")

print("\n")

/**
 * 属性观察器 Property Observer
 */
class StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            print("About to set totalSteps to \(newValue)");
        }
        didSet {
            if totalSteps > oldValue {
                print("Add \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 300

/**
 * 类型属性 Type Property
 */
struct AudioCannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioCannel.thresholdLevel {
                //将音量限制在阀值内
                currentLevel = AudioCannel.thresholdLevel
            }
            if currentLevel > AudioCannel.maxInputLevelForAllChannels {
                //储存当前音量作为新的最大输入音量
                AudioCannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftCannel = AudioCannel()
var rightCannel = AudioCannel()

leftCannel.currentLevel = 7
print(leftCannel.currentLevel)
print(AudioCannel.maxInputLevelForAllChannels)

rightCannel.currentLevel = 11
print(rightCannel.currentLevel)
print(AudioCannel.maxInputLevelForAllChannels)


/**
 *  实例方法 Instance Methods
 */
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func incrementBy(amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let count = Counter()
count.increment()
count.count

count.incrementBy(7)
count.count

count.reset()
count.count

/**
 *  类型方法 Type Methods
 */

//等级监测器
struct LevelTracker {
    
    static var highestUnlockedLevel = 1
    
    static func unlockLevel(level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func levelIsUnlocked(level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    var currentLevel = 1
    
    mutating func advenceToLevel(level: Int) -> Bool {
        if LevelTracker.levelIsUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

//游戏玩家类
class Player {
    
    var tracker = LevelTracker()
    let playerName: String
    
    func completedLevel(level: Int) {
        LevelTracker.unlockLevel(level + 1)
        tracker.advenceToLevel(level + 1)
    }
    
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Ray")
player.completedLevel(2)
print("现在最高没有解锁的关卡是\(LevelTracker.highestUnlockedLevel)")

player = Player(name: "Bob");
if player.tracker.advenceToLevel(7) {
    print("玩家现在的等级是 7")
} else {
    print("关卡7暂时还没有解锁")
}

/**
 *  下标 Subscript
 */
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")

//使用下标语法创建一个矩阵
struct Matrix {
    
    let rows: Int, columns: Int
    var grid: [Double]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue:0.0)
    }
    
    func indexIsValidForRow(row: Int, column:Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2


/**
 *  继承 Inheritance
 */

//使用 final 关键字可以防止重写和继承

//定义一个基类
class Vehicle {
    var currentSpeed: Double = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        
    }
}

var someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")

//子类生成 subclassing
class Bicycle: Vehicle {
    var hasBasket = false
}

var bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 1.0

print("Bicycle: \(bicycle.description)")

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.currentSpeed = 20.0
tandem.currentNumberOfPassengers = 2
tandem.hasBasket = true

print("Tandem: \(tandem.description))")

//重写方法 Override Method
class Train: Vehicle {
    override func makeNoise() {
        print("Woooooo")
    }
}

let train = Train()
train.makeNoise()

//重写属性 Override Property
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + "in gear \(gear)"
    }
}

var car = Car()
car.currentSpeed = 30.0
car.gear = 2
car.description

//重写属性观察器
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10) + 1
        }
    }
}

var automaticCar = AutomaticCar()
automaticCar.currentSpeed = 29.0
print("Automatic: \(automaticCar.description)")
































