//
//  ViewSurveyRecordViewController.swift
//  Junior_Design_Final_Deliverable
//
//  Created by Aaron Wasserman on 11/26/17.
//  Copyright © 2017 TeamHeavyw8. All rights reserved.
//

import UIKit
import MessageUI

class ViewSurveyRecordViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate {
    
    var firstAnswer: String?
    var secondAnswer: String?
    var thirdAnswer: String?
    var fourthAnswer: String?
    var fifthAnswer: String?
    var sixthAnswer: String?
    var seventhAnswer: String?
    var eighthAnswer: String?
    var surveyDateTime: String?
    
    var results: [String] = []
    

    @IBOutlet var resultsTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 12;
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.resultsTable.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath)
        
        cell.textLabel!.text = results[indexPath.row]
        
        
        return cell
        
    }
    
    @IBAction func sharePressed(_ sender: Any) {
        
        let mailComposeViewController = configureMailController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        }
        
    }
    
    func configureMailController() -> MFMailComposeViewController {
        
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setSubject("My PDAssist Results")
        mailComposerVC.setMessageBody("A PDAssist user would like to share their survey results and treatment recommendations with you. \n \n Survey was taken on \(surveyDateTime) \n \n Survey Responses (1-10 scale): \n \(firstAnswer!) \n \(secondAnswer!) \n \(thirdAnswer!) \n \(fourthAnswer!) \n \(fifthAnswer!) \n \(sixthAnswer!) \n \(seventhAnswer!) \n \(eighthAnswer!) \n \n Recommended Treatments: \n 1. Boniva Prescription \n 2.Reclast Infusion \n 3. Kyphoplasty Surgery " , isHTML: false)
        return mailComposerVC
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        results.append(surveyDateTime!)
        results.append(firstAnswer!)
        results.append(secondAnswer!)
        results.append(thirdAnswer!)
        results.append(fourthAnswer!)
        results.append(fifthAnswer!)
        results.append(sixthAnswer!)
        results.append(seventhAnswer!)
        results.append(eighthAnswer!)
        results.append("Boniva Prescription")
        results.append("Reclast Infusion")
        results.append("Kyphoplasty Surgery")
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
}
