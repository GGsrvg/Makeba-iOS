//
//  TabBarController.swift
//  makeba
//
//  Created by GGsrvg on 02.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    let serverListViewController: ServerListViewController = {
        let vc = ServerListViewController()
        vc.tabBarItem = UITabBarItem(title: R.string.localization.servers(), image: UIImage(systemName: "camera"), selectedImage: nil)
        return vc
    }()
    let aboutAppViewController: AboutAppViewController = {
        let vc = AboutAppViewController()
        vc.tabBarItem = UITabBarItem(title: "About App", image: nil, selectedImage: nil)
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [
            UINavigationController(rootViewController: serverListViewController),
            UINavigationController(rootViewController: aboutAppViewController),
        ]
    }
}
