//
//  SwipeableCardViewCard.swift
//  moivematcher
//
//  Created by Zhe Wang on 2021-11-08.
//

import Foundation

import UIKit

class SwipeableCardViewCard: SwipeableView, NibView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

}
