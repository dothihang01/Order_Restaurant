//
//  HomePageViewController.swift
//  Order_Restaurant
//
//  Created by Nguyen Hung on 04/10/2022.
//

import UIKit


class HomePageViewController: UIViewController, UITabBarControllerDelegate {

    @IBOutlet weak var orderMenuCollectionView: UICollectionView!
    @IBOutlet weak var roundCollectionView: UICollectionView!
    @IBOutlet weak var tabBar: UITabBar!
    var arrImageRestaurant = [UIImage(named: "Rectangle 21-1"), UIImage(named: "Rectangle 21-2"), UIImage(named: "Rectangle 21")]
    
    var listCustomer: [Customer] = []
    var listRestaurant: [Restaurant] = []
    var listRestarantVisted: [Restaurant] = []
    var listRecent: [Restaurant] = []
//    var aRestaurant: Restaurant?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderMenuCollectionView.dataSource = self
        orderMenuCollectionView.delegate = self
        roundCollectionView.dataSource = self
        roundCollectionView.delegate = self
        self.orderMenuCollectionView.register(UINib(nibName: "CustomVisitedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "customCollectionViewCell")
        self.roundCollectionView.register(UINib(nibName: "RoundCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "roundCollectionView")
        createDataRes()
    }
    
    override func viewDidLayoutSubviews() {
    }
    
    func createDataRes() {
        listRestaurant.append(Restaurant(restaurantId: 0, restaurantName: "Highland", restaurantAddress: "262, Nguyễn Trãi", restaurantDescription: "coffee - tea", restaurantImage: "combo - 1", numberOfVisit: 3, logoRes: "highland", location: 3, food: FoodInRestaurant.listFoodRes, table: [Table(numberTable: 10)], foodOrder: [], account: Account(accountId: 0, accountName: "", password: "", typeAccount: 0)))
        listRestaurant.append(Restaurant(restaurantId: 1, restaurantName: "McDonald's", restaurantAddress: "262, Vũ Trọng Phụng", restaurantDescription: "burger - chicken", restaurantImage: "combo - 2", numberOfVisit: 5, logoRes: "McDonald", location: 8, food: FoodInRestaurant.listFoodRes, table: [Table(numberTable: 12)], foodOrder: [], account: Account(accountId: 0, accountName: "", password: "", typeAccount: 0)))
        listRestaurant.append(Restaurant(restaurantId: 2, restaurantName: "KFC", restaurantAddress: "34, Nguyễn Trãi", restaurantDescription: "fast - food", restaurantImage: "kfc", numberOfVisit: 7, logoRes: "Lotteria", location: 10, food: FoodInRestaurant.listFoodRes, table: [Table(numberTable: 20)], foodOrder: [], account: Account(accountId: 0, accountName: "", password: "", typeAccount: 0)))
        listRestaurant.append(Restaurant(restaurantId: 3, restaurantName: "Lotteria", restaurantAddress: "34, Nguyễn Trãi", restaurantDescription: "fast - food", restaurantImage: "shushi", numberOfVisit: 7, logoRes: "Lotteria", location: 3, food: FoodInRestaurant.listFoodRes, table: [Table(numberTable: 14)], foodOrder: [], account: Account(accountId: 0, accountName: "", password: "", typeAccount: 0)))
        
        for restaurant in listRestaurant {
            if restaurant.numberOfVisit > 4 {
                listRestarantVisted.append(restaurant)
            }
            if restaurant.location < 10 {
                listRecent.append(restaurant)
            }
        }
    }
    
    func createDateCustomer() {
//        listCustomer.append(Customer(customerId: 0, customerName: "Đỗ Thị Hoa", customerDob: "10/02/2000", customerGender: "Nữ", foodOrder: FoodInRestaurant.listFoodOrder, account: <#T##Account?#>))
//        listCustomer.append(Customer(customerId: 0, customerName: "Đỗ Văn Nam", customerDob: "10/09/2000", customerGender: "Nam"))
    }
}

extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.roundCollectionView {
            return listRestarantVisted.count
        }
        return listRecent.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.roundCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "roundCollectionView", for: indexPath) as! RoundCollectionViewCell
            cell.imgResOutstanding.image = UIImage(named: "\(listRestarantVisted[indexPath.row].restaurantImage)")
            cell.imgLogoRes.image = UIImage(named: "\(listRestarantVisted[indexPath.row].logoRes)")
            cell.nameRes.text = listRestarantVisted[indexPath.row].restaurantName
            cell.txtDescripRes.text = listRestarantVisted[indexPath.row].restaurantDescription
            cell.delegate = self
            cell.layer.cornerRadius = 10
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCollectionViewCell", for: indexPath) as! CustomVisitedCollectionViewCell
                cell.lblNameRestaurant.text = listRecent[indexPath.row].restaurantName
                cell.imageRestaurant.image = UIImage(named: "\(listRecent[indexPath.row].restaurantImage)")
                cell.lblDesc.text = listRecent[indexPath.row].restaurantDescription
                cell.layer.cornerRadius = 10
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.roundCollectionView {
            return 10
        }
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var yourWidth = 0.0
        var yourHeight = 0.0
        if collectionView == self.orderMenuCollectionView {
            yourWidth = collectionView.bounds.width / 3.0
            yourHeight = yourWidth
        } else {
            yourWidth = collectionView.frame.width
            yourHeight = yourWidth / 2
        }
        return CGSize(width: yourWidth, height: yourHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = OrderFoodViewController(nibName: "OrderFoodViewController", bundle: nil)
//        vc.listRes = listRestaurant
//        if collectionView == self.roundCollectionView {
            vc.aRes = listRestarantVisted[indexPath.row]
//        }
//        else if collectionView == self.roundCollectionView {
//        vc.aRes = self.listRecent[indexPath.row]

//        }
        self.navigationController?.pushViewController(vc, animated: true)

    }
}

extension HomePageViewController: GoToDetailResDelegate {
    func goToDetaiRes() {
        let vc = OrderFoodViewController(nibName: "OrderFoodViewController", bundle: nil)
        vc.listRes = listRestaurant
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

