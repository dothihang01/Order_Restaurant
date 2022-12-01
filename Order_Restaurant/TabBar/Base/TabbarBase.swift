////
////  TabbarBase.swift
////  SDKFILM
////
////  Created by Hartzed Story on 7/28/22.
////
//
//import UIKit
//
//class TabbarBase : UITabBarController {
//    static let shared = TabbarBase()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        config()
//        setUpBottomBar()
//    }
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//    }
//    func config() {
//        self.tabBar.isTranslucent = true
//        self.tabBar.tintColor = UIColor.darkGray
//        self.tabBar.unselectedItemTintColor = UIColor(named:"#EAEAEA")
//        self.view.backgroundColor = UIColor(named:"#F5F5F5")
//        if #available(iOS 15.0, *) {
//            let appearance = UITabBarAppearance()
//            appearance.configureWithOpaqueBackground()
//            appearance.backgroundColor = .white
//            tabBar.standardAppearance = appearance
//            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
//        }
//        self.tabBar.layer.masksToBounds = true
//        self.tabBar.layer.cornerRadius = 17
//        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//        self.delegate = self
//    }
//    
//    func setUpBottomBar() {
//        let homeScreen = HomeScreenConfigurator.viewcontroller()// HomeScreenViewController()
//        let homeScreenNavi = NavigationBase.init(rootViewController: homeScreen)
//        let homeScreenIcon = UITabBarItem(title: "Trang chủ", image: UIImage(named: "homeicon"), selectedImage: UIImage(named: "homeicon"))
//        homeScreenNavi.tabBarItem = homeScreenIcon
//        
//        let cinemaScreen = CinemaConfigurator.viewcontroller()
//        let cinemaNavi = NavigationBase.init(rootViewController: cinemaScreen)
//        let cinemaItem = UITabBarItem(title: "Rạp chiếu", image: UIImage(named: "cinemaiconunselected"), selectedImage: UIImage(named: "cinemaiconunselected"))
//        cinemaNavi.tabBarItem = cinemaItem
//        
//        let myTicketScreen = MyTicketViewController()
//        let myTicketNavi = NavigationBase.init(rootViewController: myTicketScreen)
//        let myTicketIcon = UITabBarItem(title: "Vé của tôi", image: UIImage(named: "myticketiconunselected"), selectedImage: UIImage(named: "myticketiconunselected"))
//        myTicketNavi.tabBarItem = myTicketIcon
//        
//        let promotionScreen = PromotionConfigurator.viewcontroller()
//        let promotionNavi = NavigationBase.init(rootViewController: promotionScreen)
//        let promotionIcon = UITabBarItem(title: "Khuyến mãi", image: UIImage(named: "promotioniconunselected"), selectedImage: UIImage(named: "promotioniconunselected"))
//        promotionNavi.tabBarItem = promotionIcon
//        self.viewControllers = [homeScreenNavi,cinemaNavi,myTicketNavi,promotionNavi]
//    }
//}
//extension TabbarBase : UITabBarControllerDelegate {
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//    }
//}
