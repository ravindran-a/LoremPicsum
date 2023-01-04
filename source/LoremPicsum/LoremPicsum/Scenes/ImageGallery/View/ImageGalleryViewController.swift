//
//  ImageGalleryViewController.swift
//  LoremPicsum
//
//  Created by Ravindran on 03/01/23.
//

import Foundation
import UIKit
import SnapKit

class ImageGalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var viewModel: ImageGalleryViewModel!
    private var imageGrid: UICollectionView!
    private var spinner: UIActivityIndicatorView!
    
    convenience init(viewModel: ImageGalleryViewModel) {
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
        fetchData()
    }
    
    private func setupViews() {
        imageGrid = UIFactory.getCollectionView(id: "imageGrid", dataSource: self, delegate: self)
        imageGrid.backgroundColor = .white
        view.addSubview(imageGrid)
        imageGrid.showsVerticalScrollIndicator = false
        imageGrid.register(ImageCollectionCell.self, forCellWithReuseIdentifier: ImageCollectionCell.cellIdentifier)
        imageGrid.register(ImageLoadingCell.self, forCellWithReuseIdentifier: ImageLoadingCell.cellIdentifier)
        imageGrid.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
        }
        
        spinner = UIFactory.getActivityIndicator(id: "spinner")
        view.addSubview(spinner)
        spinner.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    func fetchData(isRefresh: Bool = false, loadNextPage: Bool = false) {
        if !loadNextPage {
            spinner.startAnimating()
        }
        Task {
            do {
                try await viewModel.getImageData(refresh: isRefresh, loadNextPage: loadNextPage)
                self.imageGrid.reloadData()
                spinner.stopAnimating()
            } catch let error {
                self.showAlert(title: "Error Fetching Images!", message: error.localizedDescription )
                spinner.stopAnimating()
            }
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
