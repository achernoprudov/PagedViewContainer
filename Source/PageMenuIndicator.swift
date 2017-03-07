//
//  PageMenuIndicator.swift
//  PagedViewContainer
//
//  Created by Андрей Чернопрудов on 07/03/2017.
//  Copyright © 2017 Little Stars. All rights reserved.
//

import UIKit

class PageMenuIndicator: UIView {
    
    let Height: CGFloat = 3
    
    typealias Config = PagedViewContainerConfig

    convenience init(config: Config) {
        self.init()
        self.backgroundColor = config.indicatorColor
    }
    
    func move(toFrame itemFrame: CGRect, animated: Bool = true) {
        let newFrame = CGRect(x: itemFrame.origin.x,
                              y: itemFrame.size.height - Height,
                              width: itemFrame.size.width,
                              height: Height)
        
        guard animated else {
            frame = newFrame
            return
        }
        
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveEaseInOut,
                       animations: { 
                        self.frame = newFrame
        }, completion: nil)
    }
}
