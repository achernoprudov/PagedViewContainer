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
        
        delegate = self
    }
    
    func setActive(page index: Int) {
        let view = pages[index]
        scrollRectToVisible(view.frame, animated: true)
    }
    
    func setup(with items: [PageItem]) {
        subviews.forEach { $0.removeFromSuperview() }
        pages.removeAll()
        
        let views = items.map { $0.view }
        add(viewsAsPages: views)
    }
    
    // MARK: - Private
    
    private func add(viewsAsPages views: [UIView]) {
        var trailing: NSLayoutXAxisAnchor = leadingAnchor
        
        for view in views {
            view.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 751), for: .horizontal)
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
            
            view.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
            view.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
            view.topAnchor.constraint(equalTo: topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            
            view.leadingAnchor.constraint(equalTo: trailing).isActive = true
            trailing = view.trailingAnchor
        }
        
        trailing.constraint(equalTo: trailingAnchor).isActive = true
        
        self.pages = views
    }
}

extension PageContainterScrollView: UIScrollViewDelegate {
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let indexOfPage = scrollView.contentOffset.x / scrollView.frame.size.width
        coordinator?.select(page: Int(indexOfPage))
    }
}

