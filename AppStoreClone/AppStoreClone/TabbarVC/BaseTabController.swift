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
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        let navigateController = UINavigationController(rootViewController: viewController)
       
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        navigateController.navigationBar.prefersLargeTitles = false
        navigateController.tabBarItem.title = title
        navigateController.tabBarItem.image = UIImage(named: imageName)
        navigateController.navigationBar.backgroundColor = .systemGray6
    
        return navigateController
    }
    
    func ourViewControllers(){
        viewControllers = [
            createNavController(viewController: AppsPageVC(), title: "Apps", imageName: "apps"),
            createNavController(viewController: AppSearchCVC(), title: "Search", imageName: "search"),
            createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon")
        ]
    }    
}
