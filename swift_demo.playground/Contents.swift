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



/**
 *  构造过程 Initialization
 */

struct Color {
    let red, green, blue: Double
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

//可选属性类型,可以不在类或结构体初始化的时候赋值，自动初始化为nil
class SurveyQuestion {
    var text: String
    var response: String?
    
    init(text: String) {
        self.text = text
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.response

//默认构造器: 所有属性都有默认值，同时没有自定义的构造器
class ListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

var item = ListItem()

//结构体的逐一成员构造器 memberwise initializers for structure type
struct Rectangle {
    var width = 0.0, height = 0.0
}

let twoBytwo = Rectangle(width: 2.0, height: 2.0)

//值类型(结构体和枚举类型)的构造器代理

struct Rect1 {
    var origin = Point()
    var size = Size()
    
    init() {}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size:Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let basicRect = Rect1()
let originRect = Rect1(center: Point(x: 4.0, y: 4.0), size: Size(width: 5.0, height: 5.0))
let centerRect = Rect1(origin: Point(x: 4.0, y:4.0), size: Size(width: 3.0, height: 3.0))

//类的继承和构造过程
//指定构造器 designated initializer 和 便利构造器 convenience initiallizer

//基类Food
class Food {
    var name: String

    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

var food = Food(name: "Bacon")
food.name
let mysteryMeat = Food()
mysteryMeat.name

//RecipeIngredient类构建了食谱中的一味调味剂
class RecipeIngredient: Food {
    var quantity: Int
    var description: String {
        return "Name is: \(name), quantity is: \(quantity)"
    }
    
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

let oneMysteryItem = RecipeIngredient()
oneMysteryItem.description
let oneBacon = RecipeIngredient(name: "Bacon")
oneBacon.description
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
sixEggs.description

class ShoppingListItem: RecipeIngredient {
    var purchased = false
    override var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6)
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}

//可失败构造器

//值类型（也就是结构体或枚举）的可失败构造器，可以在构造过程中的任意时间点触发构造失败。
struct Animal {
    let species: String
    init?(species: String) {
        //self.species = species
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}

if let giraffe = Animal(species: "Giraffe") {
    print("An Animal was initialized with a species of \(giraffe.species)")
}

//枚举类型的可失败构造器
enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenhiet
    init?(symbol: String) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "F":
            self = .Fahrenhiet
        case "C":
            self = .Celsius
        default:
            return nil
        }
    }
}

if let fahrenheitUnit = TemperatureUnit(symbol: "F") {
    print("This is defined temperature unit, so initialization succeeded")
}

//带原始值的枚举类型的可失败构造器
//带原始值的枚举类型会自带一个可失败的构造器 init？(rawValue:) ,rawValue的类型和枚举值的原始类型一致
enum TemperatureUnit1: Character {
    case Kelvin = "K",Celsius = "C", Fahrenheit = "F"
}

if let fahrenheitUnit = TemperatureUnit1(rawValue: "F") {
    print("This is defined temperature unit, so initializetion succeded")
}

//类的可失败构造器
//对类而言，可失败构造器只能在类引入的所有存储型属性被初始化后，以及构造器代理调用完成后，才能触发构造失败
class Product {
    var name: String! //使用隐式解包可选类型
    
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name //若name为常量，则这句代码必须放在if语句之前
    }
}

if let bowTie = Product(name: "bow tie") {
    print("The product's name is \(bowTie.name)")
}

//构造失败的传递
class CartItem: Product {
    let quantity: Int!
    
    init?(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
        if quantity < 1 {
            return nil
        }
    }
}

if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}

//重写一个可失败构造器
//可以用非可失败构造器重写可失败构造器，但反过来却不行
class Document {
    var name: String?
    
    init() {}
    init?(name: String) {
        self.name = name
        if name.isEmpty {
            return nil
        }
    }
}

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init?(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitle]"
        } else {
            self.name = name
        }
    }
}

//可以在子类的非可失败构造器中使用强制解包来调用父类的可失败构造器
//如果在调用父类的可失败构造器init?(name:)时传入的是空字符串，那么强制解包操作会引发运行时错误
class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitle]")!
    }
}

//可以在init?中代理到init!，反之亦然

//必要构造器： 所有该类的子类都必须实现该构造器
//如果子类继承的构造器能满足必要构造器的要求，则无须在子类中显式提供必要构造器的实现
class SomeClass {
    required init() {
        // 构造器的实现代码
    }
}

//在重写父类中必要的指定构造器时，不需要添加override修饰符
class SomeSubclass: SomeClass {
    required init() {
        // 构造器的实现代码
    }
}

