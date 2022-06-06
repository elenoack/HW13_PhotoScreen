//
//  AppDelegate.swift
//  HW13_PhotoScreen
//
//  Created by mac on 06.06.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // MARK: - mediaNavigationController
        
        let mediaViewController = MediaViewController()
        let mediaNavigationController = UINavigationController(rootViewController: mediaViewController)
        mediaNavigationController.tabBarItem = UITabBarItem(title: "Медиатека", image: UIImage(systemName: "photo.fill.on.rectangle.fill"), tag: 0)
        
        // MARK: - selectionNavigationController
        
        let selectionViewController = SelectionViewController()
        let selectionNavigationController = UINavigationController(rootViewController: selectionViewController)
        selectionNavigationController.tabBarItem = UITabBarItem(title: "Для Вас", image: UIImage(systemName: "heart.text.square.fill"), tag: 1)
        
        // MARK: - albumsNavigationController

        let albumsViewController = AlbumsViewController()
        let albumsNavigationController = UINavigationController(rootViewController: albumsViewController)
        albumsNavigationController.tabBarItem = UITabBarItem(title: "Альбомы", image: UIImage(systemName: "rectangle.stack.fill"), tag: 2)
        
        // MARK: - searchNavigationController
        
        let searchViewController = SearchViewController()
        let searchNavigationController = UINavigationController(rootViewController: searchViewController)
        searchNavigationController.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 3)
        
        // MARK: - tabBarController
        
        let tabBarController = UITabBarController()
        
        tabBarController.setViewControllers([
            mediaNavigationController,
            selectionNavigationController,
            albumsNavigationController,
            searchNavigationController,
            ], animated: true)
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }
}


