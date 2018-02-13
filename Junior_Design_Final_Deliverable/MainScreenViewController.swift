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
        
        //This needs an if clause
        //Only run this if the user does not have an account!
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        let managedContext = appDelegate!.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Account_Info")
        
        do {
            records = try managedContext.fetch(fetchRequest)
            print(records)
        } catch let error as NSError {
            print("could not fetch")
        }
        if records.count != 0 {
            name = records[0].value(forKeyPath: "name") as! String
            gender = records[0].value(forKeyPath: "gender") as! String
            email = records[0].value(forKeyPath: "email") as! String
            age = records[0].value(forKeyPath: "age") as! String
        }
        
        if name == nil{
            let alert = UIAlertController(title: "Create Account", message: "Would you like to make an account?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Cancel"), style: .`default`, handler: { _ in
                NSLog("The \"Cancel\" alert occured.")
            }))
            alert.addAction(UIAlertAction(title: NSLocalizedString("Make Account", comment: "Make Account"), style: .`default`, handler: { action in self.performSegue(withIdentifier: "CreateAccount", sender: self)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
