//
//  PagerContainter.swift
//  PagingMenuView
//
//  Created by Андрей Чернопрудов on 02/03/2017.
//  Copyright © 2017 Naumen. All rights reserved.
//

import UIKit

protocol PageContainer: class {
    
    func setup(with items: [PageItem])
    
    func setActive(page index: Int)
    
}

class PageContainterScrollView: UIScrollView, PageContainer {
    
    // MARK: - Instance variables
    
    weak var coordinator: PageCoordinator?
    var pages: [UIView] = []
    
    // MARK: - Public
    
    convenience init(coordinator: PageCoordinator) {
        self.init()
        self.coordinator = coordinator
        
        translatesAutoresizingMaskIntoConstraints = false
        isPagingEnabled = true
        bounces = false
        showsHorizontalScrollIndicator = false
    }
    
    func setActive(page index: Int) {
        let view = pages[index]
        scrollRectToVisible(view.frame, animated: true)
    }
    
    func setup(with items: [PageItem]) {
        let views = items.map { $0.view }
        add(viewsAsPages: views)
    }
    
    // MARK: - Private
    
    private func add(viewsAsPages views: [UIView]) {
        for view in views {
            view.setContentCompressionResistancePriority(751, for: .horizontal)
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
            
            view.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
            view.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
            view.topAnchor.constraint(equalTo: topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        }
        
        //TODO make for any number of views
        views.first?.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        views.last?.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        views.first?.trailingAnchor.constraint(equalTo: views.last!.leadingAnchor).isActive = true
        
        self.pages = views
    }
}
