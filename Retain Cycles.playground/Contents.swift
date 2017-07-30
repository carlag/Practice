//http://www.thomashanning.com/retain-cycles-weak-unowned-swift/


//    class TestClass {
//            
//            init() {
//                print("init")
//            }
//            
//            deinit {
//                print("deinit")
//            }
//            
//        }
//
//    var testClass: TestClass? = TestClass()
//    testClass = nil


//    class TestClass {
//        
//        var testClass: TestClass? = nil
//        
//        init() {
//            print("init")
//            
//        }
//        
//        deinit {
//            print("deinit")
//        }
//        
//    }
//
//    var testClass1: TestClass? = TestClass()
//    var testClass2: TestClass? = TestClass()
//
//    testClass1?.testClass = testClass2
//    testClass2?.testClass = testClass1
//
//testClass1 = nil
//testClass2 = nil

//class TestClass {
//    
//    weak var testClass: TestClass? = nil //Now this is a weak reference!
//    
//    init() {
//        print("init")
//        
//    }
//    
//    deinit {
//        print("deinit")
//    }
//    
//}
//
//var testClass1: TestClass? = TestClass()
//var testClass2: TestClass? = TestClass()
//
//testClass1?.testClass = testClass2
//testClass2?.testClass = testClass1
//
//testClass1 = nil
//testClass2 = nil



//print("test")


//
//import UIKit
//
//class ParentViewController: UIViewController, ChildViewControllerProtocol {
//    deinit {
//        print("deinit parent")
//    }
//    let childViewController = ChildViewController()
//    
//    func prepareChildViewController() {
//        
//        childViewController.delegate = self
//    }
//    
//}
//
//protocol ChildViewControllerProtocol: class {
//    
//    //important functions...
//    
//}
//
//class ChildViewController: UIViewController {
//    
//    deinit {
//        print("deinit child")
//    }
//    
//    
//    var delegate: ChildViewControllerProtocol?
//    
//}

//var p = ParentViewController()
//p = nil


class TestClass {
    
    var aBlock: (() -> ())? = nil
    
    let aConstant = 5
    
    
    init() {
        print("init")
        aBlock = {
            print(self.aConstant)
        }
    }
    
    deinit {
        print("deinit")
    }
    
    
}

var testClass: TestClass? = TestClass()
testClass = nil
