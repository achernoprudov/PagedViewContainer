//
//  PageMenuView.swift
//  PageMenuView
//
//  Created by Андрей Чернопрудов on 02/03/2017.
//  Copyright © 2017 Naumen. All rights reserved.
//

import UIKit

protocol PageMenu: class {
    
    func setup(withItems items: [PageItem])
    
    func setActive(page index: Int)

}

class PageMenuView: UIScrollView, PageMenu {
    
    // MARK: - Aliases
    
    typealias Config = PagedViewContainerConfig
    
    // MARK: - Instance variables
    
    let MaxHeight: CGFloat = 44
    
    private var menuItems: [PageMenuItem] = []
    private var config: Config!
    
    private weak var coordinator: PageCoordinatorProtocol?
    
    // MARK: - Public
    
    convenience init(coordinator: PageCoordinatorProtocol, config: Config) {
        self.init()
        
        self.backgroundColor = config.menuBackgroundColor
        self.coordinator = coordinator
        self.config = config
        
        setupConstraints()
    }
    
    func setup(withItems items: [PageItem]) {
        addButtons(with: items)
        reloadViews()
    }
    
    func setActive(page index: Int) {
        reloadViews()
    }
    
    // MARK: - Private
    
    private func reloadViews() {
        menuItems.forEach { $0.reloadView() }
        // move indicator
    }
    
    private func setupConstraints() {
        bounces = false
        contentInset = .zero
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: MaxHeight).isActive = true
    }
    
    private func addButtons(with items: [PageItem]) {
        menuItems.removeAll()
        
        for (index, pageItem) in items.enumerated() {
            let item = PageMenuItem(title: pageItem.title, coordinator: coordinator, config: config)
            item.tag = index
            menuItems.append(item)
        }
        let multiplier = CGFloat(1) / CGFloat(items.count)
        
        for view in menuItems {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
            contentInset = .zero
            
            view.widthAnchor.constraint(equalTo: widthAnchor, multiplier: multiplier).isActive = true
            view.heightAnchor.constraint(equalToConstant: MaxHeight).isActive = true
            
            view.topAnchor.constraint(equalTo: topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        }
        
        //TODO make for any number of views
        menuItems.first?.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        menuItems.last?.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        menuItems.first?.trailingAnchor.constraint(equalTo: menuItems.last!.leadingAnchor).isActive = true
    }
}
