//
//  FlickerImgesVC.swift
//  FlickerImageSearchDemo
//
//  Created by Manoj Shivhare on 16/01/22.
//

import UIKit

class FlickerImgesVC: UIViewController {
    
    @IBOutlet weak var imageSearchBar: UISearchBar!
    @IBOutlet weak var imageCollectionView: UICollectionView!
    private var viewModel: FlickerImageVM?
    private var photoArr: [PhotoModel]?
    override func viewDidLoad() {
        super.viewDidLoad()
        callAPIToGetData()
        setupCollectionView()
    }
    
    private func setupCollectionView(){
        imageCollectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCollectionViewCell")
        imageCollectionView.dataSource = self
        imageCollectionView.delegate = self
    }
    private func callAPIToGetData(){
        viewModel = FlickerImageVM()
        viewModel?.delegate = self
        viewModel?.callApiManagerAndGetData(viewController: self,searchStr: "cat")
    }
    private func reloadCollectionView(){
        DispatchQueue.main.async {
            self.imageCollectionView.reloadData()
        }
    }
}
extension FlickerImgesVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArr?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath as IndexPath) as! ImageCollectionViewCell
        if let photoModel = photoArr?[indexPath.item] {
            cell.cellViewModel = ImageCollectionViewCellVM(model: photoModel)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return indexPath.item == 0 ? CGSize(width: 0, height: 0) : CGSize(width: collectionView.bounds.size.width/2.1, height: collectionView.bounds.size.width/2.1)
    }
}
extension FlickerImgesVC: FlickerImageVMProtocol{
    func notifyAfterGettingData(responseArr: [PhotoModel]?) {
        photoArr = responseArr
        reloadCollectionView()
    }
}
