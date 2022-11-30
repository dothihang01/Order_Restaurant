//
//  HeaderCell.swift
//  Order_Restaurant
//
//  Created by Nguyen Hung on 18/10/2022.
//

import UIKit

class HeaderCell: UICollectionViewCell {

    @IBOutlet weak var addressRes: UILabel!
    @IBOutlet weak var rate: UIButton!
    @IBOutlet weak var nameRes: UILabel!
    @IBOutlet weak var imgRes: UIImageView!
    @IBOutlet weak var dateTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
