//
//  MenuCell.swift
//  ios-custom-menu-bar
//
//  Created by Eiji Kushida on 2019/04/30.
//  Copyright © 2019 Eiji Kushida. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {
 
    @IBOutlet weak var menuImageView: UIImageView!

    override var isHighlighted: Bool {
        didSet {
            menuImageView.tintColor = isHighlighted ? .white : .black
        }
    }

    override var isSelected: Bool {
        didSet {
            menuImageView.tintColor = isSelected ? .white : .black
        }
    }
}
