//
//  BigViewController.swift
//  LastOne
//
//  Created by Hamada Mouhamed on 1/10/18.
//  Copyright © 2018 Hamada Mouhamed. All rights reserved.
//

import UIKit

class BigViewController : UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle
    {return.lightContent}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(BigViewController.HideMenu), name: NSNotification.Name(rawValue: "HideMenu"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BigViewController.ShowMenu), name: NSNotification.Name(rawValue: "ShowMenu"), object: nil)
    }
    
    
    
    @IBOutlet weak var SideMenuLayOut: NSLayoutConstraint!
    
    @objc func HideMenu() {
        SideMenuLayOut.constant = 0
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    @objc func ShowMenu() {
        SideMenuLayOut.constant = self.view.frame.size.width * 0.7
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
}
