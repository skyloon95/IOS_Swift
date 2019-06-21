import Cocoa

class Vehicle {
    var currentSpeed = 0.0
    
    func accelerate() {
        self.currentSpeed += 1
    }
}

class Car: Vehicle {
    var gear: Int {
        return Int(self.currentSpeed / 20) + 1
    }
    
    func wiper() {
        //  창을 닦습니다.
    }
}

//  부모로 타입 캐스팅
let trans: Vehicle = Car()

class SUV: Car {
    var fourWheel = false
}

//  부모의 부모로 타입 캐스팅
let jeep: Vehicle = SUV()

//  타입 캐스팅의 실제 이용 ( 호환 )
func move(param: Vehicle) {
    param.accelerate()
}

var list = [Vehicle]()

list.append(Vehicle())
list.append(Car())
list.append(SUV())

//  타입 비교 연산
SUV() is SUV    //  true
SUV() is Car    //  true
SUV() is Vehicle    //  true

Car() is Vehicle    //  true
Car() is SUV    //  false

let myCar: Vehicle = SUV()

if myCar is SUV {
    print("myCar는 SUV 타입입니다")
} else {
    print("myCar는 SUV 타입이 아닙니다")
}

let newCar: Vehicle = Car()

if newCar is SUV {
    print("newCar는 SUV 타입입니다")
} else {
    print("newCar는 SUV 타입이 아닙니다")
}

let anyCar: Car = SUV()
let anyVehicle = anyCar as Vehicle

//  오류 검증 후 다운 캐스팅
let anySUV = anyCar as? SUV
if anySUV != nil {
    print("\(anySUV!) 캐스팅이 성공하였습니다")
}

//  축약
if let someSUV = anyCar as? SUV {
    print("\(someSUV) 캐스팅이 성공하였습니다")
}

//  강제 다운 캐스팅
let theSUV = anyCar as! SUV
print("\(theSUV) 캐스팅이 성공하였습니다")

var allCar: AnyObject = Car()
allCar = SUV()

var value: Any = "Sample String"
value = 3
value = false
value = [1, 3, 5, 7, 9]
value = {
    print("함수가 실행됩니다")
}

func name(_ param: Any) {
    print("\(param)")
}

name(3)
name(false)
name([1,3,5,7,9])
name {
    print(">>>")
}

var rows = [Any]()
rows.append(3)
rows.append(false)
rows.append([1,3,5,7,9])
rows.append{
    print(">>>")
}
