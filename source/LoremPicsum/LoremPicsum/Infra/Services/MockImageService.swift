//
//  MockImageService.swift
//  LoremPicsum
//
//  Created by Ravindran on 03/01/23.
//

import Foundation

class MockImageService: ImageServiceProtocol {
    func getImageDetail(id: String) async throws -> (Data, URLResponse)? {
        return nil
    }
    
    func getImageList(pageNumber: Int, limit: Int) async throws -> (Data, URLResponse)? {
        return nil
    }
}
