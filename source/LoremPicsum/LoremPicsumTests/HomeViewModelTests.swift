//
//  HomeViewModelTests.swift
//  LoremPicsumTests
//
//  Created by Ravindran on 04/01/23.
//

import XCTest

final class HomeViewModelTests: XCTestCase {
    
    var apiService: ImageService!
    var imageViewModel: ImageGalleryViewModel!
    var favouriteViewModel: FavouritesViewModel!
    var imageViewController: ImageGalleryViewController!
    var favouriteViewController: FavouritesViewController!
    var viewModel: HomeViewModel!
    var controller: HomeViewController!
    
    override func setUpWithError() throws {
        apiService = ImageService()
        imageViewModel = ImageGalleryViewModel(navigation: self, apiService: apiService)
        favouriteViewModel = FavouritesViewModel()
        
        imageViewController = ImageGalleryViewController(viewModel: imageViewModel)
        favouriteViewController = FavouritesViewController(viewModel: favouriteViewModel)
        
        var tabOne = TabData()
        tabOne.controller = imageViewController
        tabOne.normalImage = UIImage(named: "home")
        tabOne.title = "Gallery"
        
        var tabTwo = TabData()
        tabTwo.controller = favouriteViewController
        tabTwo.normalImage = UIImage(named: "favourite")
        tabTwo.title = "Favourites"
        
        viewModel = HomeViewModel(tabs: [tabOne, tabTwo])
        controller = HomeViewController(viewModel: viewModel)
    }

    override func tearDownWithError() throws {
        
    }
    
    func testViewModel() {
        XCTAssertTrue(viewModel.getTabsData().count == 2)
    }

}

extension HomeViewModelTests: HomeNavigation {
    func gotoHome() {
        
    }
    
    func gotoImageDetail(image: ImageElement) {
        
    }
}
