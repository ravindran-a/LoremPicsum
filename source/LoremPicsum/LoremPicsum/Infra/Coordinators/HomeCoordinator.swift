//
//  HomeCoordinator.swift
//  LoremPicsum
//
//  Created by Ravindran on 03/01/23.
//

import Foundation
import UIKit

protocol HomeNavigation: AnyObject {
    func gotoHome()
    func gotoImageDetail(image: ImageElement)
}

class HomeCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        gotoHome()
    }
}

extension HomeCoordinator: HomeNavigation {
    func gotoHome() {
        let apiService: ImageService = ImageService()
        let imageViewModel: ImageGalleryViewModel = ImageGalleryViewModel(navigation: self, apiService: apiService)
        let favouriteViewModel: FavouritesViewModel = FavouritesViewModel()
        
        let imageViewController: ImageGalleryViewController = ImageGalleryViewController(viewModel: imageViewModel)
        let favouriteViewController: FavouritesViewController = FavouritesViewController(viewModel: favouriteViewModel)
        
        var tabOne = TabData()
        tabOne.controller = imageViewController
        tabOne.normalImage = UIImage(named: "home")
        tabOne.title = "Gallery"
        
        var tabTwo = TabData()
        tabTwo.controller = favouriteViewController
        tabTwo.normalImage = UIImage(named: "favourite")
        tabTwo.title = "Favourites"
        
        let viewModel: HomeViewModel = HomeViewModel(tabs: [tabOne, tabTwo])
        let controller: HomeViewController = HomeViewController(viewModel: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }
    
    func gotoImageDetail(image: ImageElement) {
        let imageDetailViewModel: ImageViewerViewModel = ImageViewerViewModel(image)
        let imageViewerViewController: ImageViewerViewController = ImageViewerViewController(viewModel: imageDetailViewModel)
        navigationController.pushViewController(imageViewerViewController, animated: true)
    }
}
