//
//  VerticalCell.swift
//  HW13_PhotoScreen
//
//  Created by mac on 07.06.22.
//

import UIKit

class VerticalCell: UICollectionViewCell {
    // MARK: - Constants
    
    enum Metric {
        static let indent: CGFloat = 4
        static let lineHeight: CGFloat = 1
        static let lineIndent: CGFloat = 48
        static let iconSize: CGFloat = 28
    }
    
    // MARK: - Properties
    
    static let reuseID = "VerticalCell"
    
    lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .systemBlue
        return label
    }()
    
    lazy var numberPhotosLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.layer.masksToBounds = true
        let image = UIImage(systemName: "chevron.right", withConfiguration:  UIImage.SymbolConfiguration(pointSize: 16, weight: .semibold))?
            .withTintColor(.systemGray4, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        return button
    }()
    
    lazy var lineSeparators: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray4
        return line
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

extension VerticalCell {
    
    func configure() {
        contentView.addSubviewsForAutoLayout([
            iconView,
            lineSeparators,
            nameLabel,
            button,
            numberPhotosLabel,
        ])
        
        NSLayoutConstraint.activate([
            iconView.heightAnchor.constraint(equalToConstant: Metric.iconSize),
            iconView.widthAnchor.constraint(equalToConstant: Metric.iconSize),
            iconView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metric.indent),
            
            lineSeparators.topAnchor.constraint(equalTo: self.bottomAnchor),
            lineSeparators.heightAnchor.constraint(equalToConstant: Metric.lineHeight),
            lineSeparators.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metric.lineIndent),
            lineSeparators.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metric.lineIndent),
            
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: Metric.iconSize),
            button.widthAnchor.constraint(equalToConstant: Metric.iconSize),
            button.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -Metric.indent),

            numberPhotosLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            numberPhotosLabel.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -Metric.lineHeight),
        ])
    }
}
