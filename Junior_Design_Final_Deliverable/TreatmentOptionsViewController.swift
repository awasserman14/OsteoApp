//
//  TreatmentOptionsViewController.swift
//  Junior_Design_Final_Deliverable
//
//  Created by Daham Eom on 2018. 2. 13..
//  Copyright © 2018년 TeamHeavyw8. All rights reserved.
//

import UIKit
import CoreData

class TreatmentOptionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var taken = false
    var mostOne: [String] = ["Boniva prescription"]
    var treatmentList: [String] = ["Reclast Infusion", "Kyphoplasty Surgery"]
    //var mostOne = [String]()
    var treatment: String?
    @IBOutlet weak var mostOneTable: UITableView!
    @IBOutlet weak var restTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //setList()
        //splitList()
        if !self.taken {
            mostOne = []
            treatmentList = []
        }
        
        mostOneTable.dataSource = self
        mostOneTable.delegate = self
        mostOneTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        restTable.dataSource = self
        restTable.delegate = self
        restTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell1")
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int?
        
        if tableView == self.mostOneTable {
            count = 1
        }
        
        if tableView == self.restTable {
            count = treatmentList.count
        }
        
        return count!
    }

    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->  UITableViewCell {
        
//        if tableView == self.mostOneTable {
//            cell = self.mostOneTable.dequeueReusableCell(withIdentifier: "mostOne", for: IndexPath)
//            cell.textLabel!.text = mostOne[0]
//        }
        var cell:UITableViewCell?
        
        if tableView == self.restTable {
            cell = self.restTable.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
            if taken {
                cell!.textLabel!.text = treatmentList[indexPath.row]
            }
        }
        if tableView == self.mostOneTable {
            cell = self.mostOneTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            if taken {
                cell!.textLabel!.text = mostOne[0]
            }
        }
        //let cell = self.cellTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.taken {
            if tableView == self.mostOneTable {
                tableView.deselectRow(at: indexPath, animated: true)
                treatment = mostOne[0]
                performSegue(withIdentifier: "moveToDetail", sender: self)
            }
            if tableView == self.restTable {
                tableView.deselectRow(at: indexPath, animated: true)
                treatment = treatmentList[indexPath.row]
                performSegue(withIdentifier: "moveToDetail", sender: self)
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "moveToDetail") {
            if let destination = segue.destination as? DetailOptionViewController {
                //destination.mostOne = self.mostOne
                destination.others = self.treatmentList
                destination.treatName = self.treatment
                destination.mostOne = self.mostOne
                destination.taken = self.taken
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // Assign treatment options from result view controller to treatmentList
//    func setList() {
//        let temp = ResultsViewController()
//        treatmentList = temp.results
//
//        // Remove "#. " string from each element
//        for index in (treatmentList?.indices)! {
//            var tempStr = treatmentList![index]
//            let ind = tempStr.index(tempStr.startIndex, offsetBy: 3)
//            tempStr = tempStr.substring(from: ind)
//            treatmentList![index] = tempStr
//        }
//    }
//
    /*
    // Set the most recommended treatment option and remove it from original list
    func splitList() {
        mostOne = [treatmentList[0]]
        let i = treatmentList.index(of: mostOne[0])
        treatmentList.remove(at: i!)
    }*/

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
