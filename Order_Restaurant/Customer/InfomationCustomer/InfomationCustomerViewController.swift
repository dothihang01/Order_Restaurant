//
//  InfomationCustomerViewController.swift
//  Order_Restaurant
//
//  Created by Hường Minh on 05/10/2022.
//

import UIKit

class InfomationCustomerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func goToEdit(_ sender: Any) {
        let vc = EditInfomationCustomerViewController(nibName: "EditInfomationCustomerViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
