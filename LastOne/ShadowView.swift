//
//  ShadowView.swift
//  CalCulator With My Hand
//
//  Created by Hamada Mouhamed on 1/4/18.
//  Copyright © 2018 Hamada Mouhamed. All rights reserved.
//

import UIKit
class ShadowView : UIView{
    let MyLayer :CAGradientLayer = CAGradientLayer()
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        self.layer.shadowRadius = 3
        self.layer.shadowOffset = CGSize(width: -3, height: -3)
        self.layer.shadowOpacity = 0.35
        
       
        let FirstColor = UIColor.init(red: 215/255, green: 114/255, blue: 179/255, alpha: 1).cgColor
        let SecondColor = UIColor.init(red: 72/255, green: 143/255, blue: 223/255, alpha: 1).cgColor
        MyLayer.colors = [FirstColor , SecondColor]
        MyLayer.startPoint = CGPoint (x : 0 , y : 0.04)
        MyLayer.endPoint = CGPoint (x : 0 , y : 0.6)
        MyLayer.zPosition = -1
        self.layer.addSublayer(MyLayer)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
         MyLayer.frame = CGRect(x:0 , y:0 , width : self.frame.size.width , height : self.frame.size.height)
    }
    }  
