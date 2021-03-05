//
//  ScreenshotCell.swift
//  AppStoreApp
//
//  Created by Lazaro Ambrosio on 12/21/20.
//

import UIKit

class AppScreenshotCell: UICollectionViewCell {
    
    let screenShotImgView = UIImageView (cornerRadius: 12)

    override init(frame:CGRect) {
        super.init(frame: frame)
        configureScreenShotsConstraints()
    }
    
    func configureScreenShotsConstraints(){
        addSubview(screenShotImgView)
        screenShotImgView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            screenShotImgView.topAnchor.constraint(equalTo: topAnchor),
            screenShotImgView.leadingAnchor.constraint(equalTo: leadingAnchor),
            screenShotImgView.trailingAnchor.constraint(equalTo: trailingAnchor),
            screenShotImgView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
