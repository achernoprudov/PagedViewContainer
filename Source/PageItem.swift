//
//  PageItem.swift
//  PageItem
//
//  Created by Андрей Чернопрудов on 03/03/2017.
//  Copyright © 2017 Naumen. All rights reserved.
//

import UIKit

public struct PageItem {
    
    public var title: String
    public var view: UIView
    
    public init(title: String, view: UIView) {
        self.title = title
        self.view = view
    }
}
