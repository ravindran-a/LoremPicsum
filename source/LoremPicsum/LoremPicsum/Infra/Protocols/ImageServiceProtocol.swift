//
//  ImageServiceProtocol.swift
//  LoremPicsum
//
//  Created by Ravindran on 03/01/23.
//

import Foundation

protocol ImageServiceProtocol {
    func getImageList(pageNumber: Int, limit: Int) async throws -> (Data, URLResponse)?
    func getImageDetail(id: String) async throws -> (Data, URLResponse)?
}
