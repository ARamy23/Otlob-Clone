//
//  RestaurantItemsTableViewCell.swift
//  Otlob Clone
//
//  Created by Ahmed Ramy on 3/16/18.
//  Copyright © 2018 Ahmed Ramy. All rights reserved.
//

import UIKit

class RestaurantItemsTableViewCell: UITableViewCell
{

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setModel(model: ItemsModel)
    {
        itemImageView.image = model.item_image
        titleLabel.text = model.item_title
        descriptionLabel.text = model.item_description
        priceLabel.text = String(describing: model.item_price)
    }
}
