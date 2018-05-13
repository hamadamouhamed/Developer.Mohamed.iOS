//
//  ViewController.swift
//  TimerApplication
//
//  Created by Hamada Mouhamed on 1/22/18.
//  Copyright © 2018 Hamada Mouhamed. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = Name[indexPath.row]
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Tasks")
        do{
            let results = try Context.fetch(request)
            taskMO = results as! [NSManagedObject]
            for taskmo  in taskMO{
                Name.append(taskmo.value(forKey: "name") as! String)
            }
        }
        catch
        {
            print("Error")
        }
        
    }
    
   
    @IBOutlet weak var MyStartConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var MyTableViewConstraints: NSLayoutConstraint!
    @IBOutlet weak var TimerLabel: UILabel!
    @IBOutlet weak var MyTableView: UITableView!
    @IBOutlet weak var PauseOutlet: MyCustomButton!
    @IBOutlet weak var MyTableViewView: UIView!
    @IBOutlet weak var MyView: UIView!
    @IBAction func MyTouchButton(_ sender: Any) {
        MyTableViewConstraints.constant = 0
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    var timer:Timer?
    var NameTF : UITextField?
    var Seconds = 0
    var Name = [String]()
    var taskMO = [NSManagedObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        MyView.layer.cornerRadius = 20
        MyTableView.delegate=self
        MyTableView.dataSource=self
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        MyTableViewConstraints.constant = 360
        UIView.animate(withDuration: 0.1) {
            self.view.layoutIfNeeded()
        }
        MyStartConstraints.constant = -360
        UIView.animate(withDuration: 0.1) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    @IBAction func StartButtonAction(_ sender: Any) {
        MyStartConstraints.constant=0
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        RunTimer()
    }
        func TimeString(time:TimeInterval) -> String{
            let Hourse = Int(time)/3600
            let Miniuts = Int(time)/60 % 60
            let Seconds = Int(time) % 60
            return String(format: "%02i:%02i:%02i" , Hourse,Miniuts,Seconds)
        }
    @objc func UpdateTime(){
            Seconds+=1
            TimerLabel.text = TimeString(time: (TimeInterval(Seconds)))
        }
        func RunTimer(){
            timer=Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.UpdateTime), userInfo: nil, repeats: true)
        }
    func AlertController(){
        let alertControl = UIAlertController(title: "Write Your Task", message: "Enter Your Task Name", preferredStyle: .alert)
        alertControl.addTextField { (NameTF) in
            NameTF.placeholder = "Name"
            self.NameTF = NameTF
       
        let alertActio = UIAlertAction(title: "Cancel", style: .default, handler: nil)
           
            let alertActio2 = UIAlertAction(title: "Save", style: .default, handler: { (action) in
                self.SaveDataToCoreData()
            })
            alertControl.addAction(alertActio)
            alertControl.addAction(alertActio2)
            self.present(alertControl, animated: true, completion: nil)
    }}
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
       return UITableViewCellEditingStyle.delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            Context.delete(taskMO[indexPath.row])
            do{ try Context.save()
                self.Name.remove(at: indexPath.row)
                MyTableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
                
                
                
            }catch{
                
            }
        }
    }
    func SaveDataToCoreData(){
        let entity = NSEntityDescription.entity(forEntityName: "Tasks", in: Context)
        let task = NSManagedObject(entity: entity!, insertInto: Context)
        task.setValue(NameTF!.text, forKey: "name")
        do{ try Context.save()
            let alertCont = UIAlertController(title: "Saved", message: "Your \(NameTF!.text!) has been saved", preferredStyle: .alert)
            let alertAct = UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                self.MyTableViewConstraints.constant = 0
                UIView.animate(withDuration: 0.3, animations: {
                    self.view.layoutIfNeeded()
                })
            })
            alertCont.addAction(alertAct)
            self.present(alertCont, animated: true, completion: nil)
        }
        catch{
            let alertCoN = UIAlertController(title: "Error", message: "\(NameTF!.text!) hasn't Saved", preferredStyle: .alert)
            let alertAcT = UIAlertAction(title: "Skip", style: .default, handler: nil)
            alertCoN.addAction(alertAcT)
            self.present(alertCoN, animated: true, completion: nil)
        }
    }
    @IBAction func PauseButton(_ sender: Any) {
        if PauseOutlet.titleLabel?.text == "Pause" {
            timer?.invalidate()
            PauseOutlet.setTitle("Start", for: .normal)
        }else if PauseOutlet.titleLabel?.text == "Start"{
            RunTimer()
            PauseOutlet.setTitle("Pause", for: .normal)
        }
    }
    @IBAction func StopButton(_ sender: Any) {
        timer?.invalidate()
        Seconds = 0
        TimerLabel.text = TimeString(time: (TimeInterval(Seconds)))
        PauseOutlet.setTitle("Start", for: .normal)
        AlertController()
    }
}
