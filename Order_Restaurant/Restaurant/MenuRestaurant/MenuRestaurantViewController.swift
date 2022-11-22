//
//  MenuRestaurantViewController.swift
//  Order_Restaurant
//
//  Created by Nguyen Hung on 18/10/2022.
//

import UIKit

class MenuRestaurantViewController: UIViewController {

    @IBOutlet weak var listFoodCollectionView: UICollectionView!
    var listShowFood: [Food] = []
    var listShowCategory: [Category] = []
    var addAFood: Food?
    var index: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listFoodCollectionView.delegate = self
        self.listFoodCollectionView.dataSource = self
        self.listFoodCollectionView.register(UINib(nibName: "MenuCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "menuCollectionViewCell")
        listFoodCollectionView.register(UINib(nibName: "HeaderCategoryViewController", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerCategoryViewController")
        createData()
    }
    
    func createData() {
        listShowCategory.append(Category(categoryId: 0, categoryName: "Gà"))
        listShowCategory.append(Category(categoryId: 1, categoryName: "Mì"))
        listShowCategory.append(Category(categoryId: 2, categoryName: "Nước"))
        
        listShowFood.append(Food(foodId: 0, foodName: "Gà", foodPrice: "24.000", foodDescription: "Ròn, đậm sốt", foodImage: "Chicken", foodAmount: "30", foodTime: "10", foodCategory: "Gà", numberOfOrder: 1))
        listShowFood.append(Food(foodId: 0, foodName: "Gà", foodPrice: "24.000", foodDescription: "Ròn, đậm sốt", foodImage: "Chicken", foodAmount: "30", foodTime: "10", foodCategory: "Gà", numberOfOrder: 9))
        listShowFood.append(Food(foodId: 0, foodName: "Pizza - Hải sản", foodPrice: "64.000", foodDescription: "Topping: Cua, ghẹ, tôm,...", foodImage: "Pizza", foodAmount: "10", foodTime: "20", foodCategory: "Pizza", numberOfOrder: 7))
        listShowFood.append(Food(foodId: 0, foodName: "Burger - King", foodPrice: "35.000", foodDescription: "Burger kẹp thịt bò, rau củ, đẫm sốt", foodImage: "Burger", foodAmount: "20", foodTime: "10", foodCategory: "Burger", numberOfOrder: 8))
        FoodInRestaurant.listFoodRes = listShowFood
    }

    @IBAction func addFood(_ sender: Any) {
        let vc = PopUpAddMenuViewController(nibName: "PopUpAddMenuViewController", bundle: nil)
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

extension MenuRestaurantViewController: AddFoodDelegate {
    func addNewFood(food: Food, category: Category) {
        self.listShowFood.append(food)
        addAFood = food
        for cat in listShowCategory {
            if cat.categoryName != category.categoryName {
                listShowCategory.append(category)
            }
        }
        FoodInRestaurant.listFoodRes = listShowFood
        self.listFoodCollectionView.reloadData()
    }
}

extension MenuRestaurantViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listShowFood.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCollectionViewCell", for: indexPath) as! MenuCollectionViewCell
        cell.nameFood.text = listShowFood[indexPath.row].foodName
        cell.descripFood.text = listShowFood[indexPath.row].foodDescription
        cell.priceFood.text = listShowFood[indexPath.row].foodPrice
        cell.imgFoodRes.image = UIImage(named: "\(listShowFood[indexPath.row].foodImage)")
        index = indexPath.row
        cell.indexPath = index
        cell.qualityFood.text = "Số lượng \(listShowFood[indexPath.row].foodAmount)"
        cell.timeFood.text = "\(listShowFood[indexPath.row].foodTime) phút"
        cell.delegateUpdate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: listFoodCollectionView.frame.width, height: 100)
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let headerView :HeaderCategoryViewController = listFoodCollectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerCategoryViewController", for: indexPath) as! HeaderCategoryViewController
//            headerView.listCategory = listShowCategory
//            return headerView
//    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 30, height: 40)
    }
}

extension MenuRestaurantViewController: ActionEditFoodResDelegate {
    func deleteFoodRes(food: Food, index: Int) {
        listShowFood.remove(at: index)
        FoodInRestaurant.listFoodRes = listShowFood
        self.listFoodCollectionView.reloadData()
    }
    
    func editFoodRestaurant(food: Food) {
        let vc = PopUpAddMenuViewController(nibName: "PopUpAddMenuViewController", bundle: nil)
        vc.category = food.foodCategory
        vc.price = food.foodPrice
        vc.name = food.foodName
        vc.time = food.foodTime
        vc.quality = food.foodAmount
        vc.descrip = food.foodDescription
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

