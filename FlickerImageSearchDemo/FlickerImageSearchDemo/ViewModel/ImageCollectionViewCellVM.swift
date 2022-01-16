//
//  ImageCollectionViewCellVM.swift
//  FlickerImageSearchDemo
//
//  Created by Manoj Shivhare on 16/01/22.
//

import Foundation
import UIKit
class ImageCollectionViewCellVM{
    var photoId: String
    var owner: String
    var secret: String
    var server: String
    var farm: Int

    init(model: PhotoModel) {
        self.photoId = model.id ?? ""
        self.owner = model.owner ?? ""
        self.secret = model.secret ?? ""
        self.server = model.server ?? ""
        self.farm = model.farm ?? 0
    }
    
//    func callAPIAndGetImageFromUrl(completionBlock: @escaping (UIImage) -> ()) -> UIImage{
//        var image = UIImage()
//        ApiManager.shared.getImageFromImageURL(farm: self.farm, server: self.server, phototId: self.photoId, secret: self.secret) { resImage in
//            image = resImage
//        }
//        
//        return image
//    }
}