//通过闭包或函数设置属性的默认值
//例子：西洋跳棋游戏
struct Checkerboard {
    let boardColor: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...10 {
            for j in 1...10 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    
    func squareIsBlackAtRow(row: Int, column: Int) -> Bool {
        return boardColor[(row * 10) + column]
    }
}

let board = Checkerboard()
board.squareIsBlackAtRow(0, column: 1)


/**
 *  析构过程 Deinitialization (只适用于class type)
 */
//析构器是在实例释放发生前被自动调用。不能主动调用析构器
//析构器实践
class Bank {
    static var coinsInBank = 10_000
    
    static func vendCoins(numberOfCoinsToVend: Int) -> Int {
        let result = min(numberOfCoinsToVend, coinsInBank)
        coinsInBank -= result
        return result
    }
    static func receiveCoins(coins: Int) {
        coinsInBank += coins
    }
}

class BankPlayer {
    var coinsInPurse: Int
    
    init(coins: Int) {
        coinsInPurse = Bank.vendCoins(coins)
    }
    func winCoins(coins: Int) {
        coinsInPurse += Bank.vendCoins(coins)
    }
    deinit {
        Bank.receiveCoins(coinsInPurse)
    }
}

//因为玩家可以随时离开游戏，设置为隐式解包可选类型，使可以追踪玩家当前是否在游戏中
var bankPlayer: BankPlayer? = BankPlayer(coins: 100)
print("A new player has joined the game  with \(bankPlayer!.coinsInPurse)")
print("There ara now \(Bank.coinsInBank) coins left in the Bank")

bankPlayer!.winCoins(2_000)
print("BankPlayer won 2000 coins & now has \(bankPlayer!.coinsInPurse) coins")
print("The Bank now only has \(Bank.coinsInBank) coins left")

//玩家离开了游戏,该实例的析构器被自动调用,玩家的硬币被返还给银行
bankPlayer = nil
print("BankPlayer has left the game, the bank now has \(Bank.coinsInBank) coins")


/**
 *  自动引用计数 Automatic Reference Counting
 */

class Person {
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    var apartment: Apartment?
    deinit {
        print("\(name) is being deinitialized")
    }
}
class Apartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    weak var tenant: Person? //使用弱引用
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}

//定义3个可选的Person类型的变量, 自动初始化为nil
var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "John Appleseed")
reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
reference3 = nil

//类实例之间的循环强引用♻️ Strong Reference Cycle

var john: Person?
var unit4A: Apartment?

john = Person(name: "FighterRay")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john

john = nil
unit4A = nil//不会调用这两个变量的析构器

//对于生命周期中会变为nil的实例使用 弱引用 (只能用于可选类型的变量) weak reference
//对于初始化赋值后再也不会被赋值为nil的实例使用 无主引用 (用于非可选类型的常量或变量) unowned reference
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("Card #\(number) is being deinitialized")
    }
}

var ray: Customer? = Customer(name: "ray")
ray?.card = CreditCard(number: 1234_5678_9012_3456, customer: ray!)
ray = nil

//无主引用 和 隐式解析可选属性 unowned reference and implicitly unwrapped optional properties
class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")

//闭包引起的循环强引用
//闭包捕获列表 closure capture list
class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: Void -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)> \(text) </\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello world")
print(paragraph!.asHTML())
paragraph = nil


/**
 *  可选链式调用 Optional Chaining
 */
class People {
    var residence: Residence?
}

class Residence {
    var rooms = [Room]();
    var numberOfRooms: Int {
        return rooms.count
    }
    
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    
    var address: Address?
}

class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil && street != nil {
            return "\(buildingName) \(street)"
        } else {
            return nil
        }
    }
}

//通过可选链式调用来访问属性值, 在一个可选值上访问它的属性，并判断访问是否成功
let bob = People()
if let roomCount = bob.residence?.numberOfRooms {
    print("Bob's residence has \(roomCount) rooms")
} else {
    print("Unable to retrieve the number of rooms")
}

func creatAddress() -> Address {
    print("Function was called.")
    
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    
    return someAddress
}

//通过可选链式调用来设置属性值
//可选链式调用失败时，等号右侧的代码不会被执行

bob.residence?.address = creatAddress()

//通过可选链式调用调用方法
//如果在可选值上通过可选链式调用来调用这个方法，该方法的返回类型会是Void?，而不是Void，因为通过可选链式调用得到的返回值都是可选的
if bob.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}

