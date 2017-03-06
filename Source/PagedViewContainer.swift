//
//  PagedViewContainer.swift
//  PagedViewContainer
//
//  Created by Андрей Чернопрудов on 02/03/2017.
//  Copyright © 2017 Naumen. All rights reserved.
//

import UIKit

open class PagedViewContainer: UIView {
    
    // MARK: - Aliases
    
    public typealias Config = PagedViewContainerConfig
    
    // MARK: - Instance variables
    
    private weak var pageContainer: PageContainterScrollView!
    private weak var pageMenu: PageMenuView!
    
    private var coordinator = PageCoordinator()
    private var config: Config!
    
    // MARK: - Public
    
    public convenience init(config: Config = .shared) {
        self.init()
        self.config = config
 
        backgroundColor = .white
        
        buildMenu()
        buildPageContainer()
        
        coordinator.menu = pageMenu
        coordinator.container = pageContainer
    }
    
    open func setup(with items: [PageItem]) {
        pageMenu.setup(withItems: items)
        pageContainer.setup(with: items)
    }
    
    // MARK: - Private
    
    private func buildMenu() {
        let menu = PageMenuView(coordinator: coordinator, config: config)
        
        addSubview(menu)
        
        menu.topAnchor.constraint(equalTo: topAnchor).isActive = true
        menu.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        menu.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        pageMenu = menu
    }
    
    private func buildPageContainer() {
        let container = PageContainterScrollView(coordinator: coordinator)
        addSubview(container)
        
        container.topAnchor.constraint(equalTo: pageMenu.bottomAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        container.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        container.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        pageContainer = container
    }
}
