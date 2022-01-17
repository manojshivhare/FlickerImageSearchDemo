//
//  FlickerImageSearchDemoTests.swift
//  FlickerImageSearchDemoTests
//
//  Created by Manoj Shivhare on 16/01/22.
//

import XCTest
@testable import FlickerImageSearchDemo

class FlickerImageSearchDemoTests: XCTestCase {
    
    func testImageSearchAPIUrl(){
        let imageSearchURl = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=2932ade8b209152a7cbb49b631c4f9b6&%20format=json&nojsoncallback=1&safe_search=1&text="
        XCTAssertEqual(imageSearchURl, FlickerImageUrl.searchURl)
    }
    
    func testAPIResponseNotNil(){
        let expactation = self.expectation(description: "APImanagerWillBeCheckedNotNil")
        ApiManager.shared.getImageArrFromAPI(searchKey: "kitten", view: UIView()) { photoArr in
            XCTAssertNotNil(photoArr)
            expactation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testSearchAPIResponseNil(){
        let expactation = self.expectation(description: "APImanagerWillBeCheckedNil")
        ApiManager.shared.getImageArrFromAPI(searchKey: "", view: UIView()) { photoArr in
            XCTAssertNil(photoArr)
            expactation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testCollectionViewModelNotnil(){
        let photoModel = PhotoModel(id: "0", owner: "1", secret: "2", server: "3", farm: 0, title: "title", ispublic: 1, isfriend: 1, isfamily: 1)
        let photoVModel = ImageCollectionViewCellVM(model: photoModel)
        XCTAssertEqual(photoModel.farm, photoVModel.farm)
        XCTAssertEqual(photoModel.secret, photoVModel.secret)
        XCTAssertEqual(photoModel.server, photoVModel.server)
        XCTAssertEqual(photoModel.id, photoVModel.id)
    }
    
}
