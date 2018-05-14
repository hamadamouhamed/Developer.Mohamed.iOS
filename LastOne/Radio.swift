//
//  Radio.swift
//  LastOne
//
//  Created by Hamada Mouhamed on 1/10/18.
//  Copyright © 2018 Hamada Mouhamed. All rights reserved.
//

import Foundation

class RadioClass {
    
     static var IsMenu : Bool = false
    static func ToggleMenu (){
        if IsMenu{
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "HideMenu"), object: nil)
            IsMenu = false
        }
        else{
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ShowMenu"), object: nil)
            IsMenu = true
        }
    }
}
