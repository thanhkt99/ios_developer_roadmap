//
//  Initializers.swift
//  ios_developer_roadmap
//
//  Created by Tien Thanh on 12/7/23.
//

import Foundation

class Initializers {
    // MARK: - Leason 2: Initialization
    /* Description
     Initializers or Initialization are called with purpose to create an instance of class/ struct/ object.
     By using init keyword, you will implement an instance of class/ struct/ object. This init do not required params but you can use what you need to create an instance
     In a class/ struct/ object, if you do not set the initial value for each property, Xcode will display error notitification. Such as message "Class 'Closures' has no initializers".
     If you do not want to set initial value, you have to set this one to optional type.
     A class/ struct/ object can help many init.
     */
    
    // Example: many init in a class Initializers
    init() {
        print("Create an instance")
    }
    
    init(name: String, since: Int) {
        print("\(name) created new instance")
    }
    
    // MARK: - Initializer Delegation. Designated Initializers and Convenience Initializers
    /*
     Initializer Delegation is an initial inside another initial
     Designated Initializers will create all required params of a class/ struct/ object
     Convenience Initializers will not create all required params of a class/ struct/ object. It just create params that developer need to handle some thing
     */
    // Example Designated Initializers
    init(name: String) {
        print("\(name) created new instance")
    }
    
    // Example Convenience Initializers
    convenience init(name: String, age: Int) {
        let since = 2023 - age
        self.init(name: name, since: since)
    }
}

// MARK: - Optional initialization/ Failable initializer

/*
 Optional initialization is a init using optional type.
 */
struct Person {
    let name: String
    let age: Int
    var numberOfChild: Int
}
// Example Optional initialization/ Failable initializer:
extension Person {
    init?(name: String, age: Int) {
        if age < 0 {
            return nil
        }
        
        self.name = name
        self.age = age
        self.numberOfChild = 2
    }
}

let tom = Person(name: "Tom", age: 17)

// Example Failable initializer:
enum InvalidPersonError: Error {
    case EmptyName
    case InvalidAge
}

extension Person {
    init(name: String, age: Int) throws {
        if name.isEmpty {
            throw InvalidPersonError.EmptyName
        }
        
        if age < 0 {
            throw InvalidPersonError.InvalidAge
        }
        
        self.name = name
        self.age = age
        self.numberOfChild = 2
    }
}

do {
    let tom = try Person(name: "Tom", age: 27)
} catch InvalidPersonError.EmptyName {
    print("name cannot empty")
} catch InvalidPersonError.InvalidAge {
    print("age cannot smaller than 0")
}

// MARK: Required initializer:
/*
 Required initializer is the similar to Designated Initializer. The difference is that if a subclass inherits from a class, it must ensure that it meets all the required init of the parant class, whereas Designated initializers do not have this requirement
 */
