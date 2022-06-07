//
//  MyAlbumsCell.swift
//  HW13_PhotoScreen
//
//  Created by mac on 06.06.22.
//

import UIKit

class HorizontalCell: UICollectionViewCell {
    // MARK: - Constants
    
    enum Static {
        static let indent: CGFloat = 4
        static let photoRadius: CGFloat = 10
    }
    
    // MARK: - Properties
    
    static let reuseID = "HorizontalCell"
    
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = Static.photoRadius
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var namePhotoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    
    lazy var numberPhotosLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15)
        label.textColor = .gray
        return label
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configuration

extension HorizontalCell {
    
    func configure() {
        contentView.addSubviewsForAutoLayout([
            photoImageView,
            namePhotoLabel,
            numberPhotosLabel,
        ])
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: self.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            photoImageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor),
            
            namePhotoLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: Static.indent),
            
            numberPhotosLabel.topAnchor.constraint(equalTo: namePhotoLabel.bottomAnchor, constant: Static.indent),
        ])
    }
}
