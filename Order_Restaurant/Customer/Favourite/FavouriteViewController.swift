//
//  FavouriteViewController.swift
//  Order_Restaurant
//
//  Created by Nguyen Hung on 18/10/2022.
//

import UIKit

class FavouriteViewController: UIViewController {
    

    @IBOutlet weak var favouriteCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        favouriteCollectionView.dataSource = self
        favouriteCollectionView.delegate = self
        self.favouriteCollectionView.register(UINib(nibName: "CustomFavouriteCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "customFavouriteCollectionViewCell")
    }


}

extension FavouriteViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FoodInRestaurant.listFavouriteRes.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customFavouriteCollectionViewCell", for: indexPath) as! CustomFavouriteCollectionViewCell
        cell.imgRes.image = UIImage(named: "\(FoodInRestaurant.listFavouriteRes[indexPath.row].restaurantImage)")
        cell.nameRes.text = FoodInRestaurant.listFavouriteRes[indexPath.row].restaurantName
        cell.addressRes.text = FoodInRestaurant.listFavouriteRes[indexPath.row].restaurantAddress
        cell.layer.cornerRadius = 6
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: favouriteCollectionView.bounds.width, height: 80)
    }
    
    
    
}
