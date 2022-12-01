//
//  TabBarController.swift
//  Order_Restaurant
//
//  Created by Nguyen Hung on 07/10/2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
           UITabBar.appearance().barTintColor = .systemBackground
           tabBar.tintColor = .label
           setupVCs()
    }

    func setupVCs() {
        viewControllers = [
            createNavController(for: HomePageViewController(), image: UIImage(systemName: "house")!),
            createNavController(for: FavouriteViewController(), image: UIImage(systemName: "heart")!),
            createNavController(for: YourMenuViewController(), image: UIImage(systemName: "menucard")!),
            createNavController(for: InfomationCustomerViewController(), image: UIImage(systemName: "person")!)
        ]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController, image: UIImage) -> UIViewController {
            let navController = UINavigationController(rootViewController: rootViewController)
            navController.tabBarItem.image = image
            navController.navigationBar.prefersLargeTitles = false
            rootViewController.navigationItem.title = nil
            return navController
    }

}

extension TabBarController : UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    }
}

    
