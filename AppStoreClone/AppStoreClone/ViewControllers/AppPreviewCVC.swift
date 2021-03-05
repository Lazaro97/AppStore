//
//  PreviewHorizontalController.swift
//  AppStoreApp
//
//  Created by Lazaro Ambrosio on 12/20/20.
//

import UIKit

class AppPreviewCVC: HorizontalSnappingCollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let screenshotCell = "screenshotCell"
    
    var app: Result? {
        didSet {
            collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    func configureCollectionView(){
        collectionView.register(AppScreenshotCell.self, forCellWithReuseIdentifier: screenshotCell)
        collectionView.contentInset = .init(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return app?.screenshotUrls.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: screenshotCell, for: indexPath) as! AppScreenshotCell
        let screenshotURL = self.app?.screenshotUrls[indexPath.item]
        cell.screenShotImgView.sd_setImage(with: URL(string: screenshotURL ?? ""))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 250, height: view.frame.height)
    }
}
