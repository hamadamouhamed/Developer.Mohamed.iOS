//
//  SideBarViewShadow.swift
//  LastOne
//
//  Created by Hamada Mouhamed on 1/13/18.
//  Copyright © 2018 Hamada Mouhamed. All rights reserved.
//

import UIKit
class SideBarViewShadow : UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        self.layer.shadowRadius = 3
        self.layer.shadowOffset = CGSize(width: 4, height: -3)
        self.layer.shadowOpacity = 0.35
    }
}
