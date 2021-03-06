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
        backgroundColor = .clear
        titleLabel.textColor = .black
        companyLabel.textColor = .systemBlue
        imageView.backgroundColor =  .clear
        titleLabel.numberOfLines = 2
        configureConstraints()
    }
    
    func configureConstraints(){
        contentView.addSubview(companyLabel)
        companyLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //SetupCompanyLabel
            companyLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            companyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            companyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            
            //Setup Title label
            titleLabel.topAnchor.constraint(equalTo: companyLabel.bottomAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            
            //SetImageView
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
