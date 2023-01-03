//
//  FavouriteImageCollectionCell.swift
//  LoremPicsum
//
//  Created by Ravindran on 04/01/23.
//

import UIKit
import SnapKit

class FavouriteImageCollectionCell: UICollectionViewCell {            
    static let cellIdentifier: String = "FavouriteImageCollectionCell"
    private var imageView: UIImageView = UIFactory.getImageView(id: "imageView")
    private var favourite: UIButton = UIFactory.getButton(id: "favourite")
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.layer.cornerRadius = 6.0
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.white.cgColor
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
        favourite.setImage(UIImage(named: "starEmpty"), for: .normal)
        favourite.setImage(UIImage(named: "starFilled"), for: .selected)
        contentView.addSubview(favourite)
        favourite.backgroundColor = .clear
        favourite.snp.makeConstraints { make in
            make.trailing.equalTo(imageView.snp.trailing).offset(-8)
            make.bottom.equalTo(imageView.snp.bottom).offset(-8)
            make.width.height.equalTo(16)
        }
    }
    
    func setImageUrl(_ url: String?) {
        self.imageView.imageWithURL(url)
        favourite.isSelected = true
    }
}
