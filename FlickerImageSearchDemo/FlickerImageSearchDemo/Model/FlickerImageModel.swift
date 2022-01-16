//
//  FlickerImageModel.swift
//  FlickerImageSearchDemo
//
//  Created by Manoj Shivhare on 16/01/22.
//

import Foundation
struct PictureModel:Decodable {
    var photos : Pictures?
    var stat : String?
}

struct Pictures :Decodable {
    var photo : [PhotoModel]
}

struct PhotoModel : Decodable {
    var id: String
    var owner: String
    var secret: String
    var server: String
    var farm: Int
    var title: String
    var ispublic: Int
    var isfriend: Int
    var isfamily: Int
}
