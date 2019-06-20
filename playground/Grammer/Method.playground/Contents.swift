import Cocoa

struct Resolution {
    var width = 0
    var height = 0
    
    //  구조체의 요약된 설명을 리턴해주는 인스턴스 메소드
    func desc() -> String{
        let desc = "이 해상도는 가로 \(self.width) X 세로 \(self.height)로 구성됩니다."
        return desc
    }
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
    
    //  클래스의 요약된 설명을 리턴해주는 인스턴스 메소드
    func desc() -> String {
        if self.name != nil {
            let desc = "이 비디오 모드는 \(self.frameRate)의 프레임 비율로 표시됩니다."
            return desc
        } else {
            let desc = "이 비티오 모드는 \(self.frameRate)의 프레임 비율로 표시됩니다."
            return desc
        }
    }
}

class Counter {
    //  카우넡를 저장할 프로퍼티
    var count = 0
    
    //  카운트를 1 증가
    func increment() {
        self.count += 1
    }
    
    //  입력된 값만큼 카운트를 증가
    func incrementBy(amount:Int) {
        self.count += amount
    }
    
    //   카운트를 0으로 초기화
    func reset() {
        self.count = 0
    }
}

let counter = Counter()
counter.increment()
counter.incrementBy(amount: 5)
counter.reset()

//  구조체 인스턴스 메소드에서 인스턴스 프로퍼티의 수정
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveByX(x deltaX: Double, y deltaY: Double) {
        self.x += deltaX
        self.y += deltaY
    }
}

var point = Point(x: 10.5, y: 12.0)
point.moveByX(x: 3.0, y: 4.5)
print("이제 새로운 좌표는 (\(point.x), \(point.y)) 입니다.")

class Foo {
    //  타입 메소드 선언
    class func fooTypeMethod() {
        //  타입 메소드의 구현 내용이 여기에 들어감.
    }
}

//  let f = Foo() 는 오류.
Foo.fooTypeMethod()
