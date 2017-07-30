//
//  Retain Cycles 2.swift
//
//
//  Created by Carla on 2017/07/27.
//
//



//import Foundation
//
//class TestClass {
//    
//    var aBlock: (() -> ())? = nil
//    
//    let aConstant : Int = 5
//    
//    
//    init() {
//        print("init")
//        aBlock = { [weak self] in    //self is captured as weak!
//            print(self?.aConstant)
//        }
//    }
//    
//    deinit {
//        print("deinit")
//    }
//    
//    
//}
//
//var testClass: TestClass? = TestClass()
//testClass = nil

class TestClass {
    
    let aConstant = 5
    
    init() {
        print("init")
        let aBlock = {
            print(self.aConstant)
        }
    }
    
    deinit {
        print("deinit")
    }
    
    
}

var testClass: TestClass? = TestClass()
testClass = nil