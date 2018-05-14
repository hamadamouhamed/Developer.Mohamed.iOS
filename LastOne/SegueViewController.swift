//
//  SegueViewController.swift
//  CalCulator With My Hand
//
//  Created by Hamada Mouhamed on 1/9/18.
//  Copyright © 2018 Hamada Mouhamed. All rights reserved.
//

import UIKit

class SegueViewController : UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(SegueViewController.ChangeVc(notification:)), name: NSNotification.Name(rawValue: "ChangeVC"), object: nil)
        }
    
    @objc func ChangeVc(notification : NSNotification){
        if let Dic = notification.userInfo as? [String : AnyObject] {
            if let Name = Dic["ToVc"] as? String{
                performSegue(withIdentifier: Name, sender: nil)
            }
        }
        
    }
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            performSegue(withIdentifier: "Main", sender: nil)
        }
}
