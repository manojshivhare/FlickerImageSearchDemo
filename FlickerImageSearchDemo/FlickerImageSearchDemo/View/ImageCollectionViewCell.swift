//
//  ImageCollectionViewCell.swift
//  FlickerImageSearchDemo
//
//  Created by Manoj Shivhare on 16/01/22.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    //MARK: ----------IBOutlet----------
    @IBOutlet weak var flickerImgView: UIImageView!
    //MARK: ----------vaiable----------
    var cellViewModel: ImageCollectionViewCellVM?{
        didSet{
            cellViewModel?.delegate = self
            cellViewModel?.callAPIAndGetImageFromUrl(farm: cellViewModel?.farm ?? 0, server: cellViewModel?.server ?? "", photoId: cellViewModel?.id ?? "", secret: cellViewModel?.secret ?? "")
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
//MARK: ----------Extension ImageCollectionViewCellVMProtocol----------
extension ImageCollectionViewCell: ImageCollectionViewCellVMProtocol{
    func getImageFromAPIResponse(resImg: UIImage) {
        DispatchQueue.main.async {
            self.flickerImgView.image = resImg
        }
    }
    
}
