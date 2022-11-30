//
//  YourMenuViewController.swift
//  Order_Restaurant
//
//  Created by Nguyen Hung on 08/10/2022.
//

import UIKit

class YourMenuViewController: UIViewController {

    @IBOutlet weak var sumPriceFoodOrder: UILabel!
    @IBOutlet weak var menuChoosedCollectionView: UICollectionView!
    @IBOutlet weak var viewQuality: UIView!
    @IBOutlet weak var viewSumPrice: UIView!
    @IBOutlet weak var buttonOrder: UIButton!
    
    @IBOutlet weak var addMenu: UIButton!
    var listYourOrder: [Food] = []
    var aRestaurant: Restaurant?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    
    func setUpView() {
        menuChoosedCollectionView.delegate = self
        menuChoosedCollectionView.dataSource = self
        viewQuality.layer.cornerRadius = 6
        viewSumPrice.layer.cornerRadius = 10
        buttonOrder.layer.cornerRadius = 10
        addMenu.backgroundColor = .clear
        addMenu.layer.cornerRadius = 5
        addMenu.layer.borderWidth = 1
        addMenu.layer.borderColor = CGColor(red: 255/255, green: 114/255, blue: 76/255, alpha: 1)
        self.menuChoosedCollectionView.register(UINib(nibName: "CustomMenuCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "customMenuCollectionViewCell")
    }
    @IBAction func addFood(_ sender: Any) {
        let vc = OrderFoodViewController(nibName: "OrderFoodViewController", bundle: nil)
        vc.listFoodOrder = listYourOrder
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func actionOrderFoood(_ sender: Any) {
        let vc = BillRestaurantViewController(nibName: "BillRestaurantViewController", bundle: nil)
//        vc.viewTabBill.isHidden = true
        vc.headerRes = aRestaurant
        vc.listOrder = listYourOrder
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension YourMenuViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listYourOrder.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customMenuCollectionViewCell", for: indexPath) as! CustomMenuCollectionViewCell
        cell.imgFoodOrder.image = UIImage(named: "\(listYourOrder[indexPath.row].foodImage)")
        cell.nameFoodOrder.text = listYourOrder[indexPath.row].foodName
        cell.priceFoodOrder.text = "\(listYourOrder[indexPath.row].foodPrice)"
        cell.txtQualityFoodOrder.text = "\(listYourOrder[indexPath.row].numberOfOrder)"
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.frame.width
        let yourHeight = yourWidth / 2
        return CGSize(width: yourWidth, height: yourHeight)
    }
}
