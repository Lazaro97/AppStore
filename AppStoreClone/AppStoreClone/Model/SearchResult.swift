//
//  SearchResult.swift
//  AppStoreApp
//
//  Created by Lazaro Ambrosio on 12/14/20.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount : Int
    let results: [Result]
}
  
struct Result: Decodable {
    let trackId: Int
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl100: String
    var formattedPrice: String?
    let description: String
    var releaseNotes: String?
}
