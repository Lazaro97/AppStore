//
//  PreviewCell.swift
//  AppStoreApp
//
//  Created by Lazaro Ambrosio on 12/20/20.
//

import UIKit

class AppPreviewCell: UICollectionViewCell {
    
    let previewLabel = UILabel(text: "Preview", font: .boldSystemFont(ofSize: 20))

    let horizontallScreenshotsController = AppPreviewCVC()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        configureConstraints()
    }
    
    func configureConstraints(){
        addSubview(previewLabel)
        previewLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontallScreenshotsController.view)
        horizontallScreenshotsController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            // Constraints Preview Labbel
            previewLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            previewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            previewLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            // Constraints HorizonalScreenshotsControler
            horizontallScreenshotsController.view.topAnchor.constraint(equalTo: previewLabel.bottomAnchor,constant: 20),
            horizontallScreenshotsController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            horizontallScreenshotsController.view.trailingAnchor.constraint(equalTo: trailingAnchor),
            horizontallScreenshotsController.view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
