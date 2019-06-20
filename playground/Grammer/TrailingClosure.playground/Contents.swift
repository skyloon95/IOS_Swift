import Cocoa

var value = [9, 11, 2, 5, 6, 8]

value.sort() { (s1, s2) in  //  by를 밖으로 끄집어내어 클로저를 작성
    return s1>s2
}

value.sort { s1, s2 in return s1<s2}    //  sort()의 괄호를 생략하고 by를 밖으로 끄집어내어 클로저를 사용
print(value)

//  @escaping
func callback(fn: @escaping () -> Void){    //  escaping 어노테이션을 통해 fn을 탈출 가능한 클로저로 변경.
    let f = fn
    f()
}
callback {
    print("callback 함수 실행 완료.")
}

//  @autoclosure 용 예제
func condition(stmt: () -> Bool){
    if stmt(){
        print("결과가 참입니다.")
    } else{
        print("결과가 거짓입니다.")
    }
}

condition(stmt: {4<2})
condition{ 2<4 }

//  @autoclosure 적용 후
func condition2(stmt: @autoclosure () -> Bool){
    if stmt(){
        print("결과가 참입니다.")
    } else{
        print("결과가 거짓입니다.")
    }
}

condition2(stmt: 4>2)

//  @autoclosure 를 이용한 지연실행.
var arrs = [String]()

func addVars(fn: @autoclosure () -> Void){
    //  배열 요소를 3개까지 추가하여 초기화
    arrs = Array(repeating: "", count: 3)
    //  인자값으로 전달된 클로저 실행
    fn()
}
//  현재 시점까지 arrs는 길이 0까리 배열이다. 그러므로
//  바로 arrs.insert("KR", at: 1)) 을 쓰게되면 0 길이의 배열의 1번째에 값을 채우라는 말이 됨. 오류 발생
addVars(fn: arrs.insert("KR", at: 1))   //  이렇게 하면 배열 길이를 늘린 뒤에 추가 가능하다. @autoclosure 활용
print(arrs)

