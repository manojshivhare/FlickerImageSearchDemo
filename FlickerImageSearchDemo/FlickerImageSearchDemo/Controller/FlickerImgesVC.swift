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
        //callAPIToGetData()
        setupCollectionView()
        imageSearchBar.delegate = self
    }
    
    private func setupCollectionView(){
       // imageCollectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCollectionViewCell")
        imageCollectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")

        imageCollectionView.dataSource = self
        imageCollectionView.delegate = self
    }
    private func callAPIToGetData(searchText: String){
        viewModel = FlickerImageVM()
        viewModel?.delegate = self
        viewModel?.callApiManagerAndGetData(viewController: self,searchStr: searchText)
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
        let cell: ImageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        if let photoModel = photoArr?[indexPath.item] {
            cell.cellViewModel = ImageCollectionViewCellVM(model: photoModel)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let yourWidth = (collectionView.bounds.width/3.0) - 5
           let yourHeight = yourWidth

           return CGSize(width: yourWidth, height: yourHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
extension FlickerImgesVC: FlickerImageVMProtocol{
    func notifyAfterGettingData(responseArr: [PhotoModel]?) {
        photoArr = responseArr
        reloadCollectionView()
    }
}
extension FlickerImgesVC: UISearchBarDelegate{
    //MARK: Call ImageSearch API
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if searchBar.text?.count == 0 {
            return
        }
        callAPIToGetData(searchText: searchBar.text!)
    }
}
