//
//  FavouritesViewController.swift
//  LoremPicsum
//
//  Created by Ravindran on 03/01/23.
//

import Foundation
import UIKit
import SnapKit

class FavouritesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var viewModel: FavouritesViewModel!
    var imageGrid: UICollectionView!
    var noFavouritesLabel: UILabel!
    
    convenience init(viewModel: FavouritesViewModel) {
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.updateData()
        imageGrid.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.setData()
    }
    
    private func setupViews() {
        imageGrid = UIFactory.getCollectionView(id: "imageGrid", dataSource: self, delegate: self)
        imageGrid.backgroundColor = .white
        view.addSubview(imageGrid)
        imageGrid.register(FavouriteImageCollectionCell.self, forCellWithReuseIdentifier: FavouriteImageCollectionCell.cellIdentifier)
        imageGrid.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
        }
        imageGrid.reloadData()
        noFavouritesLabel = UIFactory.getLabel(id: "noFavouritesLabel")
        view.addSubview(noFavouritesLabel)
        noFavouritesLabel.text = "No favourites found!"
        noFavouritesLabel.font = UIFont.italicSystemFont(ofSize: 16)
        noFavouritesLabel.textColor = .black
        noFavouritesLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        noFavouritesLabel.isHidden = true
    }
}
