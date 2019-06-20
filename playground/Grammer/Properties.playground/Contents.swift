import Cocoa

//  지연 저장 프로퍼티 테스트
class OnCreate {
    init() {
        print("OnCreate!")
    }
}

class LazyTest {
    var base = 0
    lazy var late = OnCreate()  //  원래라면 init에 있는 내용보다 먼저 실행되어야 하지만 lazy가 붙었기 때문에 사용 시점까지 초기화 되지 않음.
    
    init() {
        print("Lazy Test")
    }
}

let lz = LazyTest()

class PropertyInit {
    //  저장 프로퍼티 - 인스턴스 생성 시 한 번만 실행
    var value01: String! = {
        print("value01 execute")
        return "value01"
    }()
    
    //  저장 프로퍼티 - 인스턴스 생성 시 한 번만 실행
    let value02: String! = {
        print("value02 execute")
        return "value02"
    }()
    
    //  저장 프로퍼티 - 인스턴스 생성 후 최초 참조 시 한 번만 실행
    lazy var value03: String! = {
        print("value03 execute")
        return "value03"
    }()
}

let s = PropertyInit()  //  값이 초기화 되기 때문에 클로저가 실행 됨.

s.value01   //  저장 프로퍼티이므로 클로저가 재실행 되지 않는다
s.value02   //  저장 프로퍼티이므로 클로저가 재실행 되지 않는다
s.value03   //  최초 참조 시점이므로 클로저가 실행 됨.

//   연산 프로퍼티 예제 : 유저 데이터
struct UserInfo {
    //  저장 프로퍼티 : 태어난 연도
    var birth: Int!
    
    //  연산 프로퍼티 : 올해가 몇년도인지 계산
    var thisYear: Int! {
        get{
            let df = DateFormatter()
            df.dateFormat = "yyyy"
            return Int(df.string(from: Date()))
        }
    }
    
    //  연산 프로퍼티 : 올해 - 태어난 연도 + 1
    var age: Int {
        get {
            return (self.thisYear - birth) + 1
        }
    }
}

let info = UserInfo(birth: 1995)
print(info.age)

struct Position {
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}

struct Rect {
    //  사각형이 위치한 기준 좌표 ( 좌측 상단 기준 )
    var origin = Position(x: 0.0, y: 0.0)
    
    //  가로 세로 길이
    var size = Size(width: 7.0, height: 7.0)
    
    //  사각형의 중심 좌표
    var center: Position {
        get {
            let centerX = self.origin.x + (self.size.width/2)
            let centerY = self.origin.y + (self.size.height/2)
            return Position(x: centerX, y: centerY)
        }
        
        set(newCenter) {
            self.origin.x = newCenter.x - (self.size.width/2)
            self.origin.y = newCenter.y - (self.size.height/2)
        }
    }
   
}

let position = Position(x: 0.0, y: 0.0)
let size = Size(width: 7.0, height: 7.0)

var square = Rect(origin: position, size: size)
print("square.ceterX = \(square.center.x), square.centerY = \(square.center.y)")

square.center = Position(x: 20.0, y: 20.0)
print("square.ceterX = \(square.origin.x), square.centerY = \(square.origin.y)")

//  프로퍼티 옵저버
struct Job {
    var income: Int = 0 {
        willSet(newIncome) {
            print("이번 달 월급은 \(newIncome) 입니다.")
        }
        
        didSet {
            if income > oldValue {
                print("월급이 \(income - oldValue)원 증가하셨네요. 소득세가 상향 조정될 예정입니다.")
            } else {
                print("저런, 월급이 삭감되었군요. 그래도 소득세는 깎아드리지 않아요. 알죠?")
            }
        }
    }
}

var job = Job(income: 1000000)
job.income = 2000000

//  타입 프로퍼티
struct Foo {
    //   타입 저장 프로퍼티
    static var sFoo = "구조체 타입 프로퍼티 값"
    
    //  타입 연산 프로퍼티
    static var cFoo: Int {
        return 1
    }
}

class Boo {
    //  타입 저장 프로퍼티
    static var sFoo = "클래스 타입 프로퍼티값"
    
    //  타입 연산 프로퍼티
    static var cFoo: Int {
        return 10
    }
    
    //  Boo를 상속받는 하위 클래스에서 재정의가 가능한 타입 연산 프로퍼티
    class var oFoo: Int {
        return 100
    }
}

print(Foo.sFoo)

Foo.sFoo = "새로운 값"
print(Foo.sFoo)

print(Boo.sFoo)

print(Boo.cFoo)
