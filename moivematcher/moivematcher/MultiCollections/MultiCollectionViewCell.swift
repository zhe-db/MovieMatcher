//
//  MultiCollectionViewCell.swift
//  moivematcher
//
//  Created by Zhe Wang on 2021-11-08.
//

import Foundation

import UIKit

public class MultiCollectionViewCell: UICollectionViewCell {
    
    private var configured: Bool = false
    private(set) var collectionViewRow: MultiCollectionViewRow!
    
    public var section: Int {
        set {
            collectionViewRow.section = newValue
        }
        get {
            return collectionViewRow.section
        }
    }
    
    public func configure(with classesReuseRegistry: [String: AnyClass?], nibsReuseRegistry: [String: UINib?], listener: UICollectionViewDelegate & UICollectionViewDataSource) {
        guard !configured else {
            return
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        collectionViewRow = MultiCollectionViewRow(frame: .zero, collectionViewLayout: layout)
        collectionViewRow.clipsToBounds = false
        collectionViewRow.backgroundColor = .clear
        collectionViewRow.showsHorizontalScrollIndicator = false
        contentView.addSubview(collectionViewRow)
        
        for classReuseInfo in classesReuseRegistry {
            collectionViewRow.register(classReuseInfo.value, forCellWithReuseIdentifier: classReuseInfo.key)
        }
        
        for (key, value) in nibsReuseRegistry {
            collectionViewRow.register(value, forCellWithReuseIdentifier: key)
        }
        
        collectionViewRow.delegate = listener
        collectionViewRow.dataSource = listener
        
        configured = true
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()

        collectionViewRow.frame = contentView.bounds
    }
    
    override public func prepareForReuse() {
        super.prepareForReuse()
        
        collectionViewRow.setContentOffset(collectionViewRow.contentOffset, animated: false)
    }
}
