//
//  ReviewRollCell.swift
//  AppStoreApp
//
//  Created by Lazaro Ambrosio on 12/21/20.
//

import UIKit

class AppRatingReviewRollCell: UICollectionViewCell {
    
    let reviewController =  ReviewRowCVC()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        
        addSubview(reviewController.view)
        reviewController.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            reviewController.view.topAnchor.constraint(equalTo: topAnchor),
            reviewController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            reviewController.view.trailingAnchor.constraint(equalTo: trailingAnchor),
            reviewController.view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
