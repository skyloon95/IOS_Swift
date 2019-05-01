import UIKit

var capital = [String : String]()

capital.updateValue("Seoul", forKey: "KR")
capital.updateValue("Tokyo", forKey: "JR")
capital.updateValue("Ottawa", forKey: "CA")
capital.updateValue("London", forKey: "UK")
capital.updateValue("Beijing", forKey: "CN")

var item : String? = capital["KR"]
if item == nil{
    print("조회 실패. 해당 키 값이 존재하지 않습니다.")
} else{
    print("조회 하신 국가의 수도 : \(item!)")
}

item = capital["JJ"]
if item == nil{
    print("조회 실패. 해당 키 값이 존재하지 않습니다.")
} else{
    print("조회 하신 국가의 수도 : \(item!)")
}
