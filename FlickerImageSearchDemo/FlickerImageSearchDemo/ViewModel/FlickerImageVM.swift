//
//  FlickerImageVM.swift
//  FlickerImageSearchDemo
//
//  Created by Manoj Shivhare on 16/01/22.
//

import Foundation
import UIKit
protocol FlickerImageVMProtocol{
    func notifyAfterGettingData(responseArr: [PhotoModel]?)
}
struct FlickerImageVM {
    var delegate: FlickerImageVMProtocol?
    func callApiManagerAndGetData(viewController: UIViewController,searchStr: String){
        ApiManager.shared.getImageArrFromAPI(searchKey: searchStr, view: viewController.view) { responseArr in
            self.delegate?.notifyAfterGettingData(responseArr: responseArr)
        }
    }
}
