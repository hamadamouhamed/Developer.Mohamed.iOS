//
//  SideViewController.swift
//  CalCulator With My Hand
//
//  Created by Hamada Mouhamed on 1/9/18.
//  Copyright © 2018 Hamada Mouhamed. All rights reserved.
//

import UIKit

class SideViewController : UIViewController
{
    @IBAction func Menu(_ sender: UIButton) {
        var ToVc : String = ""
        if sender.tag == 0 {
            ToVc = "Main"
        }else if sender.tag == 1 {
            ToVc = "About Us"
        }else if sender.tag == 2 {
            ToVc = "Contact Us"
        } 
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ChangeVC"), object: nil, userInfo: ["ToVc" : ToVc])
    }
    
    
}
