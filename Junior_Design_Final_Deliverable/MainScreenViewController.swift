//
//  MainScreenViewController.swift
//  Junior_Design_Final_Deliverable
//
//  Created by Austin Duncan on 2/12/18.
//  Copyright © 2018 TeamHeavyw8. All rights reserved.
//

import UIKit
import CoreData

class MainScreenViewController: UIViewController {
    
    //var hasDisplayedWarning: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        
    }
    
    //we need a better method of tracking this
    //right now, if they opt out of making an account this will keep appearing
    var name :String?=nil
    var email : String?=nil
    var age : String?=nil
    var gender : String?=nil
    
    var records: [NSManagedObject] = []
    
    var currentRecord: NSManagedObject?
    
    override func viewDidAppear(_ animated: Bool) {
        
        /*
         * Here I load the record and if there is user data stored do not display the alert
         * for making an account.
         * However, if there is no record display the alert EVERY time this page loads.
         * This worries me.
         *
         */
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        let managedContext = appDelegate!.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Account_Info")
        
        do {
            records = try managedContext.fetch(fetchRequest)
            //print(records[0])
        } catch let error as NSError {
            print("could not fetch")
        }
        if records.count != 0 {
            print("records.count != 0")
            //            name = records[0].value(forKeyPath: "name") as! String
            //            gender = records[0].value(forKeyPath: "gender") as! String
            //            email = records[0].value(forKeyPath: "email") as! String
            //            age = records[0].value(forKeyPath: "age") as! String
        } else {
            print("records.count =0")
            
            if (appDelegate?.hasDisplayedWarning == false) {
                appDelegate?.hasDisplayedWarning = true
                let alert = UIAlertController(title: "Create Account", message: "Looks like you haven't made an account yet. Would you like to make an account?", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Cancel"), style: .`default`, handler: { _ in
                    NSLog("The \"Cancel\" alert occured.")
                }))
                alert.addAction(UIAlertAction(title: NSLocalizedString("Make Account", comment: "Make Account"), style: .`default`, handler: { action in self.performSegue(withIdentifier: "CreateAccount", sender: self)
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
