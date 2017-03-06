//
//  ViewController.swift
//  PagedViewContainerExample
//
//  Created by Андрей Чернопрудов on 06/03/2017.
//  Copyright © 2017 Little Stars. All rights reserved.
//

import UIKit
import PagedViewContainer

class ViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let redView = UIView()
        redView.backgroundColor = .red
        
        let yellowView = UIView()
        yellowView.backgroundColor = .yellow
        
        let items = [
            PageItem(title: "red view", view: redView),
            PageItem(title: "yellow view", view: yellowView) ]
        
        let config = PagedViewContainerConfig.shared
        let pagedContainer = PagedViewContainer(config: config)
        pagedContainer.setup(with: items)
        
        automaticallyAdjustsScrollViewInsets = false
        pagedContainer.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(pagedContainer)
        
        let guide = contentView.layoutMarginsGuide
        
        guide.topAnchor.constraint(equalTo: pagedContainer.topAnchor).isActive = true
        guide.bottomAnchor.constraint(equalTo: pagedContainer.bottomAnchor).isActive = true
        guide.trailingAnchor.constraint(equalTo: pagedContainer.trailingAnchor).isActive = true
        guide.leadingAnchor.constraint(equalTo: pagedContainer.leadingAnchor).isActive = true
        
    }
}

