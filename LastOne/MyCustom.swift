//
//  MyCustom.swift
//  Button
//
//  Created by Hamada Mouhamed on 1/4/18.
//  Copyright © 2018 Hamada Mouhamed. All rights reserved.
//

import UIKit
class MyCustom : UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        self.layer.borderWidth = 1
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2
    }
}
