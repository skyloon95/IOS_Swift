import UIKit

func devide(number : Int) -> Int{
    guard number != 0 else{
        print("0 은 나눌 수 없습니다.")
        return -1
    }
    
    guard number > 0 else{
        print("양수만 나눌 수 있습니다")
        return -1
    }
    
    return number/3
}

let value = 25

print("\(25) 나누기 3 은 \(devide(number : value)) 입니다.")
