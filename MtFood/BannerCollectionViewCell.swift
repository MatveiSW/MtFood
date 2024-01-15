//
//  BannerCollectionViewCell.swift
//  MtFood
//
//  Created by Матвей Авдеев on 15.01.2024.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    lazy var bannerImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        contentView.addSubview(bannerImage)

        NSLayoutConstraint.activate(
            [
                bannerImage.topAnchor.constraint(equalTo: contentView.topAnchor),
                bannerImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                bannerImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                bannerImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            ]
        )
    }
}