//通过可选链式调用访问下标
if let firstRoomName = bob.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}

//以下赋值会失败，因为 residence 目前是 nil
bob.residence?[0] = Room(name: "Bathroom")

//访问可选类型的下标
var testScores = ["Dave": [1, 2, 3], "Bev": [4, 5 ,6]]
testScores["Dave"]?[0] = 91 //调用成功
testScores["Bev"]?[0] += 1 //调用成功
testScores["Brian"]?[0] = 72 //调用失败

//链接多层可选链式调用
//如果你访问的值不是可选的，可选链式调用将会返回可选值。如果你访问的值就是可选的，可选链式调用不会让可选返回值变得“更可选”。
if let johnsStreet = bob.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}

//在方法的可选返回值上进行可选链式调用
if let beginsWithThe =
    bob.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
        if beginsWithThe {
            print("Bob's building identifer begins with \"The\".")
        } else {
            print("Bob's building identifer does not begin with \"The\".")
        }
}


///**
// *  错误处理 Error Handing
// */
//
////表示在一个游戏中操作自动贩卖机时可能会出现的错误状态
//enum VendingMachineError: ErrorType {
//    case InvalidSelection   //选择无效
//    case InsufficientFunds(coinsNeeds: Int) //金额不足
//    case OutOfStock     //缺货
//}
//
//throw VendingMachineError.InsufficientFunds(coinsNeeds: 5)
//
////用throwing函数传递错误
//
//struct Item {
//    var price: Int
//    var count: Int
//}
//
//class VendingMachine {
//    var inventory = [
//        "Candy Bar": Item(price: 12, count: 7),
//        "Chips": Item(price: 10, count: 4),
//        "Pretzels": Item(price: 7, count: 11)
//    ]
//    
//    var coinsDeposited = 100
//    
//    func dispenseSnack(snack: String) {
//        print("Dispensing \(snack)");
//    }
//    
//    func vend(itemNamed name: String) throws {
//        guard var item = inventory[name] else {
//            throw VendingMachineError.InvalidSelection
//        }
//        
//        guard item.count > 0 else {
//            throw VendingMachineError.OutOfStock
//        }
//        
//        guard item.price <= coinsDeposited else {
//            throw VendingMachineError.InsufficientFunds(coinsNeeds: item.price - coinsDeposited)
//        }
//        
//        coinsDeposited -= item.price
//        item.count -= 1
//        inventory[name] = item
//        dispenseSnack(name)
//    }
//}
//
//let favoriteSnack = [
//    "Alice": "Chips",
//    "Bob": "Licorice",
//    "Eve": "Pretzles"
//]
//
//func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
//    let snackName = favoriteSnack[person] ?? "Candy Bar"
//    try vendingMachine.vend(itemNamed: snackName)
//}
//
////用Do-Catch处理错误
//var vendingMachine = VendingMachine()
//vendingMachine.coinsDeposited = 8
//do {
//    try buyFavoriteSnack("Alice", vendingMachine: vendingMachine)
//} catch VendingMachineError.InvalidSelection {
//    print("Invalid Selection.")
//} catch VendingMachineError.OutOfStock {
//    print("Out Of Stock")
//} catch VendingMachineError.InsufficientFunds(let coinsNeeded) {
//    print("Insufficient funds. Please insert an additional \(coinsNeeded)")
//}
//
////将错误转换成可选值, 下面的x, y等价
//func someThrowingFunction() throws -> Int {
//    return 1
//}
//
//let x = try? someThrowingFunction()
//
//let y: Int?
//do {
//    y = try someThrowingFunction()
//} catch {
//    y = nil
//}


/**
 *  类型转换 Type Casting
 */
//定义一个类层次作为例子
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

//数组 library 的类型被自动判断为[MediaItem]
let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

//检查类型
var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs")

//向下转型 Downcasting
for item in library {
    if let movie = item as? Movie {
        print("Movie: '\(movie.name)', dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: '\(song.name)', by \(song.artist)")
    }
}

//Any 和 AnyObject 的类型转换
let someObjects: [AnyObject] = [
    Movie(name: "2001: A Space Odyssey", director: "Stanley Kubrick"),
    Movie(name: "Moon", director: "Duncan Jones"),
    Movie(name: "Alien", director: "Ridley Scott")
]

for movie in someObjects as! [Movie] {
    print("Movie: '\(movie.name)', dir. \(movie.director)")
}

var things = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
//things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })

for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called '\(movie.name)', dir. \(movie.director)")
    case let stringConverter as String -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}


/**
 *  嵌套类型 Nested
 */
