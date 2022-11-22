//
//  LoginOfCustomerViewController.swift
//  Order_Restaurant
//
//  Created by Nguyen Hung on 03/10/2022.
//

import UIKit

class Main: UIViewController, UITextViewDelegate {
    
    var listLogin: [Account] = []
    
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        createAccount()
        hideKeyboardWhenTappedAround()
    }
    
    // 0: khach hang
    // 1: nha hang
    func createAccount() {
        listLogin.append(Account(accountId: 0, accountName: "abc", password: "000000", typeAccount: 0))
        listLogin.append(Account(accountId: 1, accountName: "def", password: "111111", typeAccount: 1))
        listLogin.append(Account(accountId: 2, accountName: "abc", password: "222222", typeAccount: 0))
        listLogin.append(Account(accountId: 3, accountName: "def", password: "333333", typeAccount: 1))
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
        var account: Account?
        for login in listLogin {
            if userName.text! == login.accountName && password.text! == login.password  {
                account = login
            }
        }
        
        if account == nil {
            displayMyAlertMessage(userMessage: "Vui lòng nhập lại!!!")
            

        } else {
            if account?.typeAccount == 0 {
                self.navigationController?.pushViewController(homeCustomer, animated: true)
                displayMyAlertMessage(userMessage: "Đăng nhập thành công!!!")
            } else if account?.typeAccount == 1 {
                self.navigationController?.pushViewController(homeRestaurant, animated: true)
                displayMyAlertMessage(userMessage: "Đăng nhập thành công!!!")
            }
        }
        
    }
    @IBAction func registerAccount(_ sender: Any) {
        let register = RegisterOfCustomerViewController(nibName: "RegisterOfCustomerViewController", bundle: nil)
        self.navigationController?.pushViewController(register, animated: true)
        register.listRegister = listLogin
        register.delegate = self
    }
}

extension Main: AddAccountDelegate {
    func addAcc(register: Account) {
        listLogin.append(register)
        print(listLogin.count)
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
