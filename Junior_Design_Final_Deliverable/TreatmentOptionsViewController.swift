//
//  TreatmentOptionsViewController.swift
//  Junior_Design_Final_Deliverable
//
//  Created by Isaac Khai Ren Chua on 2/8/18.
//  Copyright © 2018 TeamHeavyw8. All rights reserved.
//

import UIKit
import CoreData

class TreatmentOptionsViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "List of Treatment Options"
        treatmentOptionsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Person")
        
        //3
        do {
            treatments = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }

//    @IBAction func addTreatment(_ sender: UIBarButtonItem) {
//        let alert = UIAlertController(title: "New Treatment", message:"Add a new treatment", preferredStyle: .alert)
//
//        let saveAction = UIAlertAction(title: "Save", style: .default) {
//            [unowned self] action in
//            guard let textField = alert.textFields?.first,
//                let treatmentNameToSave = textField.text else {
//                    return
//            }
//
//            self.save(name: treatmentNameToSave)
//            self.treatmentOptionsTableView.reloadData()
//        }
//
//        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
//
//        alert.addTextField()
//        alert.addAction(saveAction)
//        alert.addAction(cancelAction)
//
//        present(alert, animated: true)
//    }
    
    @IBOutlet weak var treatmentOptionsTableView: UITableView!
    
    var treatments:[NSManagedObject] = []

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
   
    
}

extension TreatmentOptionsViewController: UITableViewDataSource {
    func tableView(_ treatmentOptionsTableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return treatments.count
    }
    func tableView(_ treatmentOptionsTableView: UITableView,
                   cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let cell = treatmentOptionsTableView.dequeueReusableCell(withIdentifier: ("Cell"), for: indexPath)
            cell.textLabel?.text = treatments.value(forKeyPath: "name") as? String
            return cell
    }
}
