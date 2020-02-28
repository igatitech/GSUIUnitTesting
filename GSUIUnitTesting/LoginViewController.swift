//
//  LoginViewController.swift
//  GSUIUnitTesting
//
//  Created by Gati Shah on 27/02/20.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet weak var textFieldUserName : UITextField!
    @IBOutlet weak var textFieldPassword : UITextField!
    @IBOutlet weak var viewLoader : UIView!
    @IBOutlet weak var loader : UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //MARK:- Custom Methods
    func navigateToUnitTestScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let unitTestController = storyboard.instantiateViewController(identifier: "UnitTestController")
        self.navigationController?.pushViewController(unitTestController, animated: true)
    }
    
    //MARK:- IBActions
    @IBAction func buttonLoginClicked(_ sender : Any) {
        if isValidateForm() {
            viewLoader.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                if self.isValidUserNameAndPassword() {
                    self.navigateToUnitTestScreen()
                }
                self.viewLoader.isHidden = true
            }
        }
    }
    
}

extension LoginViewController {
    func isValidateForm() -> Bool {
        if self.textFieldUserName.text?.isEmpty ?? true || self.textFieldPassword.text?.isEmpty ?? true {
            self.presentAlert(withTitle: "Missing Credentials", message: "Missing UserName or Password")
            return false
        }
        return true
    }
    
    func isValidUserNameAndPassword() -> Bool {
        if self.textFieldUserName.text != "gatishah" && self.textFieldPassword.text != "gati@123" {
            self.presentAlert(withTitle: "Invalid Credentials", message: "Invalid UserName or Password")
            return false
        }
        return true
    }
    
    fileprivate func presentAlert(withTitle title : String, message : String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertOkAction = UIAlertAction(title: "OK", style: .default) { (okAction) in
        }
        alertController.addAction(alertOkAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
