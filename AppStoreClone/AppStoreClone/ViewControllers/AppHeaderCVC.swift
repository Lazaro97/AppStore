//
//  AppHorizontalController.swift
//  AppStoreApp
//
//  Created by Lazaro Ambrosio on 12/16/20.
//

import UIKit

//API : https://api.letsbuildthatapp.com/appstore/social

class AppHeaderCVC: HorizontalSnappingCollectionViewController,UICollectionViewDelegateFlowLayout {

    let appHeaderCell = "AppHeaderCell"
    var socialApps = [HeaderSocialSection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        congfigureCollectionView()
        configureCollectionViewLayout()
    }
    
    private func congfigureCollectionView(){
        collectionView.backgroundColor = .white
        collectionView.register(AppHeaderCell.self, forCellWithReuseIdentifier: appHeaderCell)
    }
    
    private func configureCollectionViewLayout(){
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 48, height: view.frame.height)
    }
    
    
    //Padding of the collection view
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socialApps.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let headerCell = collectionView.dequeueReusableCell(withReuseIdentifier: appHeaderCell, for: indexPath) as! AppHeaderCell
        let app = self.socialApps[indexPath.item]
        headerCell.companyLabel.text = app.name
        headerCell.titleLabel.text = app.tagline
        headerCell.imageView.sd_setImage(with: URL(string: app.imageUrl))
        return headerCell
    }
}
