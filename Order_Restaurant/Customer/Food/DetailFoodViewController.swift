//
//  DetailFoodViewController.swift
//  Order_Restaurant
//
//  Created by Nguyen Hung on 18/10/2022.
//

import UIKit

class DetailFoodViewController: UIViewController {

    var listFood: [Food]  = []
    @IBOutlet weak var lblPriceFood: UILabel!
    @IBOutlet weak var lblFoodAmount: UILabel!
    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var lblNameFood: UILabel!
    @IBOutlet weak var lblFoodDescription: UILabel!
    @IBOutlet weak var lblTimeFood: UILabel!
    var aFoodDetail: Food?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgFood.image = UIImage(named: "\(aFoodDetail?.foodImage)")
        self.lblFoodAmount.text = "\(aFoodDetail?.foodAmount)"
        self.lblNameFood.text = aFoodDetail?.foodName
        self.lblPriceFood.text = "\(aFoodDetail?.foodPrice)"
        self.lblFoodDescription.text = aFoodDetail?.foodDescription
        self.lblTimeFood.text = aFoodDetail?.foodTime
        createFood()
        
    }
    
    @IBAction func actionTieptuc(_ sender: Any) {
        let vc = YourMenuViewController(nibName: "YourMenuViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        for food in listFood {
//            var image = food.foodImage
//            imgFood.image = UIImage(image)
//            lblNameFood.text = food.foodName
//            lblFoodAmount.text = food.foodAmount
//            lblTimeFood.text = food.foodTime
//            lblPriceFood.text = food.foodPrice
//            lblFoodDescription.text = food.foodDescription
//        }
    }

    func createFood() {
        listFood.append(Food(foodId: 0, foodName: "Gà rán", foodPrice: 200000, foodDescription: "Gà ròn ngon, nóng hổi", foodImage: "Chicken", foodAmount: 4, foodTime: "20", foodCategory: "Gà", numberOfOrder: 4))
        listFood.append(Food(foodId: 0, foodName: "Cánh gà chiên ròn", foodPrice: 200000, foodDescription: "Thơm thơm, cay cay, ngon tuyệt vời", foodImage: "Chicken", foodAmount: 4, foodTime: "20", foodCategory: "Gà", numberOfOrder: 3))
        listFood.append(Food(foodId: 0, foodName: "Pepsi", foodPrice: 200000, foodDescription: "Đã quá Pepsi ơi", foodImage: "Chicken", foodAmount: 4, foodTime: "20", foodCategory: "Coca - Cola", numberOfOrder: 6))
        listFood.append(Food(foodId: 0, foodName: "Gà rán cay", foodPrice: 200000, foodDescription: "Gà ròn ngon, nóng hổi", foodImage: "Chicken", foodAmount: 4, foodTime: "20", foodCategory: "Gà", numberOfOrder: 9))
        listFood.append(Food(foodId: 0, foodName: "Gà chua ngọt", foodPrice: 200000, foodDescription: "Gà ròn ngon, nóng hổi", foodImage: "Chicken", foodAmount: 4, foodTime: "20", foodCategory: "Gà", numberOfOrder: 10))
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
