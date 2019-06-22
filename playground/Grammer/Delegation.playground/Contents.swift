import Cocoa

protocol FuelPumpDelegate {
    func lakeFuel()
    func fullFuel()
}

class FuelPump {
    var maxGage: Double = 100.0
    var delegate: FuelPumpDelegate? = nil
    
    var fuelGage: Double {
        didSet {
            if oldValue < 10 {
                //  연료가 부족해지면 델리게이트의 lackFuel 메소드를 호출함.
                self.delegate?.lakeFuel()
            } else if oldValue == self.maxGage {
                //  연료가 가득차면 델리게이트의 fullFuel 메소드를 호출함.
                self.delegate?.fullFuel()
            }
        }
    }
    init(fuelGage: Double = 0) {
        self.fuelGage = fuelGage
    }
    
    //  연료펌프를 가동한다.
    func startPump () {
        while(true) {
            if (self.fuelGage > 0){
                self.jetFuel()
            } else {
                break
            }
        }
    }
    
    //  연료를 엔진에 분사한다. 분사할 때마다 연로 게이지 눈금 내려감
    func jetFuel() {
        self.fuelGage -= 1
    }
}

class car: FuelPumpDelegate {
    var fuelPump = FuelPump(fuelGage: 100)
    
    init() {
        self.fuelPump.delegate = self
    }
    
    //  fuelPump가 호출하는 메소드
    func lakeFuel() {
        //  연료를 보충한다.
    }
    
    //  fuelPump가 호출하는 메소드
    func fullFuel() {
        //  연료 보충을 중단한다.
    }
    
    func start() {
        fuelPump.startPump()
    }
}

//  Extension과 protocol
class Man {
    var name: String?
    
    init(name: String = "홍길동") {
        self.name = name
    }
}

protocol Job {
    func doWork()
}

//  extension에서는 저장 프로퍼티를 정의할 수 없다.
extension Man: Job {
    func doWork() {
        print("\(self.name!)님이 일을 합니다.")
    }
}

let man = Man(name: "모설아")
man.doWork()

//  protocol의 Inheritance
protocol A {
    func doA()
}

protocol B {
    func doB()
}

protocol C: A, B {
    func doC()
}

//  protocol C 가 protocol A 와 B의 명세를 모두 받았으므로 class ABC는 세 프로토콜의 명세를 모두 정의해야한다.
class ABC: C {
    func doA() {
        
    }
    
    func doB() {
        
    }
    
    func doC() {
        
    }
    
}

let abc: C = ABC()
//  abc.doA(), abc.doB(), abc.doC() 사용 가능

let a: A = ABC()
//  abc.doA()

let ab: A&B = ABC()
//   abc.doA(), abc.doB()

let abc2: A & B & C = ABC()
//  abc.doA(), abc.doB(), abc.doC() 사용 가능


func foo(abc: C) {}
foo(abc: ABC())

func boo(abc: A & B) {}
boo(abc: ABC())


@objc
protocol MsgDelegate {
    @objc optional func onReceive(new:Int)
}

