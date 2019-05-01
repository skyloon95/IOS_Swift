import UIKit

var cities = ["seoul", "newyork", "tokyo", "singapole"]
var cities2 : Array<String> = Array()

let length = cities.count

for idx in 0..<length{
    print("\(idx+1)번째 도시 : \(cities[idx])")
}

for city in cities {
    cities2.append(city)
}

for city in cities2{
    print("\(city)")
}

cities2.insert("kyoto", at: 3)

for city in cities2{
    print("\(city)")
}

var cities3 = Array(repeating: "name", count: 3)

for city in cities3{
    print("\(city)")
}

var alphabet = ["a", "b", "c", "d", "e"]

alphabet[0...1] //  ["a", "b"]
alphabet[1..<3] //  ["b", "c"]

alphabet[2...3] = ["1", "2", "3"]   //  alphabet = ["a", "b", "1", "2", "3", "e"] => 총 배열길이 증가
alphabet[2...4] = ["1"] //  alphabet = ["a", "b", "1", "e"] => 총 배열길이 감소

