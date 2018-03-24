//
//  LoginViewController.swift
//  Otlob Clone
//
//  Created by Ahmed Ramy on 3/15/18.
//  Copyright © 2018 Ahmed Ramy. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController
{

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
    }

    @IBAction func loginBtnPressed(_ sender: Any)
    {
        if (emailTextField.text?.count)! > 0
            && (passwordTextField.text?.count)! > 0
        {
            
            self.showLoading()
            
            AuthenticationBusiness().login(
                withEmail: emailTextField.text!,
                andPassword: passwordTextField.text!,
                andCompletionHandler: { (loginModel, errorModel) in
                    
                    self.hideLoading()
                    
                    // if error doesn't exist, store user data and move them to next screen
                    if errorModel == nil {
                        
                        UserDefaults.standard.set(true, forKey: Defaults.isLogged.rawValue)
                        UserDefaults.standard.set(loginModel?.id, forKey: Defaults.id.rawValue)
                        UserDefaults.standard.set(loginModel?.username, forKey: Defaults.username.rawValue)
                        UserDefaults.standard.set(loginModel?.email, forKey: Defaults.email.rawValue)
                        UserDefaults.standard.set(loginModel?.phone, forKey: Defaults.phone.rawValue)
                        UserDefaults.standard.set(loginModel?.address, forKey: Defaults.address.rawValue)
                        
                        self.performSegue(withIdentifier: "goToRestaurants", sender: self)
                        
                    } else {
                        
                        self.showAlert(msg: errorModel?.errorMsg ?? "")
                    }
                    
                    
            })
        } else {
            self.showAlert(msg: "You need to fill all data")
            
    }
    }
    
}
