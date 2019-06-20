import Cocoa

typealias info_type1 = ( Int, Character, String )
typealias info_type2 = ( h : Int, g : Character, n : String )

func getUserInfo () -> info_type1{  //  character형 혼동 방지를 위해 자료형 명시
    let gender : Character = "F"
    let height : Int = 175
    let name : String = "모설아"
    
    return (height, gender, name)
}

func getUserInfo2 () -> info_type2{ //  미리 튜블 반환시 변수 정의 가능.
    let gender : Character = "F"
    let height : Int = 175
    let name : String = "모설아"
    
    return (height, gender, name)
}

var info = getUserInfo()
info.0
info.1
info.2

var info2 = getUserInfo2()
info2.h
info2.g
info2.n

