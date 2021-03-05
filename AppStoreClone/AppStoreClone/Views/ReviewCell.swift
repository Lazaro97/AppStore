//
//  ReviewCell.swift
//  AppStoreApp
//
//  Created by Lazaro Ambrosio on 12/21/20.
//

import UIKit

class ReviewCell: UICollectionViewCell {
    
    let titleLabel = UILabel(text: "Review title Review title", font: .boldSystemFont(ofSize: 16))
    let authorLabel = UILabel(text: "Lazaro Ambrosio", font: .systemFont(ofSize: 14))
   // let starsLabel = UILabel(text: "Stars", font: .systemFont(ofSize: 14))
    let bodyLabel = UILabel(text: "Review bodyReview bodyReview bodyReview bodyReview bodyReview bodyReview bodyReview bodyReview bodyReview bodyReview body" , font: .systemFont(ofSize: 14), numberOfLines: 5)

     let starsImage = UIImageView(image: #imageLiteral(resourceName: "star"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemPink
        layer.cornerRadius = 16
        clipsToBounds = true
        configureConstraints()
    }
    
    func configureConstraints(){
        addSubview(titleLabel)
        titleLabel.setContentHuggingPriority(.init(0), for: .horizontal)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(authorLabel)
        authorLabel.textAlignment = .right
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(starsImage)
        starsImage.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(bodyLabel)
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            titleLabel.widthAnchor.constraint(equalToConstant: 200),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            authorLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            authorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
           
        
            starsImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            starsImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
//            starsImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            starsImage.heightAnchor.constraint(equalToConstant: 20),
            starsImage.widthAnchor.constraint(equalToConstant: 20),
            
            
            bodyLabel.topAnchor.constraint(equalTo: starsImage.bottomAnchor, constant: 12),
            bodyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            bodyLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
