//
//  RestaurantOrdersTableViewCell.swift
//  Otlob Clone
//
//  Created by Ahmed Ramy on 3/16/18.
//  Copyright © 2018 Ahmed Ramy. All rights reserved.
//

import UIKit

class RestaurantOrdersTableViewCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var activeStatusLabel: UILabel!
    @IBOutlet weak var orderTitleLabel: UILabel!
    @IBOutlet weak var orderDescriptionLabel: UILabel!
    @IBOutlet weak var orderPriceLabel: UILabel!
    @IBOutlet weak var orderImageView: UIImageView!
    @IBOutlet weak var qtyLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUserInformation(model: AuthenticationModel)
    {
        usernameLabel.text = model.username
        emailLabel.text = model.email
        phoneLabel.text = model.phone
        addressLabel.text = model.address
    }

    func setOrderInformation(model: OrdersItemModel)
    {
        timestampLabel.text = model.timestamp
        activeStatusLabel.text = String(describing: model.active)
        activeStatusLabel.textColor = (model.active! ? UIColor.green : UIColor.red)
    }
    
    func setOrderModel(model: ItemsOrderedModel)
    {
        orderTitleLabel.text = model.item_title
        orderDescriptionLabel.text = model.item_description
        orderPriceLabel.text = String(describing: model.item_price)
        orderImageView.image = model.item_image
        qtyLabel.text = String(describing: model.item_QTY)
    }
    
}
