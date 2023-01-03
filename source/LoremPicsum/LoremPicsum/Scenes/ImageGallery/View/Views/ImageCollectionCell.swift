//
//  ImageCollectionCell.swift
//  LoremPicsum
//
//  Created by Ravindran on 03/01/23.
//

import UIKit
import SnapKit

class ImageCollectionCell: UICollectionViewCell {
    
    static let cellIdentifier: String = "ImageCollectionCell"
    private var imageView: UIImageView = UIFactory.getImageView(id: "imageView")
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.layer.cornerRadius = 6.0
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.masksToBounds = true
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    private func setupViews() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    func setImageUrl(_ url: String?) {
        self.imageView.imageWithURL(url)
    }
}
