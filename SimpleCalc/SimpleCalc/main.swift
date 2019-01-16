//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        var result = 0
        var index = 0
        let size = args.count
        let last = args[size - 1]
        switch last {
            case "count":
                if size == 1 {
                    result = 0
                } else {
                    return size - 1
                }
            case "avg":
                while index < size {
                    result += Int(args[index]) ?? 0
                    index += 1
                }
                if size == 1 {
                    result = 0
                } else {
                    result = result / (size - 1) 
                }
            case "fact":
                if size == 1 {
                    result = 0
                } else {
                    result = Int(args[0]) ?? 0
                    var num = (Int(args[0]) ?? 0) - 1
                    while num > 1 {
                        result *= num
                        num -= 1
                    }
                }
            default :
                result = Int(args[0]) ?? 0
                index = 1
                while index < size {
                    switch args[index] {
                        case "+":
                            result += Int(args[index + 1]) ?? 0
                        case "-":
                            result -= Int(args[index + 1]) ?? 0
                        case "*":
                            result *= Int(args[index + 1]) ?? 0
                        case "/":
                            result /= Int(args[index + 1]) ?? 1
                        case "%":
                            let num = Int(args[index + 1]) ?? 1
                            let divide = result / num
                            result = result - num * divide
                        default :
                            result = result * 1
                    }
                    index += 2
            }
            
        }
        return result
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

