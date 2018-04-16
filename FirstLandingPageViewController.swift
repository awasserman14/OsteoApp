//
//  FirstLandingPageViewController.swift
//  Junior_Design_Final_Deliverable
//
//  Created by Aaron Wasserman on 11/20/17.
//  Copyright © 2017 TeamHeavyw8. All rights reserved.
//

import UIKit
import CoreData

class FirstLandingPageViewController: UIViewController {

    var records: [NSManagedObject] = []
    
    var currentRecord: NSManagedObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        takeSurveyButton.layer.cornerRadius = 100
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        let managedContext = appDelegate?.persistentContainer.viewContext
        
        //let entity = NSEntityDescription.entity(forEntityName: "Account_Info", in: managedContext!)!
        
        //let record = NSManagedObject(entity: entity, insertInto: managedContext)
        
        //^^ this was causing crash in main menu by inserting a blank Account_Info object into Core Data
        
        
//        records[0].setValue(nil, forKeyPath: "name")
//        records[0].setValue(nil, forKeyPath: "age")
//        records[0].setValue(nil, forKeyPath: "email")
//        records[0].setValue(nil, forKeyPath: "gender")
        
//        do {
//            try managedContext?.save()
//        } catch let error as NSError {
//            print("Could not save. \(error), \(error.userInfo)")
//        }
        
    }

        // Do any additional setup after loading the view. This is a standard comment.
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated. This is another standard comment.
    }
    

    @IBAction func takeSurveyPressed(_ sender: Any) {
    }
    
    @IBOutlet var takeSurveyButton: UIButton!
    
    @IBAction func takeItLaterPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: "Skip Survey", message: "We strongly reccomend taking the survey before continuing. Most functionality relies on survey responses.", preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: "Take Survey", style: .destructive, handler: takeSurvey)
        let cancelAction = UIAlertAction(title: "Skip Survey", style: .cancel, handler: skipSurvey)
        
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = CGRect(x:self.view.bounds.size.width / 2.0,y:self.view.bounds.size.height / 2.0, width:1.0, height: 1.0)
        
        self.present(alert, animated: true, completion: nil)

        
    }
    
    func takeSurvey(alertAction: UIAlertAction!) -> Void {
        
        print("take survey")
        
    }
    
    func skipSurvey(alertAction: UIAlertAction!) -> Void {
        
        self.performSegue(withIdentifier: "skipSurvey", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier=="skipSurvey"){
            let vc = segue.destination as? MainScreenViewController
            vc?.skipped = true
        }
    }
}
