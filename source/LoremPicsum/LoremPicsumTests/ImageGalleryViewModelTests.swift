//
//  ImageGalleryViewModelTests.swift
//  LoremPicsumTests
//
//  Created by Ravindran on 04/01/23.
//

import XCTest

final class ImageGalleryViewModelTests: XCTestCase {

    var apiService: MockImageService!
    var imageViewModel: ImageGalleryViewModel!
    var imageViewController: ImageGalleryViewController!
    
    override func setUpWithError() throws {
        apiService = MockImageService()
        imageViewModel = ImageGalleryViewModel(navigation: self, apiService: apiService)
        imageViewController = ImageGalleryViewController(viewModel: imageViewModel)
    }

    override func tearDownWithError() throws {
        
    }
    
    func testViewModel() throws {
        Task {
            try? await imageViewModel.getImageData()
            XCTAssertTrue(imageViewModel.getImagesCount() > 0)
        }
        Task {
            try? await imageViewModel.getImageData(refresh: true)
            XCTAssertTrue(imageViewModel.getImagesCount() > 0)
        }
        Task {
            try? await imageViewModel.getImageData(loadNextPage: true)
            XCTAssertTrue(imageViewModel.getImagesCount() > 0)
            XCTAssertNotNil(imageViewModel.getImage(index: 0))
            XCTAssertNotNil(imageViewModel.getImageUrl(index: 0))
            XCTAssertTrue(imageViewModel.shouldLoadNextPage(IndexPath(item: imageViewModel.getImagesCount() - 1, section: 0)))
            XCTAssertFalse(imageViewModel.shouldLoadNextPage(IndexPath(item: 0, section: 0)))
            imageViewModel.gotoImageDetailView(index: 0)
        }
    }
}

extension ImageGalleryViewModelTests: HomeNavigation {
    func gotoHome() {
        
    }
    
    func gotoImageDetail(image: ImageElement) {
        
    }
}
