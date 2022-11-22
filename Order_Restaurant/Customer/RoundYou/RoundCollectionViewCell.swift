//
//  RoundCollectionViewCell.swift
//  Order_Restaurant
//
//  Created by Nguyen Hung on 07/10/2022.
//

import UIKit

protocol GoToDetailResDelegate {
    func goToDetaiRes()
}

class RoundCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameRes: UILabel!
    @IBOutlet weak var imgLogoRes: UIImageView!
    @IBOutlet weak var txtDescripRes: UILabel!
    @IBOutlet weak var imgResOutstanding: UIImageView!
    var delegate: GoToDetailResDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func goToDetaiRes(_ sender: Any) {
        delegate?.goToDetaiRes()
    }
}
