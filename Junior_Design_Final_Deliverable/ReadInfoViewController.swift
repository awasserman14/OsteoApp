//
//  ReadInfoViewController.swift
//  Junior_Design_Final_Deliverable
//
//  Created by Aaron Wasserman on 3/27/18.
//  Copyright © 2018 TeamHeavyw8. All rights reserved.
//

import UIKit

class ReadInfoViewController: UIViewController {
    
    var topic: String?
    
    @IBOutlet var headerLabel: UILabel!
    
    @IBOutlet var textField: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        headerLabel.text = topic
        
        let fileURLProject = Bundle.main.path(forResource: topic, ofType: "txt")
        var readStringProject = ""
        do {
            readStringProject = try String(contentsOfFile: fileURLProject!, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("failed to read from file")
            print(error)
        }
        textField.text = readStringProject
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
