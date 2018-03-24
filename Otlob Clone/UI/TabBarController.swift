//
//  TabBarController.swift
//  Otlob Clone
//
//  Created by Ahmed Ramy on 3/15/18.
//  Copyright © 2018 Ahmed Ramy. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func logoutBtnPressed(_ sender: Any)
    {
        navigationController?.popToRootViewController(animated: true)
        //need to check if there is more of an efficient way to do this
    }
    

    

}
