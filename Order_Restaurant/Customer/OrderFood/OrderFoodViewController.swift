//
//  OrderFoodViewController.swift
//  Order_Restaurant
//
//  Created by Nguyen Hung on 08/10/2022.
//

import UIKit

class OrderFoodViewController: UIViewController {

    @IBOutlet weak var goToMenu: UIButton!
    @IBOutlet weak var checkHeart: UIButton!
    @IBOutlet weak var nameResOrder: UILabel!
    @IBOutlet weak var btnTieptuc: UIButton!
    @IBOutlet weak var priceFoodsOrder: UILabel!
    @IBOutlet weak var imgDetailOrder: UIImageView!
    @IBOutlet weak var foodBestCollectionView: UICollectionView!
    @IBOutlet weak var txtQualityOrder: UILabel!
    @IBOutlet weak var listFoodInResCollectionView: UICollectionView!
    @IBOutlet weak var desDetailOrder: UILabel!
    
    var listRes: [Restaurant] = []
    var listFoodBestSaler: [Food] = []
    var aFood: Food?
    var foodOrder: Food?
    var aRes: Restaurant?
    var listFoodOrder: [Food] = []
    var indexRow = 0
    var listFavourite: [Restaurant] = []
    var isCheck = false
    var sumPrice = 0
    var sumQuality = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.foodBestCollectionView.delegate = self
        self.foodBestCollectionView.dataSource = self
        self.listFoodInResCollectionView.delegate = self
        self.listFoodInResCollectionView.dataSource = self
        
        self.btnTieptuc.layer.cornerRadius = 5
        
        self.nameResOrder.text = aRes?.restaurantName
        self.imgDetailOrder.image = UIImage(named: "\( aRes?.restaurantImage ?? "")")
        self.desDetailOrder.text = aRes?.restaurantDescription
        self.foodBestCollectionView.register(UINib(nibName: "CustomBestSellerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        
        self.listFoodInResCollectionView.register(UINib(nibName: "MenuCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "menuCollectionViewCell")
        
        for food in FoodInRestaurant.listFoodOrder {
            if food.numberOfOrder > 5 {
                listFoodBestSaler.append(food)
            }
        }
    }
    
    @IBAction func actionTieptuc(_ sender: Any) {
        let vc = YourMenuViewController(nibName: "YourMenuViewController", bundle: nil)
        vc.listYourOrder = listFoodOrder
        vc.aRestaurant = aRes
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnFavourite(_ sender: Any) {
        if isCheck {
            checkHeart.setImage(UIImage(named: "Favorite"), for: .normal)
            FoodInRestaurant.listFavouriteRes.append(aRes!)
            isCheck = false
        } else {
            checkHeart.setImage(UIImage(named: "Favorite-1"), for: .normal)
            listFoodOrder.removeAll()
            isCheck = true
        }
    }
}

extension OrderFoodViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.foodBestCollectionView {
            return listFoodBestSaler.count
        }
        return FoodInRestaurant.listFoodRes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
  
        if collectionView == self.foodBestCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomBestSellerCollectionViewCell
            cell.imgFoodCus.image = UIImage(named: "\(listFoodBestSaler[indexPath.row].foodImage)")
            cell.nameFoodCus.text = listFoodBestSaler[indexPath.row].foodName
            cell.priceFoodCus.text = "\(listFoodBestSaler[indexPath.row].foodPrice)"
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCollectionViewCell", for: indexPath) as! MenuCollectionViewCell
            cell.imgFoodRes.image = UIImage(named: "\(FoodInRestaurant.listFoodRes[indexPath.row].foodImage)")
            cell.delegateAction = self
            cell.nameFood.text = FoodInRestaurant.listFoodRes[indexPath.row].foodName
            cell.descripFood.text = FoodInRestaurant.listFoodRes[indexPath.row].foodDescription
            cell.priceFood.text = "Giá: \(FoodInRestaurant.listFoodRes[indexPath.row].foodPrice)"
            cell.indexPath = indexPath.row
            cell.qualityFood.text = "Số lượng: \(FoodInRestaurant.listFoodRes[indexPath.row].foodAmount)"
            cell.timeFood.text = "\(FoodInRestaurant.listFoodRes[indexPath.row].foodTime) phút"
            cell.txtQualityFood.text = "\(FoodInRestaurant.listFoodRes[indexPath.row].numberOfOrder)"
            cell.btnEdit.isHidden = true
            cell.btnClose.isHidden = true
            cell.elementChooseQuality.isHidden = false
            return cell
        }
    }
    
    //    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    //        let headerView :HeaderCategoryViewController = listFoodCollectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerCategoryViewController", for: indexPath) as! HeaderCategoryViewController
    //            headerView.listCategory = listShowCategory
    //            return headerView
    //    }
    //
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailFoodViewController(nibName: "DetailFoodViewController", bundle: nil)
//        if collectionView == self.listFoodInResCollectionView {
//            aFood = FoodInRestaurant.listFoodRes[indexPath.row]
//            vc.aFoodDetail = aFood
//        } else {
            aFood = listFoodBestSaler[indexPath.row]
            vc.aFoodDetail = aFood
//        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.listFoodInResCollectionView {
            return CGSize(width: UIScreen.main.bounds.width - 40, height: 100)
        }
        return CGSize(width: 120, height: 150)
    }
    
}

extension OrderFoodViewController: ActionChooseQualytiOrderDelegate {
    func addFoodOrder(food: Food?, index: Int) {
        if FoodInRestaurant.listFoodRes[index].numberOfOrder < 0 {
            FoodInRestaurant.listFoodRes[index].numberOfOrder = 0
        } else {
            FoodInRestaurant.listFoodRes[index].numberOfOrder += 1
            listFoodOrder.append(FoodInRestaurant.listFoodRes[index])
            sumQuality += FoodInRestaurant.listFoodRes[index].numberOfOrder
            sumPrice += FoodInRestaurant.listFoodRes[index].foodPrice
            txtQualityOrder.text = "\(sumQuality)"
            priceFoodsOrder.text = "\(sumPrice)"
            listFoodInResCollectionView.reloadData()
        }
//        for order in listFoodOrder {
//            if order.foodId == FoodInRestaurant.listFoodRes[index].foodId {
//                return
//            } else {
//            }
//        }
    }
    
    func deleteFoodOrder(food: Food?, index: Int) {
        if FoodInRestaurant.listFoodRes[index].numberOfOrder <= 0 {
            FoodInRestaurant.listFoodRes[index].numberOfOrder = 0
        } else {
            FoodInRestaurant.listFoodRes[index].numberOfOrder -= 1
            sumQuality -= FoodInRestaurant.listFoodRes[index].numberOfOrder
            sumPrice -= FoodInRestaurant.listFoodRes[index].foodPrice
//            for order in 0..<listFoodOrder.count {
//                if listFoodOrder[order].foodId == FoodInRestaurant.listFoodRes[index].foodId {
//                    listFoodOrder.remove(at: order)
//                }
//            }
            txtQualityOrder.text = "\(sumQuality)"
            priceFoodsOrder.text = "\(sumPrice)"
            listFoodInResCollectionView.reloadData()
        }
    }
    
}
