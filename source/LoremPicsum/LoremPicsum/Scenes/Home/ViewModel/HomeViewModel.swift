//
//  HomeViewModel.swift
//  LoremPicsum
//
//  Created by Ravindran on 03/01/23.
//

import Foundation

class HomeViewModel {
    
    private var tabs: [TabData]!
    
    init(tabs: [TabData]) {
        self.tabs = tabs
    }
    
    func getTabsData() -> [TabData] {
        return tabs
    }
}
