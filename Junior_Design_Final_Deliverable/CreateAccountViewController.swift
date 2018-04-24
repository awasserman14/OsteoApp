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

    var responses : [String]?

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     * The textFields for entering user information
     *
     *
     */
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var genderField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!


    @IBAction func submitClicked(_ sender: Any) {
        
        //store the newly entered data and prepare for segue
        
        //the storing of data still needs to be setup
        
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        let managedContext = appDelegate?.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Account_Info", in: managedContext!)!
        
        let record = NSManagedObject(entity: entity, insertInto: managedContext)
        
        record.setValue(String(nameField.text!), forKeyPath: "name")
        record.setValue(String(ageField.text!), forKeyPath: "age")
        record.setValue(String(emailField.text!), forKeyPath: "email")
        record.setValue(String(genderField.text!), forKeyPath: "gender")

        do {
            try managedContext?.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }

        
        self.performSegue(withIdentifier: "AccountSubmit", sender: self)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
//        if let destination = segue.destination as?
//            MainScreenViewController {
//            
//            
//            /*
//             *In prep of segue, store the users entered account information
//             *
//             *
//             */
//            
//            
//            
//            
//            //delete these if coreData works
////            destination.name=nameField.text
////            destination.age=ageField.text
////            destination.email=emailField.text
////            destination.gender=genderField.text
////            self.performSegue(withIdentifier: "AccountSubmit", sender: self)
//        }
//    }
}
