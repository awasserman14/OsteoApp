//
//  GeneralInformationViewController.swift
//  Junior_Design_Final_Deliverable
//
//  Created by Aaron Wasserman on 3/27/18.
//  Copyright © 2018 TeamHeavyw8. All rights reserved.
//

import UIKit

class GeneralInformationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var topicPicked: String?

    @IBOutlet var infoTable: UITableView!
    
    var headers: [String] = ["Defining Osteoporosis", "Who Has Osteoporosis?", "Bone Basics", "Causes of Osteoporosis", "Risk Factors for Osteoporosis", "Diagnosing Osteoporosis", "Treating Osteoporosis", "Nutrition", "Lifestyle", "Exercise", "Fall Prevention", "Medications"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return headers.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.infoTable.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
        
        cell.textLabel!.text = headers[indexPath.row]
        

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        topicPicked = headers[indexPath.row]
        
        self.performSegue(withIdentifier: "infoClicked", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "infoClicked") {
            if let destination = segue.destination as? ReadInfoViewController {
                destination.topic = self.topicPicked!
                
            }
        }
        
    }

}
