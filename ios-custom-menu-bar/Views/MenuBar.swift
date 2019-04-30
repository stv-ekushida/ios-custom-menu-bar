//
//  MenuBar.swift
//  ios-custom-menu-bar
//
//  Created by Eiji Kushida on 2019/04/30.
//  Copyright © 2019 Eiji Kushida. All rights reserved.
//

import UIKit

final class MenuBar: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var menuIconImageNames = [String]()
    var horizontalBarLeftAnchorConstranit: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setupCollectionView() {
        collectionView.backgroundColor = .red
        collectionView.dataSource = self
        collectionView.delegate = self
        setupHorizontalBar()
    }
    
    func setupMenuList(menuIconImageNames: [String]) {
        self.menuIconImageNames = menuIconImageNames
    }
    
    func selectedMenu() {
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .top)
    }
    
    /// 選択中のバーを設定する
    private func setupHorizontalBar() {
        
        let horizontalBarView = UIView()
        horizontalBarView.backgroundColor = .white
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalBarView)
        
        horizontalBarLeftAnchorConstranit = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
        horizontalBarLeftAnchorConstranit?.isActive = true
        horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
        horizontalBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }
}

// MARK: - UICollectionViewDataSource
extension MenuBar: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as? MenuCell
        cell?.menuImageView.image = UIImage(named: menuIconImageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell?.menuImageView.tintColor = .black
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuIconImageNames.count
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
extension MenuBar: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
     
        return CGSize(width: frame.width / 4, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        let x = CGFloat(indexPath.item) * frame.width / 4
        horizontalBarLeftAnchorConstranit?.constant = x
        
        UIView.animate(withDuration: 0.75,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: .curveEaseOut, animations: {
                        self.layoutIfNeeded()

        }, completion: nil)
    }
}
