//
//  LoremPicsumTests.swift
//  LoremPicsumTests
//
//  Created by Ravindran on 03/01/23.
//

import XCTest
@testable import LoremPicsum

final class LoremPicsumTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        
    }

    func testUIFactory() throws {
        XCTAssertNotNil(UIFactory.getButton(id: "TestButton"))
        XCTAssertNotNil(UIFactory.getView(id: "TestView"))
        XCTAssertNotNil(UIFactory.getTableView(id: "TestTable", style: .grouped, dataSource: self, delegate: self))
        XCTAssertNotNil(UIFactory.getActivityIndicator(id: "TestIndicator"))
        XCTAssertNotNil(UIFactory.getLabel(id: "TestLabel"))
        XCTAssertNotNil(UIFactory.getSegmentedControl(id: "TestControl", items: ["A", "B"]))
        XCTAssertNotNil(UIFactory.getImageView(id: "TestImageView"))
        XCTAssertNotNil(UIFactory.getCollectionView(id: "TestCollection", dataSource: self, delegate: self))
    }
    
    func testImageViewHelper() throws {
        let imageView = UIFactory.getImageView(id: "testImageView")
        imageView.imageWithURL(APIEndPoints.ImageData.imageUrl(id: "0", width: 100, height: 100).url)
    }
    
    func testDefaultsManager() throws {
        UserDefaultsManager.setInt(0, forKey: .favourites)
        XCTAssertTrue(UserDefaultsManager.integerForKey(.favourites) == 0)
        
        UserDefaultsManager.setString("test", forKey: .favourites)
        XCTAssertTrue(UserDefaultsManager.stringForKey(.favourites) == "test")
        
        UserDefaultsManager.setBool(true, forKey: .favourites)
        XCTAssertTrue(UserDefaultsManager.boolForKey(.favourites) == true)
        
        UserDefaultsManager.removeAllUserDefaultValues()
        UserDefaultsManager.setString("test", forKey: .favourites)
        UserDefaultsManager.removeValueForKey(.favourites)
    }
    
    func testFavouritesManager() throws {
        let testData = [ImageElement(id: "0", author: "", width: 100, height: 100, url: "", downloadURL: ""),
                        ImageElement(id: "1", author: "", width: 100, height: 100, url: "", downloadURL: "")]
        FavouritesManager.shared.updateFavouriteList(testData)
        FavouritesManager.shared.updateFavouriteItem(ImageElement(id: "2", author: "", width: 100, height: 100, url: "", downloadURL: ""))
        XCTAssertTrue(FavouritesManager.shared.getListOfFavourites()?.count == 3)
    }

}

extension LoremPicsumTests: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
