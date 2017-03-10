//
//  DisableTabViewController.swift
//  PagedViewContainer
//
//  Created by Андрей Чернопрудов on 09/03/2017.
//  Copyright © 2017 Little Stars. All rights reserved.
//

import UIKit
import PagedViewContainer

class DisableTabViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tabDisabledSwitch: UISwitch!
    
    weak var pageContainer: PagedViewContainer?

    override func viewDidLoad() {
        super.viewDidLoad()

        let redView = UIView()
        redView.backgroundColor = .red
        
        let yellowView = UIView()
        yellowView.backgroundColor = .yellow
        
        let items = [
            PageItem(title: "red view", view: redView),
            PageItem(title: "yellow view", view: yellowView)
        ]
        
        let config = PagedViewContainerConfig.shared
        let pagedContainer = PagedViewContainer(config: config)
        self.pageContainer = pagedContainer
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
    
    @IBAction func switchDidChange(_ sender: Any) {
        let isDisabled = !tabDisabledSwitch.isOn
        pageContainer?.set(page: 1, isEnabled: isDisabled)
    }
}
