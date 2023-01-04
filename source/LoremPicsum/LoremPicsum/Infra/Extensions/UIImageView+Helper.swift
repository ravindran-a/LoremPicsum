//
//  UIImageView+Helper.swift
//  LoremPicsum
//
//  Created by Ravindran on 03/01/23.
//

import Foundation
import UIKit

extension UIImageView {
    
    func imageWithURL(_ urlString: String?, placeholderImage: UIImage? = UIImage(named: "placeholder"),
                      contentMode: ContentMode = .scaleAspectFit) {
        
        self.image = placeholderImage
        
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        addSubview(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.center = self.center
        
        guard let confirmedURLString = urlString,
              let confirmedURL = URL(string: confirmedURLString) else {
            self.image = placeholderImage
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
            return
        }
        
        self.contentMode = contentMode
        
        DispatchQueue.global().async {
            URLSession.shared.dataTask(with: confirmedURL) { data, response, error in
                guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                      let data = data, error == nil,
                      let image = UIImage(data: data) else {
                    DispatchQueue.main.async { [weak self] in
                        self?.image = placeholderImage
                        activityIndicator.stopAnimating()
                        activityIndicator.removeFromSuperview()
                    }
                    return
                }
                DispatchQueue.main.async { [weak self] in
                    self?.image = image
                    activityIndicator.stopAnimating()
                    activityIndicator.removeFromSuperview()
                }
            }.resume()
        }
        
    }
    
}
