import Cocoa

struct Resolution {
    
    var width = 0
    var height = 0
    
    //  초기화 메소드 : Width를 인자값으로 받음
    init(width: Int){
        self.width = width
    }
}


class VideoMode {
    
    var resolution = Resolution(width: 2048)
    var interlaced = false
    var frameRate = 0.0
    var name: String?
    
    //  초기화 메소드 : interlaced, frameRate 두 개의 인자값을 받음
    init(interlaced: Bool, frameRate: Double) {
        self.interlaced = interlaced
        self.frameRate = frameRate
    }
}


let resolution = Resolution.init(width: 4096)
let videoMode = VideoMode(interlaced: true, frameRate: 40.0)

//  constructor overriding 예제
class Base {
    var baseValue: Double
    init(inputValue: Double) {
        self.baseValue = inputValue
    }
}

class ExBase: Base {
    override init(inputValue: Double) {
        super.init(inputValue: inputValue)
    }
}

//  부모 클래스에 기본 초기화 구문만 정의 되어 있는 경우
class A {
    var a: Double
    
    init() {
        self.a = 0.0
        print("A Init")
    }
}

class B: A {
    //  super.init() 불필요. 어차피 자식 클래스는 부모 클래스의 프로퍼티와 메소드를 가지고, 부모가 제공하는 init이 한가지 뿐이라면 자동으로 init()이 호출되는 것.
    override init() {
        print("B Init")
    }
}

let b = B()

//  부모에 기본 초기화 구문 외에 다른 초기화 구문이 추가되어 있는 경우
class C {
    var c: Int
    
    init() {
        self.c = 0
        print("C Init")
    }
    
    init(_ num: Int) {
        self.c = num
        print("C Init, c = \(c)")
    }
}

class D: C {
    override init() {
        super.init()
        print("D Init")
    }
}

let d: D = D()
