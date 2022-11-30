//
//  RestaurantHomeViewController.swift
//  Order_Restaurant
//
//  Created by Hường Minh on 11/10/2022.
//

import UIKit

class RestaurantHomeViewController: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var imgQr: UIImageView!
    @IBOutlet weak var lblAddress: UILabel!
//    var listRestaurant: [Restaurant] = []
    var aRestaurant: Restaurant?
    
//    var restaurants: Restaurant? {
//           didSet {
//               if isViewLoaded {
//                   lblName.text = restaurants?.restaurantName
//                   lblDesc.text = restaurants?.restaurantDescription
//                   lblAddress.text = restaurants?.restaurantAddress
//               }
//           }
//       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDataRestaurant()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        lblName.text = aRestaurant?.restaurantName
        lblDesc.text = aRestaurant?.restaurantDescription
        lblAddress.text = aRestaurant?.restaurantAddress
    }
    
    func createDataRestaurant() {
//        FoodInRestaurant.listResGeneral.append(Restaurant(restaurantId: 0, restaurantName: "Mc Donald", restaurantAddress: "Nguyễn Trãi, Thanh Xuân", restaurantDescription: "Gà rán - CocaCola", restaurantImage: "McDonald", numberOfVisit: 0, logoRes: "McDonald", location: 5, food: FoodInRestaurant.listFoodRes, table: [Table(numberTable: 10)], account: Account(accountId: 0, accountName: "abc", password: "000000", typeAccount: 0)))
//        FoodInRestaurant.listResGeneral.append(Restaurant(restaurantId: 1, restaurantName: "Lotteria", restaurantAddress: "Nguyễn Tuân, Thanh Xuân", restaurantDescription: "Gà rán - Kem", restaurantImage: "Lotteria", numberOfVisit: 3, logoRes: "Lotteria", location: 1, food: FoodInRestaurant.listFoodRes, table: [Table(numberTable: 20)], account: Account(accountId: 1, accountName: "def", password: "111111", typeAccount: 1)))
//        FoodInRestaurant.listResGeneral.append(Restaurant(restaurantId: 2, restaurantName: "Lotteria", restaurantAddress: "Nguyễn Tuân, Thanh Xuân", restaurantDescription: "Gà rán - Kem", restaurantImage: "Lotteria", numberOfVisit: 3, logoRes: "Lotteria", location: 1, food: FoodInRestaurant.listFoodRes, table: [Table(numberTable: 20)], account: Account(accountId: 2, accountName: "abc", password: "222222", typeAccount: 0)))
//        FoodInRestaurant.listResGeneral.append(Restaurant(restaurantId: 3, restaurantName: "Lotteria", restaurantAddress: "Nguyễn Tuân, Thanh Xuân", restaurantDescription: "Gà rán - Kem", restaurantImage: "Lotteria", numberOfVisit: 3, logoRes: "Lotteria", location: 1, food: FoodInRestaurant.listFoodRes, table: [Table(numberTable: 20)], account: Account(accountId: 3, accountName: "def", password: "333333", typeAccount: 1)))
    }
    
    @IBAction func goToMenuRestaurant(_ sender: Any) {
        let vc = MenuRestaurantViewController(nibName: "MenuRestaurantViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
