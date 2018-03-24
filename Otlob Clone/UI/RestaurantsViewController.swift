//
//  RestaurantsViewController.swift
//  Otlob Clone
//
//  Created by Ahmed Ramy on 3/15/18.
//  Copyright © 2018 Ahmed Ramy. All rights reserved.
//

import UIKit

class RestaurantsViewController: BaseViewController {

    @IBOutlet weak var restaurantsTableView: UITableView!
    @IBOutlet weak var addARestaurantBtn: UIButton!
    
    var restaurantsModel : RestaurantsModel?
    var authenticationModel : AuthenticationModel?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        restaurantsTableView.register(UINib(nibName: "RestaurantCustomCell", bundle: nil), forCellReuseIdentifier: "RestaurantCustomCell")
        if authenticationModel?.owner == false
        {
            addARestaurantBtn.isHidden = true
        }
        loadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadData()
    }
    
    
    func loadData()
    {
        self.showLoading()
        
        
        RestaurantsBusiness().getRestaurants { (restaurantsModel, errorModel) in
            self.hideLoading()
            
            if errorModel == nil
            {
                self.restaurantsModel = restaurantsModel
                self.restaurantsTableView.reloadData()
            }
            else
            {
                self.showAlert(msg: (errorModel?.errorMsg)!)
            }
        }
    }

}

extension RestaurantsViewController : UITableViewDataSource , UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let restaurantsList = restaurantsModel?.restaurants
        {
            return restaurantsList.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = restaurantsTableView.dequeueReusableCell(withIdentifier: "RestaurantCustomCell", for: indexPath) as! RestaurantCustomCell
        
        cell.setModel(model: (restaurantsModel?.restaurants![indexPath.row])!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToRestaurantItem", sender: self)
    }
    
    
}
