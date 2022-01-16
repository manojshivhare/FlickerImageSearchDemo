//
//  APIManager.swift
//  FlickerImageSearchDemo
//
//  Created by Manoj Shivhare on 16/01/22.
//

import Foundation
import UIKit

struct FlickerImageUrl {
    static let searchURl = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=2932ade8b209152a7cbb49b631c4f9b6&%20format=json&nojsoncallback=1&safe_search=1&text="
}

class ApiManager{
    
    static let shared = ApiManager()
    let session = URLSession(configuration: .default)
    var request : NSMutableURLRequest = NSMutableURLRequest()
    var activityIndicator : UIActivityIndicatorView?
    
    func getImageArrFromAPI(searchKey:String,view:UIView,_ complition: @escaping ([PhotoModel]?)->()) {
        let urlStr = FlickerImageUrl.searchURl + "\(searchKey)"
        guard let url = URL(string: urlStr) else {return}
        request.url = url
        request.httpMethod = "GET"
        request.timeoutInterval = 100
        showProgressView(in: view)
        let task = session.dataTask(with: url) { (data, response, error) in
            self.hideProgressView()
            guard let data = data, error == nil else  {
                print(error?.localizedDescription ?? "Response error")
                return
            }
            
            let imageArr = try? JSONDecoder().decode(PictureModel.self, from: data).photos?.photo
            complition(imageArr)
        }
        task.resume()
    }
    
    //MARK: Download image from URL
    func getImageFromImageURL(farm: Int, server: String, phototId: String, secret: String, completionBlock: @escaping (UIImage) -> ()) {
        let urlStr = "https://farm\(farm).static.flickr.com/\(server)/\(phototId)_\(secret).jpg"
        debugPrint("imageUrl =\(urlStr)")
        guard let url = URL(string: urlStr) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data) else{return}
            completionBlock(image)
        }.resume()
    }
    
    //MARK: Show Progress View
    func showProgressView(in view:UIView) {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator?.frame = view.bounds
        if let progressBar = activityIndicator{
            view.addSubview(progressBar)
        }
        activityIndicator?.startAnimating()
    }
    
    //MARK: Hide Progress View
    func hideProgressView() {
        DispatchQueue.main.async {
            self.activityIndicator?.stopAnimating()
            self.activityIndicator?.removeFromSuperview()
        }
    }
    
}
