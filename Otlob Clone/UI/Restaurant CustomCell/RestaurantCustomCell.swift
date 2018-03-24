//
//  RestaurantCustomCell.swift
//  Otlob Clone
//
//  Created by Ahmed Ramy on 3/11/18.
//  Copyright © 2018 Ahmed Ramy. All rights reserved.
//

import UIKit

class RestaurantCustomCell: UITableViewCell {

    
    @IBOutlet weak var restaurant_title: UILabel!
    @IBOutlet weak var restaurant_describtion: UILabel!
    @IBOutlet weak var restaurant_address: UILabel!
    @IBOutlet weak var delivery_time: UILabel!
    @IBOutlet weak var delivery_fee: UILabel!
    @IBOutlet weak var restaurant_image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setModel(model : RestaurantsItemModel)
    {
        restaurant_title.text = model.restaurant_title
        restaurant_describtion.text = model.restaurant_description
        restaurant_address.text = model.restaurant_address
        delivery_fee.text = String(describing: model.delivery_fee!)
        delivery_time.text = String(describing: model.delivery_time_mins!)
        restaurant_image.image = model.restaurant_image
    }
    
}
