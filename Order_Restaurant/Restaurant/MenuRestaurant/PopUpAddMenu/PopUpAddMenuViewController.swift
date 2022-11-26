//
//  PopUpAddMenuViewController.swift
//  Order_Restaurant
//
//  Created by Nguyen Hung on 18/10/2022.
//

import UIKit

protocol AddFoodDelegate {
    func addNewFood(food: Food, category: Category)
}

class PopUpAddMenuViewController: UIViewController {

    @IBOutlet weak var txtCategory: UILabel!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtNameFood: UITextField!
    @IBOutlet weak var txtTime: UITextField!
    @IBOutlet weak var txtQuality: UITextField!
    @IBOutlet weak var txtDescription: UITextField!
    
    var newFood: Food?
    var newCategory: Category?
    var delegate: AddFoodDelegate?
    var category = ""
    var price = 0
    var name = ""
    var time = ""
    var quality = ""
    var descrip = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtCategory.text = category
        txtPrice.text = "\(price)"
        txtNameFood.text = name
        txtTime.text = time
        txtQuality.text = quality
        txtDescription.text = descrip
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func addFood(_ sender: Any) {

        newFood = Food(foodId: 0, foodName: txtNameFood.text ?? "", foodPrice: Int(txtPrice.text ?? "") ?? 0, foodDescription: txtDescription.text ?? "", foodImage: "", foodAmount: Int(txtQuality.text ?? "") ?? 0, foodTime: txtTime.text ?? "", foodCategory: txtCategory.text ?? "", numberOfOrder: 4)
        
        newCategory = Category(categoryId: 0, categoryName: txtCategory.text ?? "")
        
        if delegate != nil {
            delegate?.addNewFood(food: newFood!, category: newCategory!)
        }
        self.navigationController?.popViewController(animated: true)
    }
    

    @IBAction func close(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}


extension PopUpAddMenuViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(RegisterOfCustomerViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
