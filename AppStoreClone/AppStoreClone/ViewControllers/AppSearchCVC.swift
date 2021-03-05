//
//  AppSearchVC.swift
//  AppStoreApp
//
//  Created by Lazaro Ambrosio on 12/14/20.
//

import UIKit
import SDWebImage

class AppSearchCVC: UICollectionViewController,
                    UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    fileprivate let appSearchCell    = "AppSearchCell"
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    var appResults = [Result]()
    var timer: Timer?
    
    fileprivate let enterSearchTermLabel: UILabel = {
        let label = UILabel()
        label.text = "Please enter search term above"
        label.textAlignment = .center
        label.textColor = .systemBackground
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerAppSearchCollectionView()
        setupSearchAppStateLabel()
        setUpSearchBar()
    }
    
    private func setupSearchAppStateLabel(){
        view.addSubview(enterSearchTermLabel)
        enterSearchTermLabel.fillSuperview()
    }
    
    private func setUpSearchBar(){
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        //It fixe the space issue for example uber eats works.
        let searchText = searchText.replacingOccurrences(of: " ", with: "+")
        
        //Introduce some delay before preforming the search
        //Throttling the search
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            Service.shared.fetchApps(searchTerm: searchText) { (results, error) in
                if let error = error {
                    print("Failed to fetch apps:", error)
                    return
                }
                self.appResults = results
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
    }
    
    private func registerAppSearchCollectionView(){
        collectionView.backgroundColor = .white
        collectionView.register(AppSearchCell.self, forCellWithReuseIdentifier: appSearchCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let appDetailController = AppsDetailCVC()
        let appId = appResults[indexPath.item].trackId
        appDetailController.appId = String(appId)
            navigationController?.pushViewController(appDetailController, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        enterSearchTermLabel.isHidden = appResults.count != 0
        return appResults.count
    }
    
    //Padding for collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let searchCell = collectionView.dequeueReusableCell(withReuseIdentifier: appSearchCell, for: indexPath) as! AppSearchCell
        let appResult = appResults[indexPath.item]
        searchCell.appResult = appResult
        return searchCell
    }
    
    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
