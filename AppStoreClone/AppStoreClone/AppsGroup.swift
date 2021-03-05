//
//  AppGamesGroup.swift
//  AppStoreApp
//
//  Created by Lazaro Ambrosio on 12/16/20.
//

import Foundation

struct AppsGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let id: String
    let name: String
    let artistName: String
    let artworkUrl100: String
}
