import Cocoa

func avg (score: Int ...) -> Double{
    var scoreSum: Int = 0
    
    for scr in score {
        scoreSum += scr
    }
    
    let average:Double = Double(scoreSum)/Double(score.count)
    
    return average
}

print(avg(score:97,77,83,99,100))

func incrementBy(base: Int) -> Int{
    var base = base
    base += 1
    return base
}

print(incrementBy(base: 4))

var cnt = 30

func autoIncrement(value: Int) -> Int {
    var value = value
    value += 1
    
    return value
}

func autoIncrement2(value: inout Int) -> Int {
    value += 1
    
    return value
}

print(autoIncrement(value: cnt))
print(cnt)  //  위에서 autoIncrement에 넣어 값을 반환 받았지만 cnt의 원 값은 영향을 받지 않음.

print(autoIncrement2(value: &cnt))
print(cnt)
