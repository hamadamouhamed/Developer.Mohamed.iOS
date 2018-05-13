//
//  MyView.swift
//  TimerApplication
//
//  Created by Hamada Mouhamed on 1/22/18.
//  Copyright © 2018 Hamada Mouhamed. All rights reserved.
//

import UIKit
@IBDesignable
class MyView: UIView {
    @IBInspectable var FirstColor:UIColor = UIColor.clear{
    didSet{
        UpdateView()
    }
    }
    @IBInspectable var SecondColor : UIColor = UIColor.clear{
        didSet{
            UpdateView()
        }
    }
    override class var layerClass: AnyClass{
        get{
            return CAGradientLayer.self
        }
        
    }
    func UpdateView(){
        let Layer = self.layer as!CAGradientLayer
        Layer.colors = [FirstColor.cgColor,SecondColor.cgColor]
        
        
    }
}
