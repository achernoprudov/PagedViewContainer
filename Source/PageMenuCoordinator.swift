//
//  PagingMenuCoordinator.swift
//  PagingMenuView
//
//  Created by Андрей Чернопрудов on 03/03/2017.
//  Copyright © 2017 Naumen. All rights reserved.
//

import UIKit

protocol PageCoordinatorProtocol: class {
    
    var currentPage: Int { get }
    
    var enabledItems: [PageItem] { get }
    
    func select(page index: Int)
    
    func select(pageInMenu index: Int)
    
    func select(pageInContainer index: Int)
    
    func set(page index: Int, isEnabled: Bool)
    
    func isEnabled(page: Int) -> Bool
}

class PageCoordinator: PageCoordinatorProtocol {
    
    var items: [PageItem] = []
    
    var currentPage: Int = 0
    
    weak var menu: PageMenu?
    weak var container: PageContainer?
    
    var enabledItems: [PageItem] {
        return items.filter { $0.isEnabled }
    }
    
    func setup(with items: [PageItem]) {
        self.items = items
        correctCurrentPageIndex()
    }
    
    func select(page index: Int) {
        currentPage = index
        select(pageInMenu: index)
        select(pageInContainer: index)
    }
    
    func select(pageInMenu index: Int) {
        menu?.setActive(page: index)
    }
    
    func select(pageInContainer index: Int) {
        container?.setActive(page: index)
    }
    
    func set(page index: Int, isEnabled: Bool) {
        items[index].isEnabled = isEnabled
        correctCurrentPageIndex()
        
        let enabledItems = self.enabledItems
        UIView.animate(withDuration: 0.3) { 
            self.menu?.setup(withItems: enabledItems)
            self.container?.setup(with: enabledItems)
        }
    }
    
    func isEnabled(page: Int) -> Bool {
        return items[page].isEnabled
    }
    
    private func correctCurrentPageIndex() {
        if currentPage >= enabledItems.count {
            currentPage = 0
        }
    }
}
