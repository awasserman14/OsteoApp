//
//  DetailOptionViewController.swift
//  Junior_Design_Final_Deliverable
//
//  Created by Daham Eom on 2018. 2. 14..
//  Copyright © 2018년 TeamHeavyw8. All rights reserved.
//

import UIKit

class DetailOptionViewController: UIViewController {
    
    @IBOutlet weak var treatment: UILabel!
    @IBOutlet weak var info: UILabel!
    //var mostOne: [String]?
    var others: [String]?
    var mostOne: [String]?
    var treatName: String?
    var taken = true
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        treatment.text = treatName
        info.text = "This is detail information of " + treatName! + " treatment."
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*@IBOutlet weak var goBack: UIButton!
    @IBAction func goBack(_ sender: Any) {
        self.performSegue(withIdentifier: "goBack", sender: self)
    } */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "backToTreat") {
            let navVC = segue.destination as? UINavigationController
            
            let vc = navVC?.viewControllers.first as! TreatmentOptionsViewController
            
            vc.taken = self.taken
        }
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
