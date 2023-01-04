//
//  FavouritesViewController+Collection.swift
//  LoremPicsum
//
//  Created by Ravindran on 04/01/23.
//

import Foundation
import UIKit
import SnapKit

extension FavouritesViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if viewModel.isEmptyData() {
            noFavouritesLabel.isHidden = false
        } else {
            noFavouritesLabel.isHidden = true
        }
        return viewModel.getImagesCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavouriteImageCollectionCell.cellIdentifier, for: indexPath) as? FavouriteImageCollectionCell, viewModel.getImagesCount() > indexPath.row, let imageUrl = viewModel.getImageUrl(index: indexPath.row) else {
            return UICollectionViewCell()
        }
        cell.setImageUrl(imageUrl)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.updateFavourite(index: indexPath.item)
        imageGrid.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
}
