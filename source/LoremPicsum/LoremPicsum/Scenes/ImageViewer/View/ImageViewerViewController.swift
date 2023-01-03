//
//  ImageViewerViewController.swift
//  LoremPicsum
//
//  Created by Ravindran on 03/01/23.
//

import Foundation
import UIKit
import SnapKit

class ImageViewerViewController: UIViewController {
    
    private var viewModel: ImageViewerViewModel!
    private var imageView: UIImageView!
    private var author: UILabel!
    private var favourite: UIButton!
    
    convenience init(viewModel: ImageViewerViewModel) {
        self.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        self.title = "Viewer"
        self.view.backgroundColor = .white
        imageView = UIFactory.getImageView(id: "imageView")
        view.addSubview(imageView)
        imageView.layer.cornerRadius = 6.0
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.masksToBounds = true
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50.0)
            make.width.height.equalTo(300)
            make.centerX.equalToSuperview()
        }
        imageView.imageWithURL(viewModel.getImageUrl())
        favourite = UIFactory.getButton(id: "favourite")
        favourite.setImage(UIImage(named: "starEmpty"), for: .normal)
        favourite.setImage(UIImage(named: "starFilled"), for: .selected)
        view.addSubview(favourite)
        favourite.backgroundColor = .clear
        favourite.snp.makeConstraints { make in
            make.trailing.equalTo(imageView.snp.trailing).offset(-16)
            make.bottom.equalTo(imageView.snp.bottom).offset(-16)
            make.width.height.equalTo(24)
        }
        favourite.isSelected = viewModel.isImageInfavourites()
        favourite.addTarget(self, action: #selector(updateFavourite), for: .touchUpInside)
        author = UIFactory.getLabel(id: "author")
        view.addSubview(author)
        author.snp.makeConstraints { make in
            make.trailing.equalTo(imageView.snp.trailing)
            make.top.equalTo(imageView.snp.bottom).offset(16)
        }
        author.text = "Creation by " + (viewModel.getImageAuthor() ?? "")
        author.textColor = UIColor.black
        author.font = UIFont.italicSystemFont(ofSize: 14.0)
    }
    
    @objc func updateFavourite() {
        viewModel.updateFavourite()
        favourite.isSelected = viewModel.isImageInfavourites()
    }
    
}
