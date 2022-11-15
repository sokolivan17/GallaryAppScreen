//
//  AppDelegate.swift
//  GallaryAppScreen
//
//  Created by Ваня Сокол on 15.11.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let tabBarController = UITabBarController()

        let libraryViewController = UIViewController()
        libraryViewController.view.backgroundColor = .systemGray2
        libraryViewController.tabBarItem = UITabBarItem(title: TabNames.libraryName, image: UIImage(systemName: "photo.fill.on.rectangle.fill"), tag: 0)

        let foryouViewController = UIViewController()
        foryouViewController.view.backgroundColor = .systemOrange
        foryouViewController.tabBarItem = UITabBarItem(title: TabNames.forYouName, image: UIImage(systemName: "heart.text.square.fill"), tag: 1)

        let albumsViewController = ViewController()
        let albumsNavigationController = UINavigationController(rootViewController: albumsViewController)
        albumsNavigationController.tabBarItem = UITabBarItem(title: TabNames.albumsName, image: UIImage(systemName: "rectangle.stack.fill"), tag: 2)

        let searchViewController = UIViewController()
        searchViewController.view.backgroundColor = .systemTeal
        searchViewController.tabBarItem = UITabBarItem(title: TabNames.searchName, image: UIImage(systemName: "magnifyingglass"), tag: 3)


        tabBarController.setViewControllers([
            libraryViewController,
            foryouViewController,
            albumsNavigationController,
            searchViewController
        ], animated: true)
        tabBarController.selectedIndex = 2

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = tabBarController
        return true
    }

}

enum TabNames {
    static let libraryName = "Медиатека"
    static let forYouName = "Для вас"
    static let albumsName = "Альбомы"
    static let searchName = "Поиск"
}



