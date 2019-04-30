//
//  ViewController.swift
//  ios-custom-menu-bar
//
//  Created by Eiji Kushida on 2019/04/30.
//  Copyright © 2019 Eiji Kushida. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var menuBar: MenuBar!
    private let imageNames = ["home", "video", "music", "account"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuBar.setupCollectionView()
        menuBar.setupMenuList(menuIconImageNames: imageNames)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        menuBar.selectedMenu()
    }
}

