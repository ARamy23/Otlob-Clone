//
//  RegisterViewController.swift
//  Otlob Clone
//
//  Created by Ahmed Ramy on 3/14/18.
//  Copyright © 2018 Ahmed Ramy. All rights reserved.
//

import UIKit

class RegisterViewController: BaseViewController {

    @IBOutlet weak var usertypeSegControl: UISegmentedControl!
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var isOwner: Bool = false;
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
    }
    @IBAction func didChoseType(_ sender: Any)
    {
        switch usertypeSegControl.selectedSegmentIndex
        {
        case 0:
            isOwner = false;
        case 1:
            isOwner = true;
        default:
            break;
        }
    }
    
    @IBAction func registerBtnPressed(_ sender: Any)
    {
        if (usernameTextField.text?.count)! > 0
            && (passwordTextField.text?.count)! > 0
            && (emailTextField.text?.count)! > 0
            && (phoneTextField.text?.count)! > 0
            && (addressTextField.text?.count)! > 0
        {
            self.showLoading()
            
            AuthenticationBusiness().register(withUsername: usernameTextField.text!, andPassword: passwordTextField.text!, andPhone: phoneTextField.text!, andEmail: emailTextField.text!, andAddress: addressTextField.text!, andOwner: isOwner, andCompletionHandler: { (loginModel, errorModel) in
                self.hideLoading()
                if errorModel == nil
                {
                    let alertController = UIAlertController(title: "Success!", message: "Registeration Successful.\nGo and login and order something !", preferredStyle: UIAlertControllerStyle.alert)
                    let alertAction = UIAlertAction(title: "Alright !", style: UIAlertActionStyle.default, handler: { (action) in
                        self.performSegue(withIdentifier: "goToLogin", sender: self)
                    })
                    alertController.addAction(alertAction)
                    self.present(alertController, animated: true, completion: nil)
                }
                else
                {
                    self.showAlert(msg: errorModel?.errorMsg ?? "")
                }
            })
        }
        else
        {
            showAlert(msg: "You need to fill up all the form fields in order to register")
        }
            
    }
    
    
}
