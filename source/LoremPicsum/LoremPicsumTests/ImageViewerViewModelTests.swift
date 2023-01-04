//
//  ImageViewerViewModelTests.swift
//  LoremPicsumTests
//
//  Created by Ravindran on 04/01/23.
//

import XCTest

final class ImageViewerViewModelTests: XCTestCase {

    var imageDetailViewModel: ImageViewerViewModel!
    var imageViewerViewController: ImageViewerViewController!
    
    override func setUpWithError() throws {
        imageDetailViewModel = ImageViewerViewModel(ImageElement(id: "0", author: "", width: 100, height: 100, url: "", downloadURL: ""))
        imageViewerViewController = ImageViewerViewController(viewModel: imageDetailViewModel)
    }

    override func tearDownWithError() throws {
    }

    func testImageViewerViewModel() throws {
        FavouritesManager.shared.updateFavouriteList([])
        XCTAssertNotNil(imageDetailViewModel.getImageUrl())
        XCTAssertNotNil(imageDetailViewModel.getImageId())
        XCTAssertNotNil(imageDetailViewModel.getImageAuthor())
        XCTAssertFalse(imageDetailViewModel.isImageInfavourites())
        imageDetailViewModel.updateFavourite()
        XCTAssertTrue(imageDetailViewModel.isImageInfavourites())
    }
}
