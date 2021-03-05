//
//  ReviewRowCVC.swift
//  AppStoreApp
//
//  Created by Lazaro Ambrosio on 12/21/20.
//

import UIKit

class ReviewRowCVC: HorizontalSnappingCollectionViewController,UICollectionViewDelegateFlowLayout {

    var reviews: AppReviews? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(ReviewCell.self, forCellWithReuseIdentifier: cellID)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviews?.feed.entry.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 48, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 16, bottom: 0, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reviewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ReviewCell
        let entry = self.reviews?.feed.entry[indexPath.item]
        reviewCell.titleLabel.text = entry?.title.label
        reviewCell.authorLabel.text = entry?.author.name.label
        reviewCell.bodyLabel.text = entry?.content.label
        return reviewCell
    }
}
