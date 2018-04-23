//
//  SelfEfficacySurveyViewController.swift
//  Junior_Design_Final_Deliverable
//
//  Created by Aaron Wasserman on 4/17/18.
//  Copyright © 2018 TeamHeavyw8. All rights reserved.
//

import UIKit

class SelfEfficacySurveyViewController: UIViewController {
    
    var questions: [String] = []
    
    var questionNum: Int?
    
    @IBOutlet var questionLabel: UILabel!
    
    
    @IBOutlet var valueLabel: UILabel!
    
    @IBOutlet var progressView: UIProgressView!
    
    
    @IBOutlet var valueSlider: UISlider!
    
    
    @IBAction func continuePressed(_ sender: Any) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        questions[0] = "get the facts about the medication choices available to me."
        questions[1] = "get the facts abou the benefit of each choice"
        questions[2] = "get the facts about the risks and side effects of each choice"
        questions[3] = "understand the information enough to be able to make a choice"
        questions[4] = "ask questions without feeling dumb"
        questions[5] = "express my concerns about each choice"
        questions[6] = "ask for advice"
        questions[7] = "figure out the choice that best suits me"
        questions[8] = "hand unwanted pressure from others in making my choice"
        questions[9] = "let the clinic team know what's best for me"
        questions[10] = "delay my decision if I feel I need more time"
        
        questionNum = 0;
        
        questionLabel.text = "I feel confident I can " + questions[questionNum!]
        

    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
