//
//  HeaderCategoryViewController.swift
//  Order_Restaurant
//
//  Created by Nguyen Hung on 05/11/2022.
//

import UIKit

class HeaderCategoryViewController: UICollectionReusableView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var listCategory: [Category] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        self.categoryCollectionView.dataSource = self
        self.categoryCollectionView.delegate = self
        
        self.categoryCollectionView.register(UINib(nibName: "HeaderMenuCell", bundle: nil), forCellWithReuseIdentifier: "headerMenuCell")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "headerMenuCell", for: indexPath) as! HeaderMenuCell
        cell.nameCategory.text = listCategory[indexPath.row].categoryName
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = listCategory[indexPath.row]
        let cateName = item.categoryName
        let itemWidth = cateName.width(withConstrainedHeight: CGFloat.greatestFiniteMagnitude, font: UIFont.systemFont(ofSize: 17)) + 10
        return CGSize(width: itemWidth, height: 40)
    }
}

extension String {
    var localize: String {
        self
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
    
        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }
}

