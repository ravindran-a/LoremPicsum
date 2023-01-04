//
//  ImageGalleryViewController+Collection.swift
//  LoremPicsum
//
//  Created by Ravindran on 04/01/23.
//

import Foundation
import UIKit
import SnapKit

extension ImageGalleryViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getImagesCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == viewModel.getImagesCount() - 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageLoadingCell.cellIdentifier, for: indexPath) as? ImageLoadingCell else {
                return UICollectionViewCell()
            }
            cell.startSpinner()
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionCell.cellIdentifier, for: indexPath) as? ImageCollectionCell, viewModel.getImagesCount() > indexPath.row, let imageUrl = viewModel.getImageUrl(index: indexPath.row) else {
                return UICollectionViewCell()
            }
            cell.setImageUrl(imageUrl)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if viewModel.shouldLoadNextPage(indexPath) {
            fetchData(loadNextPage: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.gotoImageDetailView(index: indexPath.item)
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
