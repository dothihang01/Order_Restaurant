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
        return 4

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customFavouriteCollectionViewCell", for: indexPath) as! CustomFavouriteCollectionViewCell
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
