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
    var arrImageRestaurant = [UIImage(named: "Rectangle 21-1"), UIImage(named: "Rectangle 21-2"), UIImage(named: "Rectangle 21")]
    override func viewDidLoad() {
        super.viewDidLoad()
        orderMenuCollectionView.dataSource = self
        orderMenuCollectionView.delegate = self
        roundCollectionView.dataSource = self
        roundCollectionView.delegate = self
        self.orderMenuCollectionView.register(UINib(nibName: "CustomVisitedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "customCollectionViewCell")
        self.roundCollectionView.register(UINib(nibName: "RoundCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "roundCollectionView")
    }
}

extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.roundCollectionView {
            return 10
        }
        return arrImageRestaurant.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.roundCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "roundCollectionView", for: indexPath) as! RoundCollectionViewCell
            cell.layer.cornerRadius = 10
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCollectionViewCell", for: indexPath) as! CustomVisitedCollectionViewCell
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
}

