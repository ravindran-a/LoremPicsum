//
//  FavouritesViewModel.swift
//  LoremPicsum
//
//  Created by Ravindran on 03/01/23.
//

import Foundation

class FavouritesViewModel {
    
    private var images: [ImageElement] = []
    
    init() {
        updateData()
    }
    
    func isEmptyData() -> Bool {
        return images.isEmpty
    }
    
    func getImagesCount() -> Int {
        return images.count
    }
    
    func getImage(index: Int) -> ImageElement? {
        return self.images.count > index ? self.images[index] : nil
    }
    
    func getImageUrl(index: Int) -> String? {
        return self.images.count > index ? APIEndPoints.ImageData.imageUrl(id: getImage(index: index)?.id ?? "", width: 100, height: 100).url : nil
    }
    
    func updateData() {
        images = FavouritesManager.shared.getListOfFavourites() ?? []
    }
    
    func setData() {
        FavouritesManager.shared.updateFavouriteList(images)
    }
    
    func updateFavourite(index: Int) {
        if let image = getImage(index: index), let confirmedIndex = images.firstIndex(where: { $0.id == image.id }) {
            images.remove(at: confirmedIndex)
        }
    }
}
