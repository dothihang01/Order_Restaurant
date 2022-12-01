//
//  AppDelegate.swift
//  Order_Restaurant
//
//  Created by Nguyen Hung on 03/10/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)
               window?.backgroundColor = .clear
               let viewController = ScannerViewController()
               
               let homeNav = UINavigationController(rootViewController: viewController)
               
               window?.rootViewController = homeNav
               window!.makeKeyAndVisible()
        //        guard let windowScene = (scene as? UIWindowScene) else { return }
        //        window = UIWindow(frame: UIScreen.main.bounds)
        //               let home = TabBarController()
        //               self.window?.rootViewController = home
        //               window?.makeKeyAndVisible()
        //               window?.windowScene = windowScene
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

