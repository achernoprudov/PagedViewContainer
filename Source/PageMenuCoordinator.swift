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
}

class PageCoordinator: PageCoordinatorProtocol {
    
    var currentPage: Int = 0
    
    weak var menu: PageMenu?
    weak var container: PageContainer?
    
    func select(page index: Int) {
        currentPage = index
        container?.setActive(page: index)
        menu?.setActive(page: index)
    }
}
