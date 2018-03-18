//
//  PagedViewContainerConfig.swift
//  PagingMenuView
//
//  Created by Андрей Чернопрудов on 03/03/2017.
//  Copyright © 2017 Naumen. All rights reserved.
//

import UIKit

/// Configuration for PagedViewContainer
public struct PagedViewContainerConfig {
    
    // MARK: - Enum
    
    /// Menu mode definition
    ///
    /// - pagedTop: menu located on top of view. With page indicator
    /// - none: configuration without menu
    public enum Mode {
        case pagedTop
        case none
    }
    
    // MARK: - Static variables
    
    public static let shared: PagedViewContainerConfig = PagedViewContainerConfig()
    
    // MARK: - Instance variables
    
    public var pagesBackgroundColor: UIColor
    public var menuBackgroundColor: UIColor
    public var activeItemTextColor: UIColor
    public var inactiveItemTextColor: UIColor
    public var indicatorColor: UIColor
    public var mode: Mode

    // MARK: - Public
    
    public init(
        pagesBackgroundColor: UIColor = .white,
        menuBackgroundColor: UIColor = .white,
        activeItemTextColor: UIColor = .black,
        inactiveItemTextColor: UIColor = .gray,
        indicatorColor: UIColor = .black,
        mode: Mode = .pagedTop)
    {
        self.pagesBackgroundColor = pagesBackgroundColor
        self.menuBackgroundColor = menuBackgroundColor
        self.activeItemTextColor = activeItemTextColor
        self.inactiveItemTextColor = inactiveItemTextColor
        self.indicatorColor = indicatorColor
        self.mode = mode
    }
}
