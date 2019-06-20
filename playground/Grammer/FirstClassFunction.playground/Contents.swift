import Cocoa

//  특성 1 : 변수나 상수에 대입 가능

//  정수를 입력받는 함수
func foo(base: Int) -> String {
    return "결과값은 \(base + 1)입니다."
}

let fn1 = foo(base: 5)
//"결과값은 6입니다"

let fn2 = foo // fn2 상수에 foo 함수 할당
fn2(6)  //   "결과값은 7입니다."

let fn3: (Int) -> String = foo
let fn4: (Int) -> String = foo(base:)   //  둘 다 가능하다.
//  foo 는 함수의 이름. foo(base:)는 함수의 식별자

//  특성 2 : 함수의 반환 타입으로 함수 사용가능
func desc() -> String{
    return "this is desc()"
}

func pass() -> () -> String{
    return desc //  desc() 로 인자 명시도 가능.
}

let p = pass()
p() //  "this is desc()"

func plus (num1: Int, num2: Int) -> Int{
    return num1+num2
}

func minus (num1: Int, num2: Int) -> Int{
    return num1-num2
}

func multiple (num1: Int, num2: Int) -> Int{
    return num1*num2
}

func calc (_ oper: String) -> (Int, Int) -> Int{
    switch oper {
    case "+":
        return plus(num1:num2:)
    case "-":
        return minus(num1:num2:)
    case "*":
        return multiple(num1:num2:)
    default:
        return plus(num1:num2:)
    }
}

let c = calc("+")
c(2, 11)

//  특성3: 함수의 인자값으로 함수 사용 가능
func incr(param:Int) -> Int{
    return param + 1
}

func broker(base: Int, function fn: (Int) -> Int) -> Int{   //  중계 역할을 하는 함수를 Broker 라고 부름
    return fn(base)
}

broker(base: 7, function: incr(param:))


//  콜백함수 사용 예시
func successThrough(){
    print("연산 처리가 성공했습니다.")
}

func failThrough(){
    print("처리 과정에 오류가 발생했습니다.")
}

func divide(base: Int, success sCallBack: () ->Void, fail fCallBack: ()->Void) -> Int{
    
    guard base != 0 else {
        fCallBack()
        return 0
    }
    
    defer { //  값을 반환하는 return 구문과 성공 함수를 실행하는 과정 사이에 발생할 수 있는 미묘한 타이밍 차이를 해결. 함수에서 가장 마지막에 실행
        sCallBack()
    }
    
    return 100/base
}

divide(base: 3, success: successThrough, fail: failThrough)

//  함수의 중첩
func outer(base: Int) -> String{
    //  내부 함수
    func inner(inc: Int) -> String{
        return "\(inc)를 반환합니다."
    }
    let result = inner(inc: base + 1)
    return result
}

outer(base: 3)  //  "4를 반환합니다."

//  내부 함수에서 외부 함수의 지역 변수의 참조
func basic(param: Int) -> (Int) -> Int{
    let value = param + 20
    
    func append(add: Int)-> Int{
        return value + add
    }
    
    return append(add:)
}

let result = basic(param:10)    //  value = 30 을 가지는 append 함수가 생성되어 반환 되는 것. value 값은 클로저에 의해 유지된다.
/*
 해당 클로저의 정의
 func append(add: Int) -> Int{
    return 30 + add
 }
 */
result(10)  //  40


