//
//  ImageCollectionViewCell.swift
//  FlickerImageSearchDemo
//
//  Created by Manoj Shivhare on 16/01/22.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var flickerImgView: UIImageView!
    var cellViewModel: ImageCollectionViewCellVM?{
        didSet{
            setUpImage()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    private func setUpImage(){
        guard let farm = cellViewModel?.farm, let server = cellViewModel?.server, let photoId = cellViewModel?.photoId, let secret = cellViewModel?.secret else {
            return
        }
        ApiManager.shared.getImageFromImageURL(farm: farm, server: server, phototId: photoId, secret: secret) { resImage in
            DispatchQueue.main.async {
                self.flickerImgView.image = resImage
            }
        }
    }
}
