//
//  AppDelegate.swift
//  Test
//
//  Created by Игорь Ущин on 15.07.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navController = UINavigationController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let firstVC = ViewController()
        navController = UINavigationController(rootViewController: firstVC)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController =  navController
        window?.makeKeyAndVisible()
        return true
    }

  

}

