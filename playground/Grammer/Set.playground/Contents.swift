import UIKit

var items : Set = ["몽둥이", "손도끼", "단검", "투헨디드 소드"]

for item in items{
    print("\(item)")
}

print("====sortred()====")

for item in items.sorted(){
    print("\(item)")
}

print("====check items====")

for item in items{
    print("\(item)")
}

var items2 : Set = ["바스타드 소드", "손도끼", "롱보우", "스태프"]
let items2SubByitems : Set = items2.subtracting(items)

print("====subtract=====")

for item in items2SubByitems{
    print("\(item)")
}

var items3 : Set = ["바스타드 소드", "롱보우"]

print("====메소드 테스트====")
print("items3는 items2의 부분집합? \(items3.isSubset(of: items2))")
print("items와 items3는 disjoint 인가? \(items.isDisjoint(with: items3))")

print("====중복 인자 정리====")
let arr : Array<Int> = [1, 1, 2, 3, 4, 2, 3, 5, 7, 9]
let afterSet : Array<Int> = Array(Set(arr).sorted())
for i in afterSet{
    print("\(i)")
}

