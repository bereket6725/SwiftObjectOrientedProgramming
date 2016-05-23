//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//classes
class Product
{
    var title:String
    var price:Double = 0.0
    
    //designated initializer
    init(title:String, price:Double){
        self.title = title
        self.price = price
    }
    
    //class method
    func discountedPrice(percentage:Double)->Double
    {
        return price - (price*percentage/100)
    }
    
}

let quadcopter = Product(title:"quadcopter" , price:500.00)

quadcopter.price
quadcopter.discountedPrice(50.0)
quadcopter.price

//an enum created for Clothing Sizes
enum Size {
    case Small, Medium, Large
    init(){
        self = .Small
    }
}


//Inheritance
class Clothing: Product{ //Product is the super class
    var size = Size()
    var designer: String = ""
    
    init(title: String, price:Double, designer:String){
        self.designer = designer
        
        //allows us to use our custom initialization and the original initialization so we have all three
        //super init must be called AFTER you defined the values of your properties (in this case its the "designer" string)
        super.init(title: title, price: price)
    }
    
    //Generally, a convenience initializer is an initializer that provides default values and fewer parameters than a designated initializer
    //Cannot call the Super initializer in the Convenience initializer
    convenience init(title:String){
        self.init(title:title,price:99,designer:"Calvin Klein")
    }
    
    
    //"override" is used ahead of "func" to let the program know we are ovveriding the method of the superclass
    //overridden methods must have the same name, parameters and return type
    //essentially, all thats changed are the commands within the function
    override func discountedPrice(percentage:Double = 10.0)->Double
    {
        //instead of writing "return price - (price*percentage/100)" again we can refer to the super class
        return super.discountedPrice(percentage)
    }
    
}

var tshirt = Clothing(title:"Vintage", price:49.99, designer:"Prada")
tshirt.title
tshirt.size

//calling the overridden function (however we can call it as it was originally intended)
tshirt.discountedPrice()


//Sneakers is an instance of Product which is Clothings SuperClass, A Super class does not take on any of added qualities of its sublass. In this case we do not have access to clothing. We Call Product the "Base Class"

let Sneakers = Product(title: "NewBalance", price:60.00)










//Another Example of inheritance and custom designated initializers in Swift :)

class Button {
    var width: Double
    var height: Double
    
    init(width:Double, height:Double){
        self.width = width
        self.height = height
    }
    
    func scaleBy(points: Double){
        width += points
        height += points
    }
}

class RoundButton: Button {
    var cornerRadius: Double = 5.0
    
    init(width:Double,height:Double,cornerRadius:Double){
        self.cornerRadius = cornerRadius
        super.init(width: width, height: height)
    }
}




//example of a class using getter and setter methods
class Temperature {
    var celsius: Float = 0.0
    var fahrenheit: Float {
        get{
            return (celsius * 1.8) + 32
        }
        set {
            //cannot use fahrenheit, must use special variable "newValue" to set a computed property
            celsius = (newValue - 32) / 1.8
        }
    }
}


//another class using getter and setters
class Furniture: Product {
    
    var height: Double
    var width : Double
    var length: Double
    //computed properties cannot be immutable (let) properties,
    //this is a getter method
    var surfaceArea: Double {
        get{
            return length*width
        }
        set{
            length = sqrt(newValue)
            width = sqrt(newValue)
        }
    }
    
    init( title: String,
          price: Double,
          height:Double,
          width: Double,
          length:Double ) {
        self.height = height
        self.width  = width
        self.length = length
        super.init(title:title, price:price)
    }
    
    
}



//class with using an optional property
class Electronic : Product {
    //an optional can be nil, and since we are not initializing it, batters is nil
    var batteries : Bool?
}

let toy = Electronic(title: "RC Car", price: 79)
toy.batteries //value is nil, but thats cool since its an optional

toy.batteries = true
toy.batteries!

//Often used when creating IBOUtlets in iOS apps
if let batteries = toy.batteries {
    
    if batteries{
        print("batteries included")
    }
}


//--------------------------------------------------------------------------------------------//
                                //Classes VS Structs

//Classes are Reference types and Structs are Value types


//Class = reference type
class ProductClass
{
    var title:String
    var price:Double = 0.0
    
    //designated initializer
    init(title:String, price:Double){
        self.title = title
        self.price = price
    }
    
    //class method
    func discountedPrice(percentage:Double)->Double
    {
        return price - (price*percentage/100)
    }
    
}


var phoneClass = ProductClass(title: "iPhone 6", price: 800)
var bigPhoneClass = phoneClass
bigPhoneClass.title
bigPhoneClass.title = "iPhone 6+"
phoneClass.title


//struct = value type
struct ProductStruct {
    
    var title:String
    var price:Double = 0.0
    
}


var phoneStruct = ProductStruct(title: "Nexus", price: 500)

var bigPhoneStruct = phoneStruct
bigPhoneStruct.title
bigPhoneStruct.title = "iPhone 6+"

phoneStruct.title// phoneStruct and bigPhoneStruct are completely independent instances, this is fundamental to understanding the differences between classes and structs 

//Classes become more complex to manage because their values affect eachother

//---------------------------------------------------------------------------------------------------------



//Create a base class called Shape which will have 2 properties: sides and name
//Create a subclass called Square, it will also have 2 properties called: sideLength and area.
//The area property will be a computed property with getter and setter methods.
//Add a designated initializer to Square which accept all three properties: sides, name and sideLength
//Add a convenience initializer to Square that will accept only the sideLength and provide default values. 4 for sides and “Square” for name
//    Create an instance of Square using the convenience initializer








class Shape{
    let sides: Int
    let name : String
    
    
    init(sides: Int, name: String){
        self.sides = sides
        self.name  = name
    }
}


class Square: Shape {
    
    var sideLength: Double
    var area: Double{
        get
        {
            return sideLength*sideLength
        }
    
        set
        {
            sideLength = sqrt(newValue)
        }
    }
    init(name:String, sides: Int, sideLength: Double){
        self.sideLength = sideLength
        super.init(sides: sides, name: name)
    }
    
    convenience init (sideLength: Double){
        self.init(name: "Square", sides:4, sideLength:sideLength)
    }
}


let square = Square(sideLength: 20)

square.name
square.sides
square.sideLength
square.area
square.area = 100
square.sideLength




//-------------------------------------------------------------------------------------------------------//


class Vehicle {
    let wheels: Int
    let doors: Int
    
    // Designated initializer
    init(wheels:Int, doors:Int){
        self.wheels = wheels
        self.doors  = doors
    }
}

class Car: Vehicle {
    
    init(){
        // call super.init
        super.init(wheels: 4, doors: 4)
    }
    
    
}


//------------------------------------------------------------------------------------------------------//
//Struct Example 

struct TodoItem {
    var title     = "Default title"
    var content   = "Default content"
    var dueDate   = NSDate()
    let owner: String
}

extension TodoItem {
    init(owner:String) {
        self.owner = owner
    }
}
