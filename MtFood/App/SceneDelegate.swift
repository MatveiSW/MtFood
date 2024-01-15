//
//  SceneDelegate.swift
//  MtFood
//
//  Created by Матвей Авдеев on 15.01.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let homeViewController = FoodListViewController()
        let contactsViewController = OneMockViewController()
        let profileViewController = TwoMockViewController()
        let cartViewController = ThreeMockViewController()
        
        let tabBarController = UITabBarController()
        
        homeViewController.tabBarItem = UITabBarItem(
            title: "Меню", image: UIImage(named: "menu"), tag: 0
        )
        
        contactsViewController.tabBarItem = UITabBarItem(
            title: "Контакты", image: UIImage(named: "contacts"), tag: 1
        )
        
        profileViewController.tabBarItem = UITabBarItem(
            title: "Профиль", image: UIImage(named: "profile"), tag: 2
        )
        
        cartViewController.tabBarItem = UITabBarItem(
            title: "Корзина", image: UIImage(named: "basket"), tag: 3
        )
        
        tabBarController.viewControllers = [
            UINavigationController(rootViewController: homeViewController),
            UINavigationController(rootViewController: contactsViewController),
            UINavigationController(rootViewController: profileViewController),
            UINavigationController(rootViewController: cartViewController)
        ]
        
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: tabBarController.tabBar.frame.size.width, height: 0.7))
        
        lineView.backgroundColor = UIColor.lightGray
        
        tabBarController.tabBar.addSubview(lineView)
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.tintColor = UIColor(named: "priceButtonColor")
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }
    
    
}

