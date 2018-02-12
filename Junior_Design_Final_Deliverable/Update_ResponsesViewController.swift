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

        
//        if (questionNumber! == "1") {
//            numQuestionLabel.text = "Question 1"
//
//            question1Label.text = question1[0]
//            question2Label.text = question1[1]
//            question3Label.text = question1[2]
//
//            valueLabel.text = String(answers![1])
//
//            sliderValue.setValue((Float(answers![1])/10), animated: true)
//
//        } else if (questionNumber! == "2") {
//            numQuestionLabel.text = "Question 2"
//
//            question1Label.text = question2[0]
//            question2Label.text = question2[1]
//            question3Label.text = question2[2]
//
//            valueLabel.text = String(answers![2])
//
//            sliderValue.setValue((Float(answers![2])/10), animated: true)
//
//
//        } else if (questionNumber! == "3") {
//            numQuestionLabel.text = "Question 3"
//
//            question1Label.text = question3[0]
//            question2Label.text = question3[1]
//            question3Label.text = question3[2]
//
//            valueLabel.text = String(answers![3])
//
//            sliderValue.setValue((Float(answers![3])/10), animated: true)
//
//        }

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
        
//        if (questionNumber! == "1") {
//            answers![1] = intValue
//        } else if (questionNumber! == "2") {
//            answers![2] = intValue
//        } else if (questionNumber! == "3") {
//            answers![3] = intValue
//        }
        
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
