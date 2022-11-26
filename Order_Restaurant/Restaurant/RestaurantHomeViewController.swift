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
    var listRestaurant: [Restaurant] = []
    
    
    var restaurants: Restaurant? {
           didSet {
               if isViewLoaded {
                   lblName.text = restaurants?.restaurantName
                   lblDesc.text = restaurants?.restaurantDescription
                   lblAddress.text = restaurants?.restaurantAddress
               }
           }
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDataRestaurant()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        for restaurant in listRestaurant {
            lblName.text = restaurant.restaurantName
            lblDesc.text = restaurant.restaurantDescription
            lblAddress.text = restaurant.restaurantAddress
        }
    }
    
    func createDataRestaurant() {
        listRestaurant.append(Restaurant(restaurantId: 0, restaurantName: "Mc Donald", restaurantAddress: "Nguyễn Trãi, Thanh Xuân", restaurantDescription: "Gà rán - CocaCola", restaurantImage: "McDonald", numberOfVisit: 0, typeAccount: 0, logoRes: "McDonald", location: 5, food: FoodInRestaurant.listFoodRes, table: [Table(numberTable: 10)]))
        listRestaurant.append(Restaurant(restaurantId: 1, restaurantName: "Lotteria", restaurantAddress: "Nguyễn Tuân, Thanh Xuân", restaurantDescription: "Gà rán - Kem", restaurantImage: "Lotteria", numberOfVisit: 3, typeAccount: 0, logoRes: "Lotteria", location: 1, food: FoodInRestaurant.listFoodRes, table: [Table(numberTable: 20)]))
    }
    
    @IBAction func goToMenuRestaurant(_ sender: Any) {
        let vc = MenuRestaurantViewController(nibName: "MenuRestaurantViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
