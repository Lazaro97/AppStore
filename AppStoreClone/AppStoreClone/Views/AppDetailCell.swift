//
//  AppDetailCell.swift
//  AppStoreApp
//
//  Created by Lazaro Ambrosio on 12/19/20.
//

import UIKit

class AppDetailCell: UICollectionViewCell {
    
    let appIconImageView = UIImageView(cornerRadius: 16)
    let nameLabel = UILabel(text: "App name", font: .boldSystemFont(ofSize: 24), numberOfLines: 2)
    let priceButton = UIButton(title: "$3.33")
    let whatsNewLabel = UILabel(text: "Whats new", font: .boldSystemFont(ofSize: 20))
    let releaseNotesLabel = UILabel(text: "Release Notes", font: .systemFont(ofSize: 16),numberOfLines: 0)
    
    var app: Result! {
        didSet {
            nameLabel.text = app?.trackName
            releaseNotesLabel.text = app?.releaseNotes
            appIconImageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
            priceButton.setTitle(app?.formattedPrice, for: .normal)
        }
    }

    override init(frame: CGRect){
        super.init(frame: frame)
        setupConstraints()
        configureAppImage()
        configurePriceButton()
        //backgroundColor = .cyan
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
    
        addSubview(appIconImageView)
        appIconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(priceButton)
        priceButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(whatsNewLabel)
        whatsNewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(releaseNotesLabel)
        releaseNotesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            //Set up AppIconImg
            appIconImageView.topAnchor.constraint(equalTo:contentView.topAnchor, constant: 15),
            appIconImageView.leadingAnchor.constraint(equalTo:contentView.leadingAnchor, constant: 16),
            appIconImageView.heightAnchor.constraint(equalToConstant: 140),
            appIconImageView.widthAnchor.constraint(equalToConstant: 140),
            
            //Setup: Name Label
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            nameLabel.leadingAnchor.constraint(equalTo: appIconImageView.trailingAnchor, constant: 15),
            nameLabel.trailingAnchor.constraint(equalTo:contentView.trailingAnchor, constant: -16),
            
            //Setup: priceButton
            priceButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            priceButton.leadingAnchor.constraint(equalTo: appIconImageView.trailingAnchor, constant: 15),
            priceButton.widthAnchor.constraint(equalToConstant: 80),
            priceButton.heightAnchor.constraint(equalToConstant: 30),
      
            //Setup: WhatsNewLable
            whatsNewLabel.topAnchor.constraint(equalTo: appIconImageView.bottomAnchor, constant: 15),
            whatsNewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            whatsNewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            whatsNewLabel.heightAnchor.constraint(equalToConstant: 16),
            
            //Setup: releaseNotesLabel
            releaseNotesLabel.topAnchor.constraint(equalTo: whatsNewLabel.bottomAnchor, constant: 15),
            releaseNotesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            releaseNotesLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -15),
            releaseNotesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
    
    func configureAppImage(){
        appIconImageView.backgroundColor = .orange
    }
    
    func configurePriceButton(){
        priceButton.backgroundColor = .blue
        priceButton.layer.cornerRadius = 32/2
        priceButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        priceButton.setTitleColor(.white, for: .normal)
    }
}
