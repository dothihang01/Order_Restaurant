//
//  RegisterOfCustomerViewController.swift
//  Order_Restaurant
//
//  Created by Nguyen Hung on 03/10/2022.
//

import UIKit

protocol AddAccountDelegate {
    func addAcc(registerRes: Restaurant?, registerCus: Customer?)
}

class RegisterOfCustomerViewController: UIViewController {

    @IBOutlet weak var inputNameRegister: TextField!
    @IBOutlet weak var imgQRcode: UIImageView!
    @IBOutlet weak var inputPasswordRegister: TextField!
    var delegate: AddAccountDelegate?
    
    var listRegister: [Restaurant] = []
    var getAccountRes: Restaurant?
    var getCustomer: Customer?
    var isSelectedCustomer = false
    var isSelectedRestaurant = false
    var isSelected: Bool = false
    var filter: CIFilter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
//        print(listRegister)
    }
    
    @IBAction func btnRegister(_ sender: UIButton) {
        
        let name = "\(getAccountRes?.restaurantId)"
        let password = inputPasswordRegister.text ?? ""
        
        let data = name.data(using: .ascii, allowLossyConversion: false)
        filter = CIFilter(name: "CIQRCodeGenerator")
        filter.setValue(data, forKey: "inputMessage")
        let img = UIImage(ciImage: filter.outputImage!)
            imgQRcode.image = img

        if isSelectedCustomer == true {
//            getAccount?.typeAccount = 0
            getCustomer?.account?.accountName = name
            getCustomer?.account?.password = password
            getCustomer?.account = Account(accountId: 4, accountName: name, password: password, typeAccount: 0)
//            isSelected = true
            displayMyAlertMessage(userMessage:"Đăng ký thành công")

        }
        
        else if isSelectedRestaurant == true {
//            getAccount?.typeAccount = 1
            getAccountRes?.account?.accountName =  name
            getAccountRes?.account?.password =  password
            getAccountRes?.account = Account(accountId: 4, accountName: name, password: password, typeAccount: 1)
//            isSelected = false
            displayMyAlertMessage(userMessage:"Đăng ký thành công")
        }
        delegate?.addAcc(registerRes: getAccountRes, registerCus: getCustomer)
            self.navigationController?.popViewController(animated: true)
        
        }
    
    @IBAction func choose(_ sender: UIButton) {
        if isSelectedRestaurant == false {
            sender.setImage(UIImage(named: "icMultiselect"), for: .normal)
//            sender.setImage(UIImage(named: "isSelect"), for: .normal)
            isSelectedRestaurant = true
            isSelectedCustomer = false
        }
    }
    @IBAction func chooseCustomer(_ sender: UIButton) {
        if isSelectedCustomer == false {
            sender.setImage(UIImage(named: "icMultiselect"), for: .normal)
            isSelectedCustomer = true
            isSelectedRestaurant = false
        }
    }
    
    func displayMyAlertMessage(userMessage:String){
        let myAlert = UIAlertController(title: "Thông báo", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
}

extension RegisterOfCustomerViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(RegisterOfCustomerViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
