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
    
    
    @IBOutlet var nameField: UITextField!
    
    @IBOutlet var ageField: UITextField!
    
    @IBOutlet var genderField: UITextField!
    @IBOutlet var emailField: UITextField!
    
    // This is used to dismiss the keyboard, user just has to tap outside the
    // user name and password views and it will dismiss
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.phase == UITouchPhase.began {
                view.endEditing(true)
            }
        }
        
        super.touchesBegan(touches , with:event)
    }

    
    var records: [NSManagedObject] = []
    
    var currentRecord: NSManagedObject?
    
    

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
        
        /*
         *This section is loading the users account information from the coredata
         *in order to display it in the textFields
         *
         **/
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        let managedContext = appDelegate!.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Account_Info")
        
        do {
            records = try managedContext.fetch(fetchRequest)
            print(records)
        } catch let error as NSError {
            print("could not fetch")
        }
        print("records.count")
        print(records.count)
        
        if (records.count != 0) {
            currentRecord = records[0]

            print(currentRecord)

            let name = currentRecord?.value(forKeyPath: "name") as! String
            
            //nameField!.text! = nameField!.text!
            let gender = currentRecord?.value(forKeyPath: "gender") as! String
            let email = currentRecord?.value(forKeyPath: "email") as! String
            let age = currentRecord?.value(forKeyPath: "age") as! String
           
            
            nameField.text = name;
            emailField.text = email
            genderField.text = gender;
            ageField.text = age


        }
        
        
        
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
        
        /*
         * This section stores changes made to account info into the coredata table
         *
         *
         *
         */
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        let managedContext = appDelegate?.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Account_Info", in: managedContext!)!
        
        let record = NSManagedObject(entity: entity, insertInto: managedContext)
        
        records[0].setValue(String(describing: nameField.text!), forKeyPath: "name")
        records[0].setValue(String(describing: ageField.text!), forKeyPath: "age")
        records[0].setValue(String(describing: emailField.text!), forKeyPath: "email")
        records[0].setValue(String(describing: genderField.text!), forKeyPath: "gender")
        
        do {
            try managedContext?.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        self.performSegue(withIdentifier: "submitClicked", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*
         * segue will be based on submit button click
         *
         */
      
    }

}
