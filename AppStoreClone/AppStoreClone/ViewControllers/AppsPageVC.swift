//
//  AppSearchCVC.swift
//  AppStoreApp
//
//  Created by Lazaro Ambrosio on 12/15/20.
//

import UIKit

class AppsPageVC: UICollectionViewController,UICollectionViewDelegateFlowLayout{
    
    fileprivate let appsCellID = "AppsCell"
    fileprivate let headerCellID = "HeaderCell"
   
    let activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        aiv.color = .systemGreen
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        return aiv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(activityIndicatorView)
        registerAppPageHeader()
        registerAppGroupCell()
        activityIndicatorView.fillSuperview()
        fetchData()
    }
    
    var groups = [AppsSection]()
    var socialApps = [HeaderSocialSection]()
    
    private func fetchData(){
        var appGroupSection: AppsSection?
        var topGrowsingAppsGroupSection: AppsSection?
        var topFreeAppsGroupSection: AppsSection?
        
        //Helps your sync data fetchs together
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Service.shared.fetchGamesApps { (appGroup, error) in
            dispatchGroup.leave()
            if let error = error {
                print("failed to fetch games", error)
                return
            }
            appGroupSection = appGroup
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        dispatchGroup.enter()
        Service.shared.fetchTopGrossingApps { (appGroup, error ) in
            dispatchGroup.leave()
             topGrowsingAppsGroupSection = appGroup
              DispatchQueue.main.async {
                  self.collectionView.reloadData()
              }
        }
        
        dispatchGroup.enter()
        Service.shared.fetchAppData(urlString: "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/50/explicit.json") { (appGroup, error) in
            dispatchGroup.leave()
            topFreeAppsGroupSection = appGroup
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        dispatchGroup.enter()
        DispatchQueue.main.async {
            Service.shared.fetchHeaderSocialApps { (apps, error) in
                dispatchGroup.leave()
                self.socialApps = apps
            }
        }
        
        //completion
        dispatchGroup.notify(queue: .main) {
            print("completed your dispatch group tasks")
            self.activityIndicatorView.stopAnimating()
            if let group = appGroupSection {
                self.groups.append(group)
            }
            if let group = topGrowsingAppsGroupSection {
                self.groups.append(group)
            }
            if let group = topFreeAppsGroupSection {
                self.groups.append(group)
            }
            self.collectionView.reloadData()
        }
    }
    
    
    private func registerAppGroupCell(){
        collectionView.backgroundColor = .white
        collectionView.register(AppGroupCell.self, forCellWithReuseIdentifier: appsCellID)
    }
    
    private func registerAppPageHeader() {
        collectionView.register(AppPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerCellID)
    }
    
    
    //Register Header cell
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerCellID, for: indexPath) as! AppPageHeader
        header.appHeaderHorizontalController.socialApps = self.socialApps
        header.appHeaderHorizontalController.collectionView.reloadData()
        return header
    }
    
    
    //Header Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: appsCellID, for: indexPath) as! AppGroupCell
      
        let appGroup = groups[indexPath.item]
        cell.titleLabelSection.text = appGroup.feed.title
        cell.appHorizontalVC.appGroup = appGroup
        cell.appHorizontalVC.collectionView.reloadData()
        
        //Navigation from our clousure in horizantalcvc.
        cell.appHorizontalVC.didSelectHandler = { [weak self] feedResult in
            let redViewController = AppsDetailCVC()
            redViewController.appId = feedResult.id
            redViewController.navigationItem.title = feedResult.name
            self?.navigationController?.pushViewController(redViewController, animated: true)
        }
        return cell
    }
    
    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


