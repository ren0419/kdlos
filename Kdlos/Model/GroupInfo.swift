//
//  GroupInfo.swift
//  Kdlos
//
//  Created by katahira ren on 2025/02/28.
//

import Foundation

struct GroupData: Codable, Identifiable {
    let id: String
    let gender: String
    let name: String
    let headline: String
    let description: String
    let imageName: String
    let link: String
    let galleries: [String]
    let members: [String]
}

struct Member: Codable, Identifiable {
    let id: String
    let imageName: String
    let name: String
    let jpName: String
    let krName: String
    let birthday: String
    let mbti: String
    let country: String
    let position: String
    let description: String
    let instagramLink: String
}
