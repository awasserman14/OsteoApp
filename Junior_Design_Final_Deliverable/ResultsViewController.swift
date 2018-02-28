//
//  ResultsViewController.swift
//  Junior_Design_Final_Deliverable
//
//  Created by Aaron Wasserman on 11/22/17.
//  Copyright © 2017 TeamHeavyw8. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var resultsTable: UITableView!
    
    var results: [String] = ["1. Boniva prescription", "2. Reclast Infusion", "3. Kyphoplasty Surgery"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.resultsTable.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath)
        
        cell.textLabel!.text = results[indexPath.row]
        
        return cell
    }

    
}
