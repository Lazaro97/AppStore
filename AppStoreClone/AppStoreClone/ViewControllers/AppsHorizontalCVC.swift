//
//  AppsHorizontalCVC.swift
//  AppStoreApp
//
//  Created by Lazaro Ambrosio on 12/15/20.
//

import UIKit
import SDWebImage


class AppsHorizontalCVC: HorizontalSnappingCollectionViewController,UICollectionViewDelegateFlowLayout {

    let appsHorizontallCell = "AppHorizontallCell"
    var appGroup: AppsGroup?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureCollectionFlowLayout()
    }
    
    
    private func configureCollectionView(){
        collectionView.backgroundColor = .brown
        collectionView.register(AppHorizontalRowCell.self, forCellWithReuseIdentifier: appsHorizontallCell)
    }
    
    private func configureCollectionFlowLayout(){
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    //Clousure
    var didSelectHandler: ((FeedResult) -> ())?
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let app = appGroup?.feed.results[indexPath.item] {
            didSelectHandler?(app)
        }
    }
    
    
    let topBottomPadding: CGFloat = 12
    let lineSpacing: CGFloat = 10
    
    // MARK: Colllection View Cell Seperated into three cells.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - 2  * topBottomPadding - 2 * lineSpacing) / 3
        return CGSize(width: view.frame.width - 48 , height: height)
    }
    
    
    //Padding
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: topBottomPadding, left: 16, bottom: topBottomPadding, right: 16)
    }
    
    //Line spacing between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appGroup?.feed.results.count ?? 0
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: appsHorizontallCell, for: indexPath) as! AppHorizontalRowCell
        let app = appGroup?.feed.results[indexPath.item]
        
        cell.appNameLabel.text = app?.name
        cell.appCompanyLabel.text = app?.artistName
        cell.appImageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
        return cell

    }
}
