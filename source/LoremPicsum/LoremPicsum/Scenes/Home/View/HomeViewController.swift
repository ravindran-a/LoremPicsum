//
//  HomeViewController.swift
//  LoremPicsum
//
//  Created by Ravindran on 03/01/23.
//

import Foundation
import UIKit
import SnapKit

class HomeViewController: UITabBarController, UITabBarControllerDelegate {
    
    private var viewModel: HomeViewModel!
    
    convenience init(viewModel: HomeViewModel) {
        self.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.delegate = self
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupViews()
    }
    
    private func setupViews() {
        self.view.backgroundColor = .white
        var tabControllers: [UIViewController] = []
        for (index, tab) in viewModel.getTabsData().enumerated() {
            if let controller = tab.controller {
                if index == 0 {
                    self.title = tab.title
                }
                controller.tabBarItem = UITabBarItem(title: tab.title, image: tab.normalImage, tag: index)
                tabControllers.append(controller)
            }
        }
        self.viewControllers = tabControllers
    }
}

extension HomeViewController {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.title = item.title
    }
}
