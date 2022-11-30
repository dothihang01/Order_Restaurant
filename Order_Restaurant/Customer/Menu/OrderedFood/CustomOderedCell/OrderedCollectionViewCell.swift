//
//  OrderedCollectionViewCell.swift
//  Order_Restaurant
//
//  Created by Nguyen Hung on 18/10/2022.
//

import UIKit

class OrderedCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var nameOrder: UILabel!
    @IBOutlet weak var txtNote: UILabel!
    @IBOutlet weak var qualityOrder: UILabel!
    @IBOutlet weak var imgOrder: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
