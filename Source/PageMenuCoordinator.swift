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
    
    func select(page index: Int)
    
    func select(pageInMenu index: Int)
    
    func select(pageInContainer index: Int)
}

class PageCoordinator: PageCoordinatorProtocol {
    
    var currentPage: Int = 0
    
    weak var menu: PageMenu?
    weak var container: PageContainer?
    
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
}
