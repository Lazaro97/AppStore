//
//  AppRowCell.swift
//  AppStoreApp
//
//  Created by Lazaro Ambrosio on 12/15/20.
//

import UIKit
class AppHorizontalRowCell: UICollectionViewCell {
    
    let appImageView =  UIImageView(cornerRadius: 8)
    let appNameLabel = UILabel(text: "App Name", font: .systemFont(ofSize: 20))
    let appCompanyLabel = UILabel(text: "Company Name", font: .systemFont(ofSize: 13))
    let getAppButton = UIButton(title: "Get")
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .clear
        getAppButton.setTitleColor(.systemBlue, for: .normal)
        appImageView.constrainWidth(constant: 64)
        appImageView.constrainHeight(constant: 64)
        
        getAppButton.backgroundColor = .systemGray6
        getAppButton.constrainWidth(constant: 80)
        getAppButton.constrainHeight(constant: 32)
        getAppButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        getAppButton.layer.cornerRadius = 32 / 2
        
        let stackView = UIStackView(arrangedSubviews: [appImageView,VerticalStackView(arrangedSubviews: [appNameLabel,appCompanyLabel],spacing: 4), getAppButton])
        stackView.spacing = 16
        stackView.alignment = .center
        addSubview(stackView)
        stackView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
