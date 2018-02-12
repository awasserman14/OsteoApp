//
//  UserAccountPageViewController.swift
//  Junior_Design_Final_Deliverable
//
//  Created by Austin Duncan on 2/8/18.
//  Copyright © 2018 TeamHeavyw8. All rights reserved.
//

import UIKit
import CoreData

class UserAccountPageViewController: UIViewController {
    
    var records: [NSManagedObject] = []
    
    var currentRecord: NSManagedObject?
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var nameField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        /**here, the user's information
         *will need to be loaded from the
         *db/passed in through array.
         *
         * If the user has data in the DB,
         * do not display the generic name,etc
         *
         *The Outlets are above.*/
        
        
        // Do any additional setup after loading the view.
        
//        let myDelegate = UIApplication.shared.delegate as? AppDelegate
//
//        let managedContext = myDelegate!.persistentContainer.viewContext
//
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserAccount")
//
//        do {
//            records = try managedContext.fetch(fetchRequest)
//            print(records)
//        } catch let error as NSError {
//            print("could not fetch")
//        }
//        nameField!.text=(records[0].value(forKey: "name") as! String)
//        emailField!.text=(records[0].value(forKey: "email") as! String)
//        ageField!.text=((records[0].value(forKey: "age")) as! String)
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitClicked(_ sender: Any) {
        /*Before segue, validate the user
        * wants to store changes, and then
        * update the DB.
        * this is the function for the submit clicked button.
        * after storage, segue back to the main menu
        */
        
//        let currentDateTime = Date()
//        let formatter = DateFormatter()
//        formatter.timeStyle = .short
//        formatter.dateStyle = .short
//        
//        let dateTime = formatter.string(from: currentDateTime)
//        
//        print(dateTime)
//        
//        // this is where we want to save to Core Data
//        
//        let appDelegate = UIApplication.shared.delegate as? AppDelegate
//        
//        let managedContext = appDelegate?.persistentContainer.viewContext
//        
//        let entity = NSEntityDescription.entity(forEntityName: "UserAccount", in: managedContext!)!
//        
//        let record = NSManagedObject(entity: entity, insertInto: managedContext)
//        
//        record.setValue(nameField!.text, forKeyPath: "name")
//        record.setValue(emailField!.text, forKey: "email")
//        record.setValue(ageField!.text, forKey: "age")
//        
//        record.setValue(dateTime, forKeyPath: "dateTime")
//        
//        do {
//            try managedContext?.save()
//        } catch let error as NSError {
//            print("Could not save. \(error), \(error.userInfo)")
//        }
        self.performSegue(withIdentifier: "submitClicked", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*
         * segue will be based on submit button click
         *
         */
      
    }

}
