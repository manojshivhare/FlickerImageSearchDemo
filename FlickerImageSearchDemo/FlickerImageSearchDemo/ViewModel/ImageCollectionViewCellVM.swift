//
//  ImageCollectionViewCellVM.swift
//  FlickerImageSearchDemo
//
//  Created by Manoj Shivhare on 16/01/22.
//

import Foundation
import UIKit

class ImageCollectionViewCellVM{
    
    //MARK: ----------variable----------
    var id: String
    var secret: String
    var server: String
    var farm: Int
    //MARK: ----------delegate object----------
    var delegate: ImageCollectionViewCellVMProtocol?
    //MARK: ----------Intializer----------
    init(model: PhotoModel) {
        self.id = model.id
        self.secret = model.secret
        self.server = model.server
        self.farm = model.farm
    }
    //MARK: ----------method----------
    func callAPIAndGetImageFromUrl(farm: Int, server: String, photoId: String, secret: String){
        if farm == 0 || server == "0" {
            return
        }
        ApiManager.shared.getImageFromImageURL(farm: farm, server: server, phototId: photoId, secret: secret) { [weak self] resImage in
            self?.delegate?.getImageFromAPIResponse(resImg: resImage)
        }
    }
}
