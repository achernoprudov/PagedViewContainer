//
//  PagedViewContainer.swift
//  PagedViewContainer
//
//  Created by Андрей Чернопрудов on 02/03/2017.
//  Copyright © 2017 Naumen. All rights reserved.
//

import UIKit

/// Container for all PageItems
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
    
    /// Setup menu with PageItems
    open func setup(with items: [PageItem]) {
        coordinator.setup(with: items)
        pageContainer.setup(with: items)
        pageMenu.setup(withItems: items)
    }
    
    /// Define page at index as enabled(disabled) in container
    open func set(page index: Int, isEnabled: Bool) {
        coordinator.set(page: index, isEnabled: isEnabled)
    }
    
    /// Check is page at index is enabled
    open func isEnabled(page index: Int) -> Bool {
        return coordinator.items[index].isEnabled
    }
    
    /// Return enabled pages coung
    open var enabledPagesCount: Int {
        return coordinator.enabledItems.count
    }
    
    // MARK: - Private
    
    private func buildMenu() {
        let menu = PageMenuView(coordinator: coordinator, config: config)
        addSubview(menu)
        
        NSLayoutConstraint.activate([
            menu.topAnchor.constraint(equalTo: topAnchor),
            menu.leadingAnchor.constraint(equalTo: leadingAnchor),
            menu.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        pageMenu = menu
    }
    
    private func buildPageContainer() {
        let container = PageContainterScrollView(coordinator: coordinator)
        addSubview(container)
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: pageMenu.bottomAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        pageContainer = container
    }
}
