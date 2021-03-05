//
//  BastTabController.swift
//  AppStoreApp
//
//  Created by Lazaro Ambrosio on 12/14/20.
//

import UIKit

class BaseTabController: UITabBarController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        ourViewControllers()
        
    }
    
    //If you mark something fileprivate it can be read anywhere in the same file it was declared – even outside the type. On the other hand, a private property can only be read inside the type that declared it, or inside extensions to that type that were created in the same file.
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
       
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        navController.navigationBar.tintColor = .systemBlue
        navController.navigationBar.backgroundColor = .systemBackground
       // navController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.systemGray5]

        return navController
    }
    
    func ourViewControllers(){
        viewControllers = [
            createNavController(viewController: AppPageCVC(), title: "Apps", imageName: "apps"),
            createNavController(viewController: AppSearchCVC(), title: "Search", imageName: "search"),
            createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon")
        ]
    }
    
}
