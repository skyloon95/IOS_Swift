import Cocoa

//  일급 함수로서의 특성을 이용한 클로저 표현 할당 이후 사용
let fn = { () -> Void in
    print("클로저가 실행됩니다.")
}
fn()

//  할당도 하지 않고 싶을 경우
({ () -> Void in
    print("클로저가 실행됩니다.")
})()

let c = { (s1: Int, s2: String) -> Void in
    print("s1 : \(s1) // s2 : \(s2)")
}
c(10, "Test")

({ (s1: Int, s2: String) -> Void in
    print("s1 : \(s1) // s2 : \(s2)")
})(20, "Closure")

//  클로저 표현식을 이용한 경량 문법 - 경량화 이전
var value = [1, 9, 5, 7, 3, 2]

func order(s1: Int, s2: Int) -> Bool {
    if s1>s2{
        return true
    } else {
        return false
    }
}

value.sort(by:order)    //  [9, 7, 5, 3, 2, 1]

//  클로저 표현식을 이용한 경량 문법 - 경량화 이후
value.sort(by: { (s1: Int, s2: Int) -> Bool in
    if s1>s2{
        return true
    } else {
        return false
    }
})  //  [9, 7, 5, 3, 2, 1]

//  앞서 학습한 함수 인자 파라미터를 이용한 응용

func orderBy(order: String) -> (Int, Int) -> Bool{
    switch order {
    case "ASC":
        return {(s1: Int, s2: Int) -> Bool in return s1<s2 }
    case "DESC":
        return {(s1: Int, s2: Int) -> Bool in return s1>s2 }
    default:
        return {(s1: Int, s2: Int) -> Bool in return s1<s2 }
    }
}

value.sort(by:orderBy(order: "ASC"))    //  [1, 2, 3, 5, 7, 9]
value.sort(by:orderBy(order: "DESC"))   //  [9, 7, 5, 3, 2, 1]

//  클로저 반환값의 생략
({ (s1: Int, s2: Int) in return s1<s2 })(3, 5)  //  true

//   클로저 타입어노테이션의 생략
( {(s1, s2) in return s1>s2})(7, 3) //  true

//  타입 어노테이션과 함께 parameter를 감싼 괄호도 생략
({s1, s2 in return s1<s2})(6, 5)    //  false

//  실전 적용
value.sort(by: { s1, s2 in return s1<s2 })  //  [1, 2, 3, 5, 7, 9]
print(value)

//  변수 이름 생략
({return $0<$1})(3, 7)  //  true

//  최종 적용
value.sort(by: {return $0>$1})  //  [9, 7, 5, 3, 2, 1]
print(value)

//  단순한 연산의 경우 연산자 함수로 이용 가능
value.sort(by: <)


