import UIKit

var capital = [String : String]()

capital.updateValue("Seoul", forKey: "KR")
capital.updateValue("Tokyo", forKey: "JR")
capital.updateValue("Ottawa", forKey: "CA")
capital.updateValue("London", forKey: "UK")
capital.updateValue("Beijing", forKey: "CN")

capital["CA"] = nil

for item in capital{
    print("\(item)")
}

var removedValue = capital.removeValue(forKey: "CN")

print("삭제된 값은 : \(removedValue)")

for (key, value) in capital{
    print("\(key)의 수도는 \(value)입니다.")
}