struct BlackjackCard {
    //嵌套的 Suit 枚举
    enum Suit: Character {
        case Spades = "♠︎", Hearts = "♡", Diamonds = "♢", Clubs = "♣︎"
    }
    
    //嵌套的 Rank 枚举
    enum Rank: Int {
        case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King, Ace
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .Ace:
                return Values(first: 1, second: 11)
            case .Jack, .Queen, .King:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}

let theAceOfSpades = BlackjackCard(rank: .Ace, suit: .Spades)
theAceOfSpades.description

//引用嵌套类型
let heartsSymbol = BlackjackCard.Suit.Hearts.rawValue
let QueenSymbol = BlackjackCard.Rank.Queen.rawValue


/**
 *  扩展 Extensions
 */
//扩展计算型属性
// 扩展可以添加新的计算型属性，但是不可以添加存储型属性，也不可以为已有属性添加属性观察器
extension Double {
    var km: Double { return self * 1_000.0 }
    var m : Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm
let threeFeet = 3.ft

//扩展构造器
//扩展能为类添加新的便利构造器，但是它们不能为类添加新的指定构造器或析构器
extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
let extensionCenterRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))

//扩展方法
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}
//使用尾随闭包让调用更加简洁
3.repetitions { 
    print("Hello")
}

//为结构体和枚举类型扩展可变实例方法
extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()

//扩展下标
extension Int {
    //返回十进制数字从右到左数的第n个数字
    subscript(digitIndex: Int) -> Int {
        var mutableDigitIndex = digitIndex
        var decimalBase = 1
        while mutableDigitIndex > 0 {
            decimalBase *= 10
            mutableDigitIndex -= 1
        }
        return (self / decimalBase) % 10
    }
}
74231[1]

//扩展嵌套类型
extension Int {
    enum Kind {
        case Negative, Zero, Positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .Zero
        case let x where x > 0:
            return .Positive
        default:
            return .Negative
        }
    }
}

func printIntergerKinds(numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .Negative:
            print("- ", terminator: "")
        case .Zero:
            print("0 ", terminator: "")
        case .Positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}
printIntergerKinds([3, 19, -27, 0, -6, 0, 7])



/**
 *  协议 Protocols
 */
//属性要求
protocol FullNamed {
    var fullName: String { get }
}

struct SomeOne: FullNamed {
    var fullName: String
}
let johnn = SomeOne(fullName: "Johnn")

class StarShip: FullNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String?) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}
var ncc1701 = StarShip(name: "Enterprise", prefix: "USS")

//方法要求
protocol RandomNumberGenerator {
    func random() -> Double
}
//线性同余生成器 实现伪随机数算法
class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
generator.random()
generator.random()

//Mutating 方法要求 (只对于值类型)
protocol Togglable {
    mutating func toggle()
}
enum onOffSwitch: Togglable {
    case Off, On
    mutating func toggle() {
        switch self {
        case Off:
            self = On
        case On:
            self = Off
        }
    }
}
var lightSwitch = onOffSwitch.Off
lightSwitch.toggle()

//协议作为类型
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}
var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    d6.roll()
}

//委托代理模式 delegation

//可以被任意涉及骰子的游戏采纳
protocol DiceGame {
    var dice: Dice { get }
    func play()
}
//可以被任意类型采纳，用来追踪DiceGame的游戏过程
protocol DiceGameDelegate {
    func gameDidStart(game: DiceGame)
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(game: DiceGame)
}

class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    //初始化游戏
    init() {
        board = [Int](count: finalSquare + 1, repeatedValue: 0)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02;
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08;
    }
    var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}

class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Roll a \(diceRoll)")
    }
    func gameDidEnd(game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}

let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()

//通过扩展添加协议一致性
protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}

let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
d12.textualDescription

extension SnakesAndLadders: TextRepresentable {
    var textualDescription: String {
        return "A game of Snakes and Ladders with \(finalSquare) squares"
    }
}
game.textualDescription

//通过扩展采纳协议
//一个类型已经符合了某个协议中的所有要求，却还没有声明采纳该协议
struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}
//通过空扩展体的扩展来采纳该协议
extension Hamster: TextRepresentable {}

let simonTheHamster = Hamster(name: "Simon")
let somethingTextRepresentable: TextRepresentable = simonTheHamster
somethingTextRepresentable.textualDescription

//协议类型的集合
let textaulThings: [TextRepresentable] = [game, d12, simonTheHamster]
for thing in textaulThings {
    thing.textualDescription
}

//协议的继承
protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}

