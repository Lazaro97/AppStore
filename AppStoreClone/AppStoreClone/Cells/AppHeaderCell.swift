//
//  AppHeaderCell.swift
//  AppStoreApp
//
//  Created by Lazaro Ambrosio on 12/16/20.
//

import UIKit

class AppHeaderCell: UICollectionViewCell {
    
    let companyLabel = UILabel(text: "Facebook", font: .boldSystemFont(ofSize: 12))
    let titleLabel = UILabel(text: "Keeping up with friends", font: .systemFont(ofSize: 24))
    let imageView = UIImageView(cornerRadius: 8)
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .black
        
        imageView.backgroundColor =  .brown
        titleLabel.numberOfLines = 2
        configureConstraints()
    }
    
    func configureConstraints(){
        addSubview(companyLabel)
        companyLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //SetupCompanyLabel
            companyLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            companyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            companyLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            
            //Setup Title label
            titleLabel.topAnchor.constraint(equalTo: companyLabel.bottomAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            
            //SetImageView
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
