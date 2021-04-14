//
//  SceneDelegate.swift
//  Design Analytic
//
//  Created by Mousa on 30.03.21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let vc = WelcomeViewController(nibName: "WelcomeViewController", bundle: nil)//setupInitView()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
    }

    private func setupInitView() -> UIViewController {
        let pageStep = UserDefaults.standard.string(forKey: "PageStep")
        switch pageStep {
        case PageStep.UserInformation.rawValue :
            let vc = InformationViewController(nibName: "InformationViewController", bundle: nil)
            return UINavigationController(rootViewController: vc)
        case PageStep.SelectColor.rawValue :
            let vc = SelectColorsViewController(nibName: "SelectColorsViewController", bundle: nil)
            return UINavigationController(rootViewController: vc)
        case PageStep.AddItem.rawValue :
            let vc = AddItemViewController(isEditable: false, pageTitle: "Add an item", pageDescription: "try to add a new row to this animal list please")
            return UINavigationController(rootViewController: vc)
        default:
            return WelcomeViewController(nibName: "WelcomeViewController", bundle: nil)
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

