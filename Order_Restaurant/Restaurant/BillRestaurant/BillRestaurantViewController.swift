//
//  BillRestaurantViewController.swift
//  Order_Restaurant
//
//  Created by Nguyen Hung on 18/10/2022.
//

import UIKit

class BillRestaurantViewController: UIViewController {

    @IBOutlet weak var viewTabBill: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var labelFavourite: UILabel!
    
    var headerRes: Restaurant?
    
    
    var listOrder: [Food] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        collectionView.register(UINib(nibName: "OrderedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "orderedCollectionViewCell")
        // Do any additional setup after loading the view.
    }
}

extension BillRestaurantViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOrder.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "orderedCollectionViewCell", for: indexPath) as! OrderedCollectionViewCell
        cell.imgOrder.image = UIImage(named: "\(listOrder[indexPath.row].foodImage)")
        cell.nameOrder.text = listOrder[indexPath.row].foodName
        cell.qualityOrder.text = "\(listOrder[indexPath.row].numberOfOrder)"
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width) - 20, height: 100)
    }
    
}
