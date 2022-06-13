//
//  AlbumsVCDataSource Extensions.swift
//  HW13_PhotoScreen
//
//  Created by mac on 13.06.22.
//

import UIKit

extension AlbumsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return model[0].count
        case 1:
            return model[1].count
        case 2:
            return model[2].count
        case 3:
            return model[3].count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = model[indexPath.section][indexPath.row]
        
        switch (indexPath as NSIndexPath).section {
        case 0...1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalCell.reuseID, for: indexPath) as? HorizontalCell else { return UICollectionViewCell() }
            cell.photoImageView.image = item.image
            cell.namePhotoLabel.text = item.text
            cell.numberPhotosLabel.text = item.number.formattedWithSeparator
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VerticalCell.reuseID, for: indexPath) as? VerticalCell else { return UICollectionViewCell() }
            cell.iconView.image = item.image
            cell.nameLabel.text = item.text
            cell.numberPhotosLabel.text = item.number.formattedWithSeparator
            cell.lineSeparators.isHidden = indexPath.row == 7 ? true : false
            return cell
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VerticalCell.reuseID, for: indexPath) as? VerticalCell else { return UICollectionViewCell() }
            cell.iconView.image = item.image
            cell.nameLabel.text = item.text
            cell.numberPhotosLabel.text = item.number.formattedWithSeparator
            cell.lineSeparators.isHidden = indexPath.row == 2 ? true : false
            return cell
        default:
            break
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.reuseID, for: indexPath) as? HeaderView else {
            return HeaderView() }
        headerView.frame.size.height = 68
        
        switch indexPath.section  {
        case 0:
            headerView.label.text = "Мои альбомы"
            headerView.label.textColor = UIColor.init(named: "labelColor")
            headerView.button.isHidden = false
            headerView.button.text = "Все"
        case 1:
            headerView.label.text = "Общие альбомы"
            headerView.label.textColor = UIColor.init(named: "labelColor")
            headerView.button.isHidden = false
            headerView.button.text = "Все"
        case 2:
            headerView.label.text = "Типы медиафайлов"
            headerView.label.textColor = UIColor.init(named: "labelColor")
            headerView.button.isHidden = true
        case 3:
            headerView.label.text = "Другое"
            headerView.label.textColor = UIColor.init(named: "labelColor")
            headerView.button.isHidden = true
        default:
            break
        }
        return headerView
    }
}
