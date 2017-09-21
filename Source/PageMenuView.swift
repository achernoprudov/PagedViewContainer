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
    typealias Indicator = PageMenuIndicator
    
    // MARK: - Instance variables
    
    let MaxHeight: CGFloat = 44
    
    private var menuItems: [PageMenuItem] = []
    private var config: Config!
    
    private weak var coordinator: PageCoordinatorProtocol?
    weak var indicator: Indicator?
    
    // MARK: - Public
    
    convenience init(coordinator: PageCoordinatorProtocol, config: Config) {
        self.init()
        
        self.backgroundColor = config.menuBackgroundColor
        self.coordinator = coordinator
        self.config = config
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        
        setupView()
        addIndicator()
    }
    
    func setup(withItems items: [PageItem]) {
        menuItems.removeAll()
        subviews.forEach { $0.removeFromSuperview() }
        
        guard !items.isEmpty else {
            return
        }
        
        addButtons(with: items)
        reloadViews()
        addIndicator()
        indicator?.move(toFrame: menuItems.first!.frame)
    }
    
    func setActive(page index: Int) {
        reloadViews()
        
        let item = menuItems[index]
        scrollRectToVisible(item.frame, animated: true)
        
        indicator?.move(toFrame: item.frame)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let page = coordinator?.currentPage ?? 0
        let item = menuItems[page]
        indicator?.move(toFrame: item.frame, animated: false)
    }
    
    // MARK: - Private
    
    private func reloadViews() {
        menuItems.forEach { $0.reloadView() }
    }
    
    private func setupView() {
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
        setupViewConstraints()
    }
    
    private func setupViewConstraints() {
        let multiplier = CGFloat(1) / CGFloat(max(coordinator?.enabledItems.count ?? 0, 1))
        
        var trailing: NSLayoutXAxisAnchor = leadingAnchor
        
        for view in menuItems {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
            contentInset = .zero
                   
            view.parentRelatedWidthConstraint = view.widthAnchor
                .constraint(greaterThanOrEqualTo: widthAnchor, multiplier: multiplier)
            view.parentRelatedWidthConstraint.priority = UILayoutPriority(rawValue: 1000)
            view.parentRelatedWidthConstraint.isActive = true
            
            view.heightAnchor.constraint(equalToConstant: MaxHeight).isActive = true
            
            view.topAnchor.constraint(equalTo: topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            
            view.leadingAnchor.constraint(equalTo: trailing).isActive = true
            trailing = view.trailingAnchor
        }
        
        trailing.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    private func addIndicator() {
        let indicatorView = Indicator(config: config)
        addSubview(indicatorView)
        indicator = indicatorView
    }
}
