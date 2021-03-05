//
//  AppSearchCell.swift
//  AppStoreApp
//
//  Created by Lazaro Ambrosio on 12/14/20.
//

import UIKit
import SDWebImage

class AppSearchCell: UICollectionViewCell {
   
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .yellow
        configureStackViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var appResult: Result! {
        didSet {
            nameLabel.text = appResult.trackName
            sectionLabel.text = appResult.primaryGenreName
            ratingLabel.text = "Rating: \(appResult.averageUserRating ?? 0)"
            
            let url = URL(string: appResult.artworkUrl100)
            appIconImageView.sd_setImage(with: url)
            
            screnshotImageView.sd_setImage(with: URL(string:appResult.screenshotUrls[0]))
            
            if appResult.screenshotUrls.count > 1 {
                screnshot1ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[1]))
            }
            
            if appResult.screenshotUrls.count > 2 {
                screnshot2ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[2]))
            }
        }
    }
    
    
    func configureStackViews(){
       
        let infoTopStackView = UIStackView(arrangedSubviews: [
            appIconImageView,
            VerticalStackView(arrangedSubviews: [
                nameLabel, sectionLabel, ratingLabel
                ]),
            getDoneButton
            ])
        infoTopStackView.spacing = 12
        infoTopStackView.alignment = .center
        
        let screenshotsStackView = UIStackView(arrangedSubviews: [screnshotImageView, screnshot1ImageView, screnshot2ImageView])
        screenshotsStackView.spacing = 12
        screenshotsStackView.distribution = .fillEqually
        
        let overallStackView = VerticalStackView(arrangedSubviews: [
            infoTopStackView, screenshotsStackView], spacing: 16)
        
        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 12
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBackground
        label.text = "App Name"
        return label
    }()
    
    let sectionLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos and Videos"
        label.textColor = .systemBackground
        return label
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "0.24"
        label.textColor = .systemBackground
        return label
    }()
    
    let getDoneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.layer.cornerRadius = 10
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        return button
    }()
    
    lazy var screnshotImageView = self.createScreenShotImageview()
    lazy var screnshot1ImageView = self.createScreenShotImageview()
    lazy var screnshot2ImageView = self.createScreenShotImageview()
    
    func createScreenShotImageview() ->UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }
}
