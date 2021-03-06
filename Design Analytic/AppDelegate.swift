//
//  AppDelegate.swift
//  Design Analytic
//
//  Created by Mousa on 30.03.21.
//

import UIKit
import Smartlook
import Firebase
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UINavigationBar.appearance().tintColor = UIColor(named: "Accent")
        IQKeyboardManager.shared.enable = true
        FirebaseApp.configure()
        let smartlookConfig = Smartlook.SetupConfiguration(key: "5eb7e6276ef2abe10cbcdb887ed3bc15462092a8")
          Smartlook.setupAndStartRecording(configuration: smartlookConfig)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let vc = UINavigationController(rootViewController: WelcomeViewController(nibName: "WelcomeViewController", bundle: nil))
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        return true
    }
    // MARK: UISceneSession Lifecycle

    @available(iOS 13, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

