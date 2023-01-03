//
//  ImageViewerViewModel.swift
//  LoremPicsum
//
//  Created by Ravindran on 03/01/23.
//

import Foundation

class ImageViewerViewModel {
    private var image: ImageElement!
    
    init(_ image: ImageElement) {
        self.image = image
    }
    
    func getImageUrl() -> String? {
        return APIEndPoints.ImageData.imageUrl(id: image.id ?? "", width: 300, height: 300).url
    }
    
    func getImageId() -> String? {
        return image.id
    }
    
    func getImageAuthor() -> String? {
        return image.author
    }
    
    func isImageInfavourites() -> Bool {
        return FavouritesManager.shared.isFavouriteImage(image)
    }
    
    func updateFavourite() {
        FavouritesManager.shared.updateFavouriteItem(image)
    }
}
