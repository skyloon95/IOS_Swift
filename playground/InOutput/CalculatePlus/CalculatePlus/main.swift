//
//  main.swift
//  CalculatePlus
//
//  Created by 모설아 on 30/04/2019.
//  Copyright © 2019 Snow. All rights reserved.
//
import Foundation

func input() -> (Int, Int) {
    var str : String?
    var num1 : Int = -1
    var num2 : Int = -1
    
    str = readLine()!
    let split = str!.components(separatedBy: " ")
    var arr : [Int?] = []
    
    for item in split{
        arr.append(Int(item))
    }
    
    num1 = arr[0]!
    num2 = arr[1]!
    
    return (num1, num2)
}

let (A, B) = input()

print(A+B)
