//
//  AppGroupCell.swift
//  AppStoreApp
//
//  Created by Lazaro Ambrosio on 12/15/20.
//

import UIKit

class AppGroupCell: UICollectionViewCell {

    let titleLabelSection = UILabel(text: "App Section", font: .boldSystemFont(ofSize: 28))
    
    let appHorizontalVC = AppsHorizontalCVC()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .clear
        configureTitleLabel()
        addSubview(appHorizontalVC.view)
        appHorizontalVC.view.anchor(top: titleLabelSection.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    func configureTitleLabel() {
        addSubview(titleLabelSection)
        titleLabelSection.textColor = .black
        titleLabelSection.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 5, right: 0))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
