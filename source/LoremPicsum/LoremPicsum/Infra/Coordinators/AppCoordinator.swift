//
//  AppCoordinator.swift
//  LoremPicsum
//
//  Created by Ravindran on 03/01/23.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        launchApplication()
    }
    
    func launchApplication() {
        let homeCoordinator: HomeCoordinator = HomeCoordinator(navigationController)
        homeCoordinator.parentCoordinator = self
        children.append(homeCoordinator)
        
        homeCoordinator.start()
    }

}
