//
//  Generics.swift
//  ios_developer_roadmap
//
//  Created by Tien Thanh on 12/7/23.
//

import Foundation

class Generics {
    // MARK: - Leason 3: Generics
    /*
     Generic code help you can code more flexible, reusable (both types and functions)
     Generics are one of the most powerful features of Swift. Generics can solve the duplicate implementation problems
     In swift basic, there are some name that you use it every day such as Array, dictionary, optional, etc.
     */
    
    // Example:
    let numbers = [1, 2, 3] // = [Int]
    let texts = ["1", "2", "3"] // = [String]
}

// MARK: - Generic Type implementation
struct Queue<Element> {
    fileprivate var elements: [Element] = []
    mutating func enqueue(newElement: Element) {
        elements.append(newElement)
    }
    
    mutating func dequeue() -> Element? {
        guard !elements.isEmpty else { return nil }
        return elements.remove(at: 0)
    }
}

extension Generics {
    func exampleGenericQueue() {
        var q = Queue<Int>()

        q.enqueue(newElement: 4)
        q.enqueue(newElement: 2)

        q.dequeue()
        q.dequeue()
        q.dequeue()
        q.dequeue()
    }
}

// MARK: - Generic Function implementation
extension Generics {
    func pairs<Key, Value>(from dictionary: [Key: Value]) -> [(Key, Value)] {
        return Array(dictionary)
    }
    
    func exampleGenericFunction() {
        let somePairs = pairs(from: ["minimum": 199, "maximum": 299])
        // result is [("maximum", 299), ("minimum", 199)]

        let morePairs = pairs(from: [1: "Swift", 2: "Generics", 3: "Rule"])
        // result is [(2, "Generics"), (3, "Rule"), (1, "Swift")]```
    }
}
// MARK: - constraint a generic
/*
 There are 3 main ways to add constraint to a generic type/ func.
 - Interface constraint: You can add a limit generic only accept types that implement a specific interface. Example: T: IComparable require T generic type must inplement interface Icomparable.
 - Class constraint: You can control generic type to accept all types that inherit class that implement T generic. Example: T: MyClass require all T generic types must be a subclass of MyClass
 - Constructor constraint: You can limit cll generic type to accept
 */
protocol Summable { static func +(lhs: Self, rhs: Self) -> Self }
extension Int: Summable {}
extension Double: Summable {}
extension String: Summable {}

func add<T: Summable>(x: T, y: T) -> T {
  return x + y
}

extension Generics {
    func exampleConstraintGeneric() {
        let addIntSum = add(x: 1, y: 2) // 3
        let addDoubleSum = add(x: 1.0, y: 2.0) // 3.0
        let addString = add(x: "Generics", y: " are Awesome!!! :]") //  "Generics are Awesome!!! :]"
    }
}

// MARK: - associatedtype, mutating, typealias
/*
 - associatedtype is using in a Protocol. It help Protocol to mark any object that class or struct use this protocol can change to a specific type such as String, Int, ect.
 */
// Example:
protocol Container {
    associatedtype Item
    
    mutating func addItem(_ item: Item)
    // ...
}

struct ArrayContainer<T>: Container {
    typealias Item = T
    
    mutating func addItem(_ item: Item) {
        // Thêm phần tử vào mảng
    }
    // ...
}

struct SetContainer<T>: Container {
    typealias Item = T
    
    mutating func addItem(_ item: Item) {
        // Thêm phần tử vào set
    }
    // ...
}
/*
 - mutating is used in a struct in swift (almost is function in a struct). Using this one to mark this func in struct can update value inside struct by this func
 */

// Example:
struct ArrayContainer<T>: Container {
    typealias Item = T
    
    var items: [Item] = []
    
    mutating func addItem(_ item: Item) {
        items.append(item)
    }
    // ...
}

/*
 - typealias is used to change name of types (short names) to use this type easier.
 */

// Example:
typealias MyInt = Int

let number: MyInt = 10
typealias Coordinate = (Double, Double)

let point: Coordinate = (3.14, 2.718)
