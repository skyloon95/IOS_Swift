import Cocoa

//  Double에 대한 extensions
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0}
    var mm: Double { return self / 1_000.0}
    var description: String {
        return "\(self)km 는 \(self.km)m, \(self)cm는 \(self.cm)m, \(self)mm는 \(self.mm)m 입니다"
    }
}

2.km    //  2000m
5.5.cm  //  0.055m
125.mm  //  0.125m
7.0.description

let distance = 42.0.km + 195.m
print("마라톤의 총 거리는 \(distance)m 입니다")

//  메소드 익스텐션
extension Int {
    func repeatRun(task: () -> Void) {  //  숫자만큼 매개변수로 전달 된 함수를 반복 실행
        for _ in 0 ..< self {
            task()
        }
    }
}

let d = 3
d.repeatRun {
    print("わかります")
}

extension Int {
    mutating func square() {
        self = self * self
    }
}

var value = 3
value.square()  //  9, 값을 변경하게 되므로 let은 사용 불가능하다.




