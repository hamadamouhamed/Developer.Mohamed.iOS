//
//  MainViewController.swift
//  CalCulator With My Hand
//
//  Created by Hamada Mouhamed on 1/4/18.
//  Copyright © 2018 Hamada Mouhamed. All rights reserved.
//

import UIKit
class MainViewController : UIViewController{
    
    @IBAction func SideMenuButton(_ sender: UIButton) {
        RadioClass.ToggleMenu()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{return.lightContent}
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBAction func ButtonsAction(_ sender: UIButton) {
        if MyLabel.text == "0"{MyLabel.text = ""}
        if sender.tag == -1{ if !MyLabel.text!.contains("."){ MyLabel.text = MyLabel.text! + "."}
        } else{ MyLabel.text = MyLabel.text! + String(sender.tag)}
    }
    
    @IBOutlet weak var MyLabel: UILabel!
        let Brain :BrainCalculator = BrainCalculator()
    
    
    @IBAction func ButtonsOperation(_ sender: UIButton) {
        Brain.Add(Number: Double(MyLabel.text!)!, With: Character(sender.titleLabel!.text!))
        if sender.titleLabel!.text! == "="{
            MyLabel.text = Brain.Result()
            Brain.Restart()
        }else { MyLabel.text = "0" }
        
    }
    
    
    @IBAction func AcButton(_ sender: UIButton) {
        MyLabel.text = "0"
        Brain.Restart()
        
    }
    
    @IBAction func PlusMinusButton(_ sender: UIButton) {
        MyLabel.text = String(Double(MyLabel.text!)! * -1)
    }
    
    @IBAction func HundredPercentage(_ sender: UIButton) {
        MyLabel.text = String(Double(MyLabel.text!)! / 100)
    }
    
    
}
