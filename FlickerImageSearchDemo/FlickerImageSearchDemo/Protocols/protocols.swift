//
//  protocols.swift
//  FlickerImageSearchDemo
//
//  Created by Manoj Shivhare on 17/01/22.
//

import Foundation
import UIKit
protocol FlickerImageVMProtocol{
    func notifyAfterGettingData(responseArr: [PhotoModel]?)
}
protocol ImageCollectionViewCellVMProtocol {
    func getImageFromAPIResponse(resImg: UIImage)
}
