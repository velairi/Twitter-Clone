//
//  AppDelegate.swift
//  Valerie_Don_Universe_Take_Home_Project
//
//  Created by Valerie Don on 7/23/20.
//  Copyright © 2020 Valerie Don. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let vc = ViewController()
        let mainVC = UINavigationController(rootViewController: vc)
        let frame = UIScreen.main.bounds
        window?.frame = frame
        window?.rootViewController = mainVC
        window?.makeKeyAndVisible()

        return true
    }
}

