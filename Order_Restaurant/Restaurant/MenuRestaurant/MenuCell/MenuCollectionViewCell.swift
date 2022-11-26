//
//  MenuCollectionViewCell.swift
//  Order_Restaurant
//
//  Created by Nguyen Hung on 18/10/2022.
//

import UIKit
protocol ActionEditFoodResDelegate {
    func editFoodRestaurant(food: Food?)
    func deleteFoodRes(food: Food?, index: Int)
}

protocol ActionChooseQualytiOrderDelegate {
    func addFoodOrder(food: Food?, index: Int)
    func deleteFoodOrder(food: Food?, index: Int)
}

class MenuCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var txtQualityFood: UILabel!
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var imgFoodRes: UIImageView!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var elementChooseQuality: UIStackView!
    @IBOutlet weak var priceFood: UILabel!
    @IBOutlet weak var timeFood: UILabel!
    @IBOutlet weak var qualityFood: UILabel!
    @IBOutlet weak var descripFood: UILabel!
    @IBOutlet weak var nameFood: UILabel!
    var food: Food?
    var delegateUpdate: ActionEditFoodResDelegate?
    var delegateAction: ActionChooseQualytiOrderDelegate?
    
    var indexPath: Int?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func editFoodRestaurant(_ sender: Any) {
        delegateUpdate?.editFoodRestaurant(food: Food(foodId: 0, foodName: nameFood.text ?? "", foodPrice: Int(priceFood.text ?? "") ?? 0, foodDescription: descripFood.text ?? "", foodImage: "" , foodAmount: 0, foodTime: timeFood.text ?? "", foodCategory: "", numberOfOrder: 3))
    }
    
    @IBAction func deleteFoodRes(_ sender: Any) {
        delegateUpdate?.deleteFoodRes(food: Food(foodId: 0, foodName: food?.foodName ?? "", foodPrice: food?.foodPrice ?? 0, foodDescription: food?.foodDescription ?? "", foodImage: "", foodAmount: 0, foodTime: food?.foodTime ?? "", foodCategory: food?.foodCategory ?? "", numberOfOrder: 6), index: indexPath ?? 0)
    }
    
    @IBAction func addFoodOrder(_ sender: Any) {
        delegateAction?.addFoodOrder(food: food, index: indexPath ?? 0)
    }
    
    @IBAction func deleteFoodOrder(_ sender: Any) {
        delegateAction?.deleteFoodOrder(food: food, index: indexPath ?? 0)
    }
    
}
