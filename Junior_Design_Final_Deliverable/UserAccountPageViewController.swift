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
    
    @IBOutlet weak var genderField: UITextField!
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
        nameField.text! = ((records[0].value(forKeyPath: "name")! as! String) as! String)
        nameField!.text! = nameField!.text!
        genderField.text = (records[0].value(forKeyPath: "gender") as! String)
        emailField.text! = (records[0].value(forKeyPath: "email")! as! String) as! String
        ageField.text! = (records[0].value(forKeyPath: "age")! as! String) as! String
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
