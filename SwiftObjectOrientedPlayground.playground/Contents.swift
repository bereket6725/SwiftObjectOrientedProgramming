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


