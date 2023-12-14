//
//  Closures.swift
//  ios_developer_roadmap
//
//  Created by Tien Thanh on 12/7/23.
//

import Foundation

final class Closures {
    // MARK: - Leason 1: Functions, Closures
    /* Description
     Functions are some lines code, with the purpose is handle any logic or any task.
     params: Optional
     return: Optional
     Function is the special case of Closures
     Closure is return a func
     Function is return a value/ no value
     */
    
    // Example:
    func sum(with a:Int, and b: Int) -> Int {
        return a + b
    }
    // MARK: - Function Types
    /*
     Function type is created by params type and return type of this function.
     Such as the above example, the function type is Int
     Function type is used as param or return type of another function.
     */
    // Example:
    var sumMatchFunction: (Int, Int) -> Int
    
    /*
     Function is the special case of closure. There are three kinds of closure:
     - Global Functions:
     - Nested functions: It is functions is implement into others
     - Closure expressions:
     */
    // Example: Global functions
    func performAddition(_ a: Int,_ b: Int, _ operation: (Int, Int) -> Int) {
        let result = operation(a, b)
        print(result)
    }
    let additionClosure = { (a: Int, b: Int) -> Int in
        return a + b
    }
    func exampleGlobalFunc() {
        return performAddition(5, 3, additionClosure)
    }
    // Example: Nested functions
    func performAddition(_ a: Int, _ b: Int) {
        func sum(_ x: Int, _ y: Int) -> Int {
            return x + y
        }
        
        let result = sum(a, b)
        print(result)
    }
    // Example: Closure expressions
    func performAddition(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) {
        let result = operation(a,b)
        print(result)
    }
    
    func exampleClosureExpressionFunc() {
        performAddition(5, 3, operation: { x, y in
            return x + y
        })
    }
    // MARK: - non-escaping vs escaping
    /*
     - non-escaping closure is a normal closure. It will deinit when closure/ function return value.
     - escaping closure is a closure that use variables/ params outside that closure. In simple way, an escaping closure will hold onto memory even àter the function há finished executing
     */
    
    // Example escaping
    func performDelayedTask(task: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            task()
        }
    }
    
    func performDelayedTask() {
        performDelayedTask {
            print("This is an escaping closure")
        }
    }
    
    // Example non-escaping
    func performTaskImmediately(task: () -> Void) {
        task()
    }
    
    func performTaskImmediately() {
        performTaskImmediately {
            print("This is a non-escaping closure")
        }
    }
    
    // MARK: - autoclosure
    /*
     It means if you use @autoclosure in params of function. IDE will understand that is a closure, and you only use by () not ({})
     The details are in the below example
     */
    
    // Example normal closure
    func evaluate(_ condition: () -> Bool) {
        if condition() {
            print("Condition is true")
        } else {
            print("Condition is false")
        }
    }
    func exampleNormalClosure() {
        evaluate({ 5 > 3 }) // "Condition is true"
        
        evaluate({ 2 + 2 == 5 }) // "Condition is false"
    }
    
    // Example autoclosure closure
    func evaluate(_ condition: @autoclosure () -> Bool) {
        if condition() {
            print("Condition is true")
        } else {
            print("Condition is false")
        }
    }
    func exampleAutoClosure() {
        evaluate( 5 > 3 ) // "Condition is true"
        
        evaluate( 2 + 2 == 5 ) // "Condition is false"
    }
}
