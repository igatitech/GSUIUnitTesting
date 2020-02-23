//
//  ViewController.swift
//  GSUIUnitTesting
//
//  Created by Gati Shah on 23/02/20.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var firstName : String?
    var phoneNumber : String?
    var email : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func validFirstName() -> Bool {
        return firstName?.count ?? 0 > 3
    }
    
    func validPhoneNumber() -> Bool {
        return phoneNumber?.count ?? 0 > 11
    }
    
    func isValidEmail(_ testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func computeFibonacciSeries(seriesValue : Int) -> Int {
        var x = -1 ,y = 1, sum = 0;
            
        for _ in 0...seriesValue {
            sum = x+y
            x   = y
            y   = sum
            print(sum)
        }
        return sum
    }

}

