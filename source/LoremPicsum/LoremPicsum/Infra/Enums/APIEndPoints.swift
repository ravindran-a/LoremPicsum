//
//  APIEndPoints.swift
//  LoremPicsum
//
//  Created by Ravindran on 03/01/23.
//

import Foundation

struct APIEndPoints {
    
    static let API_BASE_URL: String = "https://picsum.photos/"
    
    enum ImageData {
        case imageList(pageNumber: Int, limit: Int)
        case imageDetail(id: String)
        case imageUrl(id: String, width: Int, height: Int)
        
        var url: String {
            switch self {
            case .imageList(let pageNumber, let limit):
                return "v2/list?page=\(pageNumber)&limit=\(limit)"
            case .imageDetail(let id):
                return "id/\(id)/info"
            case .imageUrl(let id, let width, let height):
                return API_BASE_URL + "id/\(id)/\(width)/\(height)"
            }
        }
    }
    
}
