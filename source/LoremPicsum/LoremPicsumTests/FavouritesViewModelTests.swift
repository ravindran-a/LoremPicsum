//
//  FavouritesViewModelTests.swift
//  LoremPicsumTests
//
//  Created by Ravindran on 04/01/23.
//

import XCTest

final class FavouritesViewModelTests: XCTestCase {

    var favouriteViewModel: FavouritesViewModel!
    var favouriteViewController: FavouritesViewController!
    
    override func setUpWithError() throws {
        let testData = [ImageElement(id: "0", author: "", width: 100, height: 100, url: "", downloadURL: ""),
                        ImageElement(id: "1", author: "", width: 100, height: 100, url: "", downloadURL: "")]
        FavouritesManager.shared.updateFavouriteList(testData)
        favouriteViewModel = FavouritesViewModel()
        favouriteViewController = FavouritesViewController(viewModel: favouriteViewModel)
    }

    override func tearDownWithError() throws {
    }
    
    func testFavouritesViewModel() throws {
        XCTAssertTrue(favouriteViewModel.getImagesCount() == 2)
        XCTAssertFalse(favouriteViewModel.isEmptyData())
        XCTAssertNotNil(favouriteViewModel.getImage(index: 0))
        XCTAssertNotNil(favouriteViewModel.getImageUrl(index: 0))
        favouriteViewModel.updateFavourite(index: 0)
        favouriteViewModel.setData()
        favouriteViewModel.updateData()
    }

}