extension SnakesAndLadders: PrettyTextRepresentable {
    var prettyTextualDescription: String {
        var output = textualDescription
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0:
                output += "▲ "
            case let snake where snake < 0:
                output += "▼ "
            default:
                output += "○ "
            }
        }
        return output
    }
}
game.prettyTextualDescription

//类类型专属协议
protocol SomeClassOnlyProtocol: class {
    // 这里是类类型专属协议的定义部分
}

//协议合成 protocol composition
protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct  ProtocolTestPerson: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(celebrator: protocol<Named, Aged>) {
    print("Happy birthday \(celebrator.name) - you're \(celebrator.age)!")
}
let brithdayPerson = ProtocolTestPerson(name: "Malcolm", age: 21)
wishHappyBirthday(brithdayPerson)

//检查协议一致性
protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}

class Country1: HasArea {
    var area: Double
    init(area: Double) { self.area  = area }
}

let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country1(area: 243_610),
    Person(name: "test")
]

for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Something that does't have an area")
    }
}

//可选的协议要求
@objc protocol CounterDataSource {
    optional func incrementForCount(count: Int) -> Int
    optional var fixedIncrement: Int { get }
}

class ProtocolCounter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.incrementForCount?(count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}

class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement: Int = 3
}

var counter = ProtocolCounter()
counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    counter.count
}

@objc class TowardsZeroSource: NSObject, CounterDataSource {
    func incrementForCount(count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}

counter.count = -4
counter.dataSource = TowardsZeroSource()
for _ in 1...5 {
    counter.increment()
    counter.count
}

//协议扩展
extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}

generator.random()
generator.randomBool()

//提供默认实现
extension PrettyTextRepresentable {
    var prettyTextualDescription: String {
        return textualDescription
    }
}

//为协议扩展添加限制条件
extension CollectionType where Generator.Element: TextRepresentable {
    var textualDesription: String {
        let itemAsText = self.map {
            $0.textualDescription
        }
        return "[" + itemAsText.joinWithSeparator(", ") + "]"
    }
}

let murrayTheHamster = Hamster(name: "murray")
let morganTheHamster = Hamster(name: "Morgan")
let mauriceTheHamster = Hamster(name: "Maurice")
let hamsters = [murrayTheHamster, morganTheHamster, mauriceTheHamster]
//因为Array符合Collection协议，而数组中的元素又符合TextRepresentable协议
hamsters.textualDesription


/**
 *  泛型 Generics
 */
func swapTwoValues<T>(inout a: T, inout _ b: T) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt1 = 1
var antherInt2 = 2
swapTwoValues(&someInt1, &antherInt2)
var someString = "Hello"
var antherString = "World"
swapTwoValues(&someString, &antherString)

//关联类型 Associated Type
protocol Container {
    associatedtype ItemType
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

//使用泛型定义一个Stack数据结构
struct Stack<Element>: Container {
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    //Container协议实现
    //typealias ItemType = Element //可以省略，类型编译器可以自行判断
    mutating func append(item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")

stackOfStrings[2]

let fromTheTop = stackOfStrings.pop()

//扩展一个泛型类型
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}
let topItem = stackOfStrings.topItem

//类型约束 Type Constraints
func findIndex<T: Equatable> (array: [T], _ valueToFind: T) -> Int? {
    for (index, value) in array.enumerate() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let doubleIndex = findIndex([3.123, 534.32, 432.3], 3.5)
let stringIndex = findIndex(["Mike", "Malcolm", "Andrea"], "Andrea")

//where子句 Where Clauses
//判断两个 Container 实例是否包含相同顺序的相同元素
func allItemsMatch<
    C1: Container, C2: Container
    where C1.ItemType == C2.ItemType, C1.ItemType: Equatable, C2.ItemType: Equatable>
    (someContainer: C1, _ anotherContainer: C2) -> Bool {
    
    // 检查两个容器含有相同数量的元素
    if someContainer.count != anotherContainer.count {
        return false
    }
    
    // 检查每一对元素是否相等
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    
    // 所有元素都匹配，返回 true
    return true
}

extension Array: Container {}

var arrayOfStrings = ["uno", "dos", "tres"]

if allItemsMatch(stackOfStrings, arrayOfStrings) {
    print("All items match.")
} else {
    print("Not all items match.")
}


/**
 *  访问控制 Access Control
 */
public class TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}

var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked."
stringToEdit.value += " This edit will increment numberOfEdits."
stringToEdit.value += " So will this one."
stringToEdit.numberOfEdits




















