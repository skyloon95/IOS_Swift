import Cocoa

//  프로토콜 프로퍼티
protocol SomePropertyProtocol {
    var name: String { get set }
    var description: String { get }
}

//  프로토콜 메소드
protocol SomeMethodProtocol {
    func excute(cmd: String)
    func showPort(p: Int) -> String
}

struct RubyService: SomeMethodProtocol {
    func excute(cmd: String) {
        if cmd == "start" {
            print("실행합니다.")
        }
    }
    
    func showPort(p: Int) -> String {
        return "port : \(p)"
    }
}

//  프로토콜 메소드 2
protocol NewMethodProtocol {
    mutating func excute(cmd Command: String, desc: String)
    func showPort(p: Int, memo desc: String) -> String
}

struct RubyNewService: NewMethodProtocol {
    func excute(cmd Command: String, desc: String) {
        if Command == "start" {
            print("\(desc)를 실행합니다.")
        }
    }
    
    func showPort(p: Int, memo desc: String) -> String {
        return "port : \(p), Memo : \(desc)"
    }
}

struct RubyNewService2: NewMethodProtocol {
    func excute(cmd comm: String, desc d: String) {
        if comm == "start" {
            print("\(d)를 실행합니다")
        }
    }
    
    func showPort(p: Int, memo description: String) -> String {
        return "Port : \(p), Memo : \(description)"
    }
}

//  프로토콜 메소드에서의 mutating
protocol MService {
    mutating func excute(cmd: String)
    func showPort(p: Int) -> String
}

//   프로토콜에서 mutating이 사용되었기 때문에 사용할 수 있음.
struct RubyMService: MService {
    var paramCommand: String?
    
    mutating func excute(cmd: String) {
        self.paramCommand = cmd
        if cmd == "start" {
            print("실행합니다.")
        }
    }
    
    func showPort(p: Int) -> String {
        return "Port : \(p), now command: \(self.paramCommand!)"
    }
}

//  프로토콜에서 mutating이 사용되었다는 것은 객체에서 사용할 수 있다는 것이지 필수는 아님.
struct RubyMService2: MService {
    var paramCommand: String?
    
    func excute(cmd: String) {
        if cmd == "start" {
            print("실행합니다")
        }
    }
    
    func showPort(p: Int) -> String {
        return "Port : \(p), now command : \(self.paramCommand)"
    }
}

//  프로토콜에서의 타입 프로퍼티, 타입 메소드
protocol SomeTypeProperty {
    static var defaultValue: String { get set }
    static func getDefaultValue() -> String
}


struct TypeStruct: SomeTypeProperty {
    static var defaultValue: String = "default"
    static func getDefaultValue() -> String {
        return defaultValue
    }
}

class ValueObject: SomeTypeProperty {
    static var defaultValue: String = "default"
    class func getDefaultValue() -> String {
        return defaultValue
    }
}

//  프로토콜에서의 초기화 메소드
protocol SomeInitProtocol {
    init()
    init(cmd: String)
}

struct SInit: SomeInitProtocol {
    var cmd: String
    
    init() {
        self.cmd = "start"
    }
    
    init(cmd: String) {
        self.cmd = cmd
        
    }
}

//  클래스는 초기화 구문에 required 키워드를 붙일 것
class CInit: SomeInitProtocol {
    var cmd: String
    
    required init() {
        self.cmd = "start"
    }
    
    required init(cmd: String) {
        self.cmd = cmd
    }
}

//  Inheritance와 Protocol Implement가 동시에 이루어지는 경우
protocol Init {
    init()
}

class Parent {
    init() {
        
    }
}

//  override와 required 를 모두 사용
class Child: Parent, Init {
    override required init() {
    }
}

//  타입으로서 프로토콜을 사용하는 방식
protocol Wheel {
    func spin()
    func hold()
}

class Bicycle: Wheel {
    var moveState = false
    
    func spin() {
        self.pedal()
        
    }
    
    func hold() {
        self.pullBreak()
        
    }
    
    func pedal() {
        self.moveState = true
        
    }
    
    func pullBreak() {
        self.moveState = false
        
    }
}

let trans = Bicycle()

trans.moveState
trans.pedal()
trans.pullBreak()
trans.spin()
trans.hold()

let trans2: Wheel = Bicycle()
//  이 경우 Wheel protocol이 보장하는 spin() 과 hold() 만 사용할 수 있다.
trans2.spin()
trans2.hold()
//  코드 특성상 위 코드의 실질적 인스턴스는 Bicycle 인스턴스이며 실행 내용은 pedal과 pullBreak다. ( 메소드 은닉 )


//  다수의 프로퍼티에 대한 Implement

protocol A {
    func doA()
    
}

protocol B {
    func doB()
    
}

class Impl: A, B {
    func doA(){
        
    }
    
    func doB() {
        
    }
    
    func desc() -> String {
        return "Class instance method"
    }
    
}

//  A와 B 모두를 포함하는 객체 타입이라는 뜻.
var ipl: A & B = Impl()
ipl.doA()
ipl.doB()


