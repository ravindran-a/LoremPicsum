//
//  FavouritesManager.swift
//  LoremPicsum
//
//  Created by Ravindran on 03/01/23.
//

import Foundation

class FavouritesManager {
    
    static let shared = FavouritesManager()
    
    func getListOfFavourites() -> [ImageElement]? {
        if let confirmedObject = unArchiveFavouriteImages() {
            return confirmedObject
        }
        return nil
    }
    
    func isFavouriteImage(_ image: ImageElement) -> Bool {
        if let confirmedObject = unArchiveFavouriteImages() {
            if let _ = confirmedObject.firstIndex(where: { $0.id == image.id }) {
                return true
            }
        }
        return false
    }
    
    func updateFavouriteItem(_ image: ImageElement) {
        if var confirmedObject = unArchiveFavouriteImages() {
            if let confirmedIndex = confirmedObject.firstIndex(where: { $0.id == image.id }) {
                confirmedObject.remove(at: confirmedIndex)
                archiveFavouriteImages(confirmedObject)
            } else {
                confirmedObject.append(image)
                archiveFavouriteImages(confirmedObject)
            }
        } else {
            var images: [ImageElement] = [ImageElement]()
            images.append(image)
            archiveFavouriteImages(images)
        }
    }
    
    func updateFavouriteList(_ images: [ImageElement]) {
        archiveFavouriteImages(images)
    }
    
    private func archiveFavouriteImages(_ images: [ImageElement]) {
        let data = try? JSONEncoder().encode(images)
        UserDefaultsManager.setObject(data, forKey: .favourites)
    }
    
    private func unArchiveFavouriteImages() -> [ImageElement]? {
        if let unarchivedObject = UserDefaultsManager.objectForKey(.favourites) as? Data {
            return try? JSONDecoder().decode([ImageElement].self, from: unarchivedObject)
        }
        return nil
    }
    
}
