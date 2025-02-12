//
//  AppDelegate.swift
//  WExercise
//
//  Created by Andrés Bonilla Gómez on 08/10/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        let viewController = ViewFactory.build()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        
        return true
    }
}
