//
//  CreateAccountViewController.swift
//  Junior_Design_Final_Deliverable
//
//  Created by Austin Duncan on 2/12/18.
//  Copyright © 2018 TeamHeavyw8. All rights reserved.
//

import UIKit
import CoreData

class CreateAccountViewController: UIViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var genderField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var ageField: UITextField!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func submitClicked(_ sender: Any) {
        
        //store the newly entered data and prepare for segue
        
        //the storing of data still needs to be setup
        
        self.performSegue(withIdentifier: "AccountSubmit", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        if let destination = segue.destination as?
            MainScreenViewController {
            
            
            
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            
            let managedContext = appDelegate?.persistentContainer.viewContext
            
            let entity = NSEntityDescription.entity(forEntityName: "Account_Info", in: managedContext!)!
            
            let record = NSManagedObject(entity: entity, insertInto: managedContext)
            

            
            
            record.setValue(String(describing: nameField.text!), forKeyPath: "name")
            record.setValue(String(describing: ageField.text!), forKeyPath: "age")
            record.setValue(String(describing: emailField.text!), forKeyPath: "email")
            record.setValue(String(describing: genderField.text!), forKeyPath: "gender")
            
            do {
                try managedContext?.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
            
            //delete these if coreData works
            destination.name=nameField.text
            destination.age=ageField.text
            destination.email=emailField.text
            destination.gender=genderField.text
            self.performSegue(withIdentifier: "AccountSubmit", sender: self)
        }
    }
}
