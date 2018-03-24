//
//  RestaurantsItemViewController.swift
//  Otlob Clone
//
//  Created by Ahmed Ramy on 3/16/18.
//  Copyright © 2018 Ahmed Ramy. All rights reserved.
//

import UIKit

class RestaurantsItemViewController: BaseViewController {

    @IBOutlet weak var restaurantItemsTableView: UITableView!
    var restaurantItemsModel : RestaurantsItemModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        restaurantItemsTableView.register(UINib(nibName: "RestaurantItemsTableViewCell", bundle: nil), forCellReuseIdentifier: "RestaurantItemsTableViewCell")
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
                
                self.restaurantItemsTableView.reloadData()
            }
            else
            {
                self.showAlert(msg: (errorModel?.errorMsg)!)
            }
        }
    }
    
}

extension RestaurantsItemViewController: UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let restaurantItemsList = restaurantItemsModel?.items
        {
            return restaurantItemsList.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = restaurantItemsTableView.dequeueReusableCell(withIdentifier: "RestaurantItemsTableViewCell", for: indexPath) as! RestaurantItemsTableViewCell
        cell.setModel(model: (restaurantItemsModel?.items![(restaurantItemsModel?.restaurant_id)!])!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let otlobThis = UITableViewRowAction(style: .normal, title: "Otlob This") { (rowAction, indexPath) in
            //TODO: edit the row at indexPath here
        }
        otlobThis.backgroundColor = .green
        
        return [otlobThis]
    }
    
    
}
