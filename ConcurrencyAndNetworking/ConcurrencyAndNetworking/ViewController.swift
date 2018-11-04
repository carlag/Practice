//
//  ViewController.swift
//  ConcurrencyAndNetworking
//
//  Created by Carla on 04/11/2018.
//  Copyright © 2018 Carla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculatePrimeNumbersButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateButtonTapped(_ sender: Any) {
        let operationQueue = OperationQueue()
        operationQueue.addOperation {
            for number in 0 ... 100_000_000 {
                let isPrime = self.isPrimeNumber(number: number)
                print("\(number) is prime: \(isPrime)")
            }
        }
    }
    
    func isPrimeNumber(number: Int) -> Bool {
        if number <= 1 {
            return false
        }
        
        if number <= 3 {
            return true
        }
        
        var i = 2
        while i * i <= number {
            if number % i == 0 {
                return false
            }
            i = i + 2
        }
        return true
    }
    
}

