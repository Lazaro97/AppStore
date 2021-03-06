//
//  TodayCell.swift
//  AppStoreClone
//
//  Created by Lazaro Ambrosio on 3/5/21.
//

import UIKit

class TodayCell: UICollectionViewCell {
  
    let imageView = UIImageView(image: #imageLiteral(resourceName: "star"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 16
        
        contentView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.centerInSuperview(size: .init(width: 200, height: 200))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
