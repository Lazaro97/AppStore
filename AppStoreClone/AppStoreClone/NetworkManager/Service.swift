//
//  Service.swift
//  AppStoreApp
//
//  Created by Lazaro Ambrosio on 12/15/20.
//

import UIKit

class Service {
    static let shared = Service() //Singleton
    
    func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?) ->()) {
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        
        //fetch data from the internet
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
    
            guard let data = data else {return}
            
            if let error = error {
                print("Failed to request to fetch apps", error)
                completion([],error)
                return
            }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results, error)
            }
            
            catch let jsonError {
                print("Failed to decode JOSN", jsonError)
                completion([],error)
            }
        }
        .resume()
    }
    
    //Helper Function for our appsGroup
    
    func fetchAppData(urlString: String, completion: @escaping (AppsSection?, Error?) -> Void ) {

        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(nil, error)
                return
            }
            do {
                let appGroupData = try JSONDecoder().decode(AppsSection.self , from: data!)
               // appGroupData.feed.results.forEach({print($0.name)})
                completion(appGroupData, nil)
            } catch {
                completion(nil,error)
                print("Failed to decode", error)
            }
        }
        .resume()
    }
    
    
    func fetchTopGrossingApps(completion: @escaping (AppsSection?, Error?)-> ()) {
       let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/50/explicit.json"
       fetchAppData(urlString: urlString, completion: completion)
    }
    
    func fetchGamesApps(completion: @escaping (AppsSection?, Error?)-> ()) {
       let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/50/explicit.json"
       fetchAppData(urlString: urlString, completion: completion)
    }
    

    func fetchHeaderSocialApps(completion: @escaping ([HeaderSocialSection], Error?) -> Void ){
        
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("Failed to request to fetch apps", error)
                completion([], error)
                return
            }
            do {
                let objects = try JSONDecoder().decode([HeaderSocialSection].self, from: data!)
                completion(objects,error)
            } catch let jsonError {
                print("Failes to decode JSON", jsonError)
                completion([], error)
            }
        } .resume()
    }
    
    //Helper func for appDetail
    func fetchAppDetail(urlString: String, completion: @escaping (SearchResult?, Error?) -> Void ) {

        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(nil, error)
                return
            }
            do {
                let detail = try JSONDecoder().decode(SearchResult.self , from: data!)
                completion(detail, nil)
            } catch {
                completion(nil ,error)
                print("Failed to decode", error)
            }
        }
        .resume()
    }
    
    //Helper Function for Review Data
    func fetchAppReview(urlString: String, completion: @escaping (AppReviews?, Error?) -> Void ) {

        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(nil, error)
                return
            }
            do {
                let reviews = try JSONDecoder().decode(AppReviews.self , from: data!)
                completion(reviews, nil)
            } catch {
                completion(nil ,error)
                print("Failed to decode", error)
            }
        }
        .resume()
    }
}
