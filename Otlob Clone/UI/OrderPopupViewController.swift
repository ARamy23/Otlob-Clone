//
//  OrderPopupViewController.swift
//  Otlob Clone
//
//  Created by Ahmed Ramy on 3/21/18.
//  Copyright © 2018 Ahmed Ramy. All rights reserved.
//

import UIKit

struct OrdersModel {
    var restaurant_id: [Int]?
    var order_id: [Int]?
    var order_item: [String]?
    var order_qtys : [Int]?
    var order_price: [Double]?
}

class OrderPopupViewController: RestaurantsItemViewController {

    @IBOutlet weak var hostView: UIView!
    @IBOutlet weak var qtysTextField: UITextField!
    @IBOutlet weak var priceLabel: UILabel!
    var restaurant_id: Int?
    var order_id: Int?
    var order_item: String?
    var order_qtys: Int?
    var order_price: Double?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        optUI()
    }
    
    
    
    func optUI()
    {
        hostView.layer.cornerRadius = 10
        hostView.layer.borderWidth = 0.75
        hostView.layer.borderColor = UIColor.green.cgColor
    }

    @IBAction func orderBtnPressed(_ sender: Any)
    {
        
    }
    

}
