//
//  NewsBody.swift
//  SelfNewsApiMaking
//
//  Created by Kyungyun Lee on 14/03/2022.
//

import Foundation

struct NewsBody : Identifiable, Codable {
    
    let id = UUID()
    let status : String
    let totalResults : Int
    let articles : [News]
}

struct News : Identifiable, Codable {
    let id = UUID()
    let source : Source
    let title : String
    let description : String
    let url : String
    let urlToImage : String?
    let content : String
}
    

struct Source : Identifiable, Codable {
    let id = UUID()
    let name : String
}
