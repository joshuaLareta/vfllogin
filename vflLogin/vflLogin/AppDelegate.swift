//
//  AppDelegate.swift
//  vflLogin
//
//  Created by Joshua on 12/6/20.
//  Copyright © 2020 Joshua. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
 var window: UIWindow?
    let loginViewController = LoginViewController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = loginViewController
        window?.makeKeyAndVisible()

        return true
    }

}

