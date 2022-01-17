//
//  FlickerImageVM.swift
//  FlickerImageSearchDemo
//
//  Created by Manoj Shivhare on 16/01/22.
//

import Foundation
import UIKit
struct FlickerImageVM {
    //MARK: ----------Varibale----------
    var delegate: FlickerImageVMProtocol?
    //MARK: ----------Method----------
    func callApiManagerAndGetData(viewController: UIViewController,searchStr: String){
        ApiManager.shared.getImageArrFromAPI(searchKey: searchStr, view: viewController.view) { responseArr in
            self.delegate?.notifyAfterGettingData(responseArr: responseArr)
        }
    }
}
