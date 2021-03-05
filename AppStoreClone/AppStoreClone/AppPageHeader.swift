//
//  AppPageHeader.swift
//  AppStoreApp
//
//  Created by Lazaro Ambrosio on 12/16/20.
//

import UIKit

class AppPageHeader: UICollectionReusableView {
   
    let appHeaderHorizontalController = AppHeaderCVC()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        addSubview(appHeaderHorizontalController.view)
        appHeaderHorizontalController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
