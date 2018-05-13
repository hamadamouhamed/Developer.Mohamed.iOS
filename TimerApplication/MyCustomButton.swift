//
//  MyCustomButton.swift
//  TimerApplication
//
//  Created by Hamada Mouhamed on 1/23/18.
//  Copyright © 2018 Hamada Mouhamed. All rights reserved.
//

import UIKit
@IBDesignable
class MyCustomButton: UIButton {
    @IBInspectable var BorderWidth : CGFloat = 0{
        didSet{
            self.layer.borderWidth=BorderWidth
        }
    }
    @IBInspectable var BorderColor:UIColor=UIColor.clear{
        didSet{
            self.layer.borderColor=BorderColor.cgColor
        }
    }
    @IBInspectable var CornerRadius:CGFloat=0{
        didSet{
           self.layer.cornerRadius=CornerRadius
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.clipsToBounds=true
    }
}
