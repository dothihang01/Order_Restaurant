//
//  LoginOfCustomerViewController.swift
//  Order_Restaurant
//
//  Created by Nguyen Hung on 03/10/2022.
//

import UIKit

class Main: UIViewController, UITextViewDelegate {
    
//    var listLogin: [Any] = []
//    var listLogin: [Restaurant] = []
    
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    var check: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAccount()
        hideKeyboardWhenTappedAround()
    }
    
    // 0: khach hang
    // 1: nha hang
    func createAccount() {
        FoodInRestaurant.listResGeneral.append(Restaurant(restaurantId: 0, restaurantName: "Mc Donald", restaurantAddress: "Nguyễn Trãi, Thanh Xuân", restaurantDescription: "Gà rán - CocaCola", restaurantImage: "McDonald", numberOfVisit: 0, logoRes: "McDonald", location: 5, food: FoodInRestaurant.listFoodRes, table: [Table(numberTable: 10)], foodOrder: [], account: Account(accountId: 0, accountName: "abc", password: "111111", typeAccount: 1)))
        FoodInRestaurant.listResGeneral.append(Restaurant(restaurantId: 1, restaurantName: "The house coffe", restaurantAddress: "Nguyễn Tuân, Thanh Xuân", restaurantDescription: "Gà rán - Kem", restaurantImage: "Lotteria", numberOfVisit: 3, logoRes: "Lotteria", location: 1, food: FoodInRestaurant.listFoodRes, table: [Table(numberTable: 20)], foodOrder: [], account: Account(accountId: 1, accountName: "def", password: "111111", typeAccount: 1)))
        FoodInRestaurant.listResGeneral.append(Restaurant(restaurantId: 2, restaurantName: "Hightland", restaurantAddress: "Nguyễn Tuân, Thanh Xuân", restaurantDescription: "Gà rán - Kem", restaurantImage: "Lotteria", numberOfVisit: 3, logoRes: "Chicken", location: 1, food: FoodInRestaurant.listFoodRes, table: [Table(numberTable: 20)], foodOrder: [], account: Account(accountId: 2, accountName: "abc", password: "222222", typeAccount: 1)))
        FoodInRestaurant.listResGeneral.append(Restaurant(restaurantId: 3, restaurantName: "Jolibee", restaurantAddress: "Nguyễn Tuân, Thanh Xuân", restaurantDescription: "Gà rán - Kem", restaurantImage: "Lotteria", numberOfVisit: 3, logoRes: "Lotteria", location: 1, food: FoodInRestaurant.listFoodRes, table: [Table(numberTable: 20)], foodOrder: [], account: Account(accountId: 3, accountName: "def", password: "333333", typeAccount: 1)))
        FoodInRestaurant.listCustomer.append(Customer(customerId: 0, customerName: "Đỗ Thị Hoà", customerDob: "", customerGender: "Nữ", foodOrder: FoodInRestaurant.listFoodOrder, account: Account(accountId: 0, accountName: "abc", password: "000000", typeAccount: 0)))
        FoodInRestaurant.listCustomer.append(Customer(customerId: 0, customerName: "Đỗ Thị Hoà", customerDob: "", customerGender: "Nữ", foodOrder: FoodInRestaurant.listFoodOrder, account: Account(accountId: 0, accountName: "def", password: "000000", typeAccount: 0)))
        
    }
    
    func displayMyAlertMessage(userMessage:String){
        let myAlert = UIAlertController(title: "Thông báo", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    @IBAction func loginAccount(_ sender: Any) {
        let homeCustomer = HomePageViewController(nibName: "HomePageViewController", bundle: nil)
        let homeRestaurant = RestaurantHomeViewController(nibName: "RestaurantHomeViewController", bundle: nil)
        var account: Restaurant?
        var accountCus: Customer?
        
        for login in FoodInRestaurant.listResGeneral {
            if userName.text! == login.account?.accountName && password.text! == login.account?.password  {
                account = login
            }
        }
        
        for login in FoodInRestaurant.listCustomer {
            if userName.text! == login.account?.accountName && password.text! == login.account?.password  {
                accountCus = login
            }
        }
        if account == nil && accountCus == nil {
            displayMyAlertMessage(userMessage: "Vui lòng nhập lại!!!")
        } else {
            print("abc")
            if account?.account?.typeAccount == 1 {
                self.navigationController?.pushViewController(homeRestaurant, animated: true)
                homeRestaurant.aRestaurant = account
                displayMyAlertMessage(userMessage: "Đăng nhập thành công!!!")
            } else if accountCus?.account?.typeAccount == 0 {
                self.navigationController?.pushViewController(homeCustomer, animated: true)
                displayMyAlertMessage(userMessage: "Đăng nhập thành công!!!")

            }
        }
        
    }
    @IBAction func registerAccount(_ sender: Any) {
        let register = RegisterOfCustomerViewController(nibName: "RegisterOfCustomerViewController", bundle: nil)
        self.navigationController?.pushViewController(register, animated: true)
        register.listRegister = FoodInRestaurant.listResGeneral
        register.delegate = self
    }
}

extension Main: AddAccountDelegate {
    func addAcc(registerRes: Restaurant?, registerCus: Customer?) {
 
        FoodInRestaurant.listCustomer.append(registerCus ?? Customer(customerId: 0, customerName: "", customerDob: "", customerGender: "", foodOrder: [], account: Account(accountId: 0, accountName: "", password: "", typeAccount: 0)))
        
        FoodInRestaurant.listResGeneral.append(registerRes ?? Restaurant(restaurantId: 0, restaurantName: "", restaurantAddress: "", restaurantDescription: "", restaurantImage: "", numberOfVisit: 0, logoRes: "", location: 0, food: [], table: [], foodOrder: [], account: Account(accountId: 0, accountName: "", password: "", typeAccount: 1)))
        print(FoodInRestaurant.listResGeneral.count)
    }
}

extension Main {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(Main.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
