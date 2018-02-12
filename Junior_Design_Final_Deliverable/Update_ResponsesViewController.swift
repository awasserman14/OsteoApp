//
//  Update_ResponsesViewController.swift
//  Junior_Design_Final_Deliverable
//
//  Created by Aaron Wasserman on 11/22/17.
//  Copyright © 2017 TeamHeavyw8. All rights reserved.
//

import UIKit

class Update_ResponsesViewController: UIViewController {
    
    var questionNumber: String?
    var full_questions: [String]?
    var questions: [String]?
    
    var answers: [Int]?
    
    var firstAnswer: String?
    var secondAnswer: String?
    var thirdAnswer: String?

    var question1: [String] = ["How important is protection from hip fractures", "to you when making a decision about", "osteoporosis therapies"]
    
    var question2: [String] = ["How important is protection from spinal", "fractures to you when making a decision", "about osteoporosis therapies"]
    
    var question3: [String] = ["How important is the ability to stay active", "to you when making a decision about", "osteoporosis therapies"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print(questionNumber)
        
        //these cases need to be done for all 8 questions
        numQuestionLabel.text = "Question " + questionNumber!
        question1Label.text = full_questions![Int(questionNumber!)!]
        sliderValue.value = Float(answers![Int(questionNumber!)!])/Float(10.0)
        //sliderValue.setValue(((Float(answers![Int(questionNumber!)!)]/Float(10.0))), animated: true)
        valueLabel.text = String(answers![Int(questionNumber!)!])

        


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var numQuestionLabel: UILabel!
    
    
    @IBOutlet var question1Label: UILabel!
    @IBOutlet var question2Label: UILabel!
    @IBOutlet var question3Label: UILabel!
    
    
    @IBOutlet var valueLabel: UILabel!
    
    
    @IBOutlet var sliderValue: UISlider!
    
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        
        let temp = sliderValue.value * 10
        
        let intValue: Int = Int(temp)
        
        valueLabel.text = String(intValue)
        answers![Int(questionNumber!)!] = intValue
        
    }
    
    @IBAction func updatePressed(_ sender: Any) {
        
        self.performSegue(withIdentifier: "updateCompleted", sender: self)  
        
    }
    
    @IBOutlet weak var bacToReview: UIButton!
    @IBAction func backToReview(_ sender: Any) {
        self.performSegue(withIdentifier: "goBack", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "updateCompleted") {
            
            if let destination = segue.destination as? Review_ResponsesViewController  {
                
                destination.answers = self.answers
                destination.full_questions = self.full_questions
                destination.firstAnswer = firstAnswer
                destination.secondAnswer = secondAnswer
                destination.thirdAnswer = thirdAnswer
            }
            
        }
        if (segue.identifier == "goBack") {
            if let destination = segue.destination as? Review_ResponsesViewController {
                destination.answers = self.answers
                destination.full_questions = self.full_questions
            }
        }
    }


    
}
