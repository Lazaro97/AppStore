//
//  AppsDetailCVC.swift
//  AppStoreApp
//
//  Created by Lazaro Ambrosio on 12/19/20.
//
//https://itunes.apple.com/rss/customerreviews/page=1/id=1152350815/sortby=mostrecent/json?l=en&cc=us

import UIKit

class AppsDetailCVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
   
    let detailCell = "detailCell"
    let screenShotPreviewCell = "previewCellID"
    let reviewRowCellID = "reviewRowCellID"
  
    var app: Result?
    var reviews: Reviews?
    //This gives us data for the app detail and screenshots
    
    var appId: String! {
        didSet {
            let urlString = "https://itunes.apple.com/lookup?id=\(appId ?? "")"
            
            Service.shared.fetchAppDetail(urlString: urlString) { (result, error) in
                let app = result?.results.first
                self.app = app
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
            
        let reviewsURL =  "https://itunes.apple.com/rss/customerreviews/page=1/id=\(appId ?? "")/sortby=mostrecent/json?l=en&cc=us"
        //print(reviewsURL)
            Service.shared.fetchAppReview(urlString: reviewsURL) { (review, error) in
                self.reviews = review
                
                //TODO: This is line is not retreving the coding keys we have in our model.
                review?.feed.entry.forEach({print($0.rating.label)})
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                    }
                }
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .green
        configureCollectionView()
        configureCollectionFlowLayout()
        navigationItem.largeTitleDisplayMode = .never
    }
   
    func configureCollectionView(){
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: detailCell)
        
        collectionView.register(AppPreviewCell.self, forCellWithReuseIdentifier: screenShotPreviewCell)
        
        collectionView.register(AppRatingReviewRollCell.self, forCellWithReuseIdentifier: reviewRowCellID)
    }
    
    func configureCollectionFlowLayout(){
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
    }
    
    //Sections AppDetailCell, PreivewCell, ReviewRollCell
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
 
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailCell, for: indexPath) as! AppDetailCell
            cell.app = app
            return cell
        } else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: screenShotPreviewCell, for: indexPath) as! AppPreviewCell
            cell.horizontallScreenshotsController.app = self.app
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reviewRowCellID, for: indexPath) as! AppRatingReviewRollCell
            cell.reviewController.reviews = self.reviews
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        if indexPath.item == 0  {
        let madeUpCell = AppDetailCell(frame: .init(x:0, y: 0, width: view.frame.width, height: 1000))
         
            madeUpCell.app = app
            
            madeUpCell.layoutIfNeeded()
            
        let estimatedSize = madeUpCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
            
        return .init(width: view.frame.width, height: estimatedSize.height)
        } else if indexPath.item == 1 {
            return .init(width: view.frame.width, height: 500)
        } else {
            return .init(width: view.frame.width, height: 280)
        }
    }
    
    //Rating View Cell has padding from the bottom
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 16, right: 0)
    }
    
    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
