//
//  NewsModel.swift
//  NewsModel
//
//  Created by Ruslan Sharshenov on 26.11.2021.
//

import Foundation

class  NewsModel {
    var title: String
    var descriptions: String
    var image: String
    
    init(title: String, desctiptions: String, image: String) {
        self.title = title
        self.image = image
        self.descriptions = desctiptions
    }
}
