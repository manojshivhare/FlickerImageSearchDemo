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
        cellViewModel?.delegate = self
    }
}
extension ImageCollectionViewCell: ImageCollectionViewCellVMProtocol{
    func getImageFromAPIResponse(resImg: UIImage) {
        DispatchQueue.main.async {
            self.flickerImgView.image = resImg
        }
    }
    
}
