//
//  PagedViewContainerConfig.swift
//  PagingMenuView
//
//  Created by Андрей Чернопрудов on 03/03/2017.
//  Copyright © 2017 Naumen. All rights reserved.
//

import UIKit

public struct PagedViewContainerConfig {
    
    // MARK: - Static variables
    
    public static let shared: PagedViewContainerConfig = PagedViewContainerConfig()
    
    // MARK: - Instance variables
    
    public var pagesBackgroundColor: UIColor
    public var menuBackgroundColor: UIColor
    public var activeItemTextColor: UIColor
    public var inactiveItemTextColor: UIColor
    public var indicatorColor: UIColor

    // MARK: - Public
    
    public init(
        pagesBackgroundColor: UIColor = .white,
        menuBackgroundColor: UIColor = .white,
        activeItemTextColor: UIColor = .black,
        inactiveItemTextColor: UIColor = .gray,
        indicatorColor: UIColor = .black) {
        self.pagesBackgroundColor = pagesBackgroundColor
        self.menuBackgroundColor = menuBackgroundColor
        self.activeItemTextColor = activeItemTextColor
        self.inactiveItemTextColor = inactiveItemTextColor
        self.indicatorColor = indicatorColor
    }
}
