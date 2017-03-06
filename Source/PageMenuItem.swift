//
//  PageMenuItem.swift
//  PageMenuItem
//
//  Created by Андрей Чернопрудов on 03/03/2017.
//  Copyright © 2017 Naumen. All rights reserved.
//

import UIKit

/// Page item for top menu
class PageMenuItem: UIView {
    
    // MARK: - Aliases
    
    typealias Config = PagedViewContainerConfig
    
    // MARK: - Instance variables
    
    private weak var coordinator: PageCoordinatorProtocol?
    private weak var label: UILabel!
    private var config: Config!

    // MARK: - Public
    
    convenience init(title: String, coordinator: PageCoordinatorProtocol?, config: Config) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        self.coordinator = coordinator
        self.config = config
        
        addLabel(with: title)
        addGestures()
    }
    
    func didTap() {
        coordinator?.select(page: tag)
    }
    
    func reloadView() {
        let isActive = coordinator?.currentPage == tag
        label.textColor = isActive
            ? config.activeItemTextColor
            : config.inactiveItemTextColor
    }
    
    // MARK: - Private
    
    private func addLabel(with title: String) {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title
        label.textAlignment = .center
        self.label = label
        addSubview(label)
        
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        let guide = layoutMarginsGuide
        
        label.leadingAnchor
            .constraint(equalTo: guide.leadingAnchor).isActive = true
        label.trailingAnchor
            .constraint(equalTo: guide.trailingAnchor).isActive = true
    }
    
    private func addGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(PageMenuItem.didTap))
        addGestureRecognizer(tap)
    }
}
