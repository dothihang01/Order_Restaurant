//
//  BaseViewController.swift
//  SDKFILM
//
//  Created by Hartzed Story on 7/28/22.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "#F8F8F8")
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
    }
}
