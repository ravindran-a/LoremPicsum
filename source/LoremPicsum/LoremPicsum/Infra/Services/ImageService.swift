//
//  ImageService.swift
//  LoremPicsum
//
//  Created by Ravindran on 03/01/23.
//

import Foundation

class ImageService: ImageServiceProtocol {
    func getImageList(pageNumber: Int, limit: Int) async throws -> (Data, URLResponse)? {
        let url = APIEndPoints.ImageData.imageList(pageNumber: pageNumber, limit: limit).url
        return try await ApiManager.shared.request(serviceURL: url)
    }
    
    func getImageDetail(id: String) async throws -> (Data, URLResponse)? {
        let url = APIEndPoints.ImageData.imageDetail(id: id).url
        return try await ApiManager.shared.request(serviceURL: url)
    }
}
