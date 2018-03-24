//
//  ViewController.swift
//  Otlob Clone
//
//  Created by Ahmed Ramy on 3/11/18.
//  Copyright © 2018 Ahmed Ramy. All rights reserved.
//

import UIKit
import UITextField_Shake

class WelcomeViewController: BaseViewController {

    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let isLogged = UserDefaults.standard.bool(forKey: Defaults.isLogged.rawValue)
        if(isLogged)
        {
            performSegue(withIdentifier: "goToRestaurants", sender: self)
        }
        
        self.hideKeyboardWhenTappedAround()
    }
    
    
    
    
    
}

