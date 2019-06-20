import Cocoa

//  기본 클래스
class A {
    var name = "Class A"
    
    var description: String {
        return "Name of class is \(self.name)"
    }
    
    func foo() {
        print("\(self.name)'s method foo is called!")
    }
}

let a = A()

a.name  //  "Class A"
a.description   //  "This class name is ClassA"
a.foo()

//  서브 클래스
class B : A {
    var prop = "Class B"
    
    func boo() -> String {
        return "Class B prop = \(self.prop)"
    }
    
}

let b = B()
b.prop  //  "Class B"
b.boo() //  Class B prop = Class B

b.name   //  "Class A"
b.foo() //  "Class A's method foo is called!"

b.name = "Class C"
b.foo() //  "Class C's method foo is called!"

class Vehicle {
    var currentSpeed = 0.0
    
    var description: String{
        return "시간당 \(self.currentSpeed)의 속도로 이동하고 있습니다"
    }
    
    func makeNoise(){
        //  임의의 교통수단 자체는 경적을 울리는 기능이 필요 없음
    }
}

let baseVehicle = Vehicle()
baseVehicle.description

class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true

bicycle.currentSpeed = 20.0

print("자전거 : \(bicycle.description)")

class RoadCycle: Bicycle{
    var material = "Carbon"
}

let roadCycle = RoadCycle()

roadCycle.hasBasket = false
roadCycle.material = "Aluminum"
roadCycle.currentSpeed = 37.7
print("roadCycle : \(roadCycle.description)")

//  프로퍼티 오버라이딩 예시
class Car: Vehicle {
    var gear = 0
    var engineLevel = 0
    
    override var currentSpeed: Double {
        get {
            return Double(self.engineLevel * 50)
        }
        //  아무 동작도 하지 않더라도 원래 저장 프로퍼티였기 때문에 set구문 역시 구현은 해줘야 한다.
        set {
            //  아무 동작도 하지 않음.
        }
    }
    
    override var description: String {
        get {
            return "Car : engineLevel = \(self.engineLevel), so currentSpeed = \(self.currentSpeed)"
        }
        //  원래 읽기 전용 연산 프로퍼티였으나 쓰기 기능도 추가.
        set {
            print("New Value is \(newValue)")
        }
    }
}

let c = Car()

c.engineLevel = 5
c.currentSpeed  //  250
c.description = "New Class Car"

print(c.description)

//  프로퍼티 옵저버 추가
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            self.gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let ac = AutomaticCar()
ac.engineLevel = 5
ac.currentSpeed = 100
ac.gear

//  메소드 오버라이딩 예시
class Bike: Vehicle {
    override func makeNoise() {
        print("빠라빠라빠라빰")
    }
}

let bk = Bike()
bk.makeNoise()

class HybridCar: Car {
    //  아무 것도 추가로 선언하지 않음.
}

class KickBoard: Vehicle {
    //  아무 것도 추가로 선언하지 않음
}

let h = HybridCar()
h.description

let k = KickBoard()
k.description


