//
//  SurveyHistoryViewController.swift
//  Junior_Design_Final_Deliverable
//
//  Created by Aaron Wasserman on 11/26/17.
//  Copyright © 2017 TeamHeavyw8. All rights reserved.
//

import UIKit
import CoreData

class SurveyHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var records: [NSManagedObject] = []
    
    var currentRecord: NSManagedObject?
    
    var firstAnswer: String?
    var secondAnswer: String?
    var thirdAnswer: String?
    var fourthAnswer: String?
    var fifthAnswer: String?
    var sixthAnswer: String?
    var seventhAnswer: String?
    var eighthAnswer: String?
    var surveyDateTime: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        let managedContext = appDelegate!.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Survey_Record")
        
        do {
            records = try managedContext.fetch(fetchRequest)
            print(records)
        } catch let error as NSError {
            print("could not fetch")
        }


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var surveyTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return records.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.surveyTable.dequeueReusableCell(withIdentifier: "surveyCell", for: indexPath)
        
        // getting records from core Data
        
        
        print(records.count)
        
        let currentRecord = records[indexPath.row]
        
        cell.textLabel!.text = "Survey Date: " + (currentRecord.value(forKeyPath: "dateTime") as! String?)!
        
        //cell.textLabel!.text = results[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        

        currentRecord = records[indexPath.row]
        firstAnswer = currentRecord?.value(forKeyPath: "firstQuestion") as! String?
        secondAnswer = currentRecord?.value(forKeyPath: "secondQuestion") as! String?
        thirdAnswer = currentRecord?.value(forKeyPath: "thirdQuestion") as! String?
        fourthAnswer = currentRecord?.value(forKeyPath: "fourthQuestion") as! String?
        fifthAnswer = currentRecord?.value(forKeyPath: "fifthQuestion") as! String?
        sixthAnswer = currentRecord?.value(forKeyPath: "sixthQuestion") as! String?
        seventhAnswer = currentRecord?.value(forKeyPath: "seventhQuestion") as! String?
        eighthAnswer = currentRecord?.value(forKeyPath: "eighthQuestion") as! String?
        surveyDateTime = currentRecord?.value(forKeyPath: "dateTime") as! String?
        
        
        self.performSegue(withIdentifier: "surveyRecordClicked", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "surveyRecordClicked") {
            
            if let destination = segue.destination as? ViewSurveyRecordViewController {
                
                destination.firstAnswer = "Hip Fracture Importance: " + firstAnswer!
                destination.secondAnswer = "Spinal Fracture Importance: " + secondAnswer!
                destination.thirdAnswer = "Staying Active Importance: " + thirdAnswer!
                destination.fourthAnswer = "Pain Reduction Importance: " + fourthAnswer!
                destination.fifthAnswer = "Breast Cancer Risk Importance: " + fifthAnswer!
                destination.sixthAnswer = "Blood Clot Risk Importance: " + sixthAnswer!
                destination.seventhAnswer = "Ulcer Risk Importance: " + seventhAnswer!
                destination.eighthAnswer = "Medication Risk Importance: " + eighthAnswer!
                
                destination.surveyDateTime = surveyDateTime
            }
            
        }
        
    }


    
}
