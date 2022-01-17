//
//  ImageCollectionViewCellVM.swift
//  FlickerImageSearchDemo
//
//  Created by Manoj Shivhare on 16/01/22.
//

import Foundation
import UIKit
protocol ImageCollectionViewCellVMProtocol {
    func getImageFromAPIResponse(resImg: UIImage)
}

class ImageCollectionViewCellVM{

    var delegate: ImageCollectionViewCellVMProtocol?
    
    init(model: PhotoModel) {
        callAPIAndGetImageFromUrl(farm: model.farm, server: model.server, photoId: model.id, secret: model.secret)
    }
    
    private func callAPIAndGetImageFromUrl(farm: Int, server: String, photoId: String, secret: String){
        ApiManager.shared.getImageFromImageURL(farm: farm, server: server, phototId: photoId, secret: secret) { [weak self] resImage in
            self?.delegate?.getImageFromAPIResponse(resImg: resImage)
        }
    }
}
