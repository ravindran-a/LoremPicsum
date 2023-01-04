//
//  ImageGalleryViewModel.swift
//  LoremPicsum
//
//  Created by Ravindran on 03/01/23.
//

import Foundation
import UIKit

class ImageGalleryViewModel {
    private var navigation: HomeNavigation!
    private var apiService: ImageServiceProtocol!
    private let pageLimit: Int = 30
    private var currentPage: Int = 1
    private var images: [ImageElement] = []
    
    init(navigation: HomeNavigation!, apiService: ImageServiceProtocol!) {
        self.navigation = navigation
        self.apiService = apiService
    }
    
    func getImageData(refresh: Bool = false, loadNextPage: Bool = false) async throws {
        if refresh {
            images.removeAll()
            currentPage = 0
        }
        if loadNextPage {
            currentPage += 1
        }
        if let (data, _) = try await apiService.getImageList(pageNumber: currentPage, limit: pageLimit) {
            let model = try JSONDecoder().decode([ImageElement].self, from: data)
            if images.isEmpty {
                images = model
            } else {
                images.append(contentsOf: model)
            }
        }
    }
    
    func shouldLoadNextPage(_ indexPath: IndexPath) -> Bool {
        return indexPath.item == images.count - 1
    }
    
    func getImagesCount() -> Int {
        return self.images.count
    }
    
    func getImage(index: Int) -> ImageElement? {
        return self.images.count > index ? self.images[index] : nil
    }
    
    func getImageUrl(index: Int) -> String? {
        return self.images.count > index ? APIEndPoints.ImageData.imageUrl(id: getImage(index: index)?.id ?? "", width: 100, height: 100).url : nil
    }
    
    func gotoImageDetailView(index: Int) {
        if let image = getImage(index: index) {
            navigation.gotoImageDetail(image: image)
        }
    }
}
