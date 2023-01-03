//
//  ImageLoadingCell.swift
//  LoremPicsum
//
//  Created by Ravindran on 03/01/23.
//

import UIKit
import SnapKit

class ImageLoadingCell: UICollectionViewCell {
    
    static let cellIdentifier: String = "ImageLoadingCell"
    
    private var spinner: UIActivityIndicatorView = UIFactory.getActivityIndicator(id: "spinner")
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        spinner.stopAnimating()
    }
    
    private func setupViews() {
        contentView.addSubview(spinner)
        spinner.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func startSpinner() {
        spinner.startAnimating()
    }
    
}
