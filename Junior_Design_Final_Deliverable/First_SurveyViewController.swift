//
//  First_SurveyViewController.swift
//  Junior_Design_Final_Deliverable
//
//  Created by Aaron Wasserman on 11/20/17.
//  Copyright © 2017 TeamHeavyw8. All rights reserved.
//

import UIKit

class First_SurveyViewController: UIViewController {
    
    //this is the array of questions to be asked
    var questions = Array<String>(repeating:" ", count:11)
    
    //this is the array of user submitted answers to questions; an integer 0-10
    var answers = Array<Int>(repeating:5, count:9)
    
    //this is the progress bar that is represented at the top of the pages
    @IBOutlet weak var progressBar: UIProgressView!
    
    var question_number : (Int)?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*Here, Load the array of questions with
         all questions that will be asked in the survey*/
        questions[1] = "How important is protection from hip fractures to you when making a decision about osteoporosis therapies?"
        questions[2] = "How important is protection from spinal fractures to you when making a decision about osteoporosis therapies?"
        questions[3] = "How important is the ability to stay active to you when making a decision about osteoporosis therapies?"
        questions[4] = "What other positive factors are inportant to you when making a decision about osteoporosis therapies?"
        questions[5] = "How important is the risk of breast cancer to you when making a decision about osteoporosis therapies?"
        questions[6] = "How important is the risk of blood clots to you when making a decision about osteoporosis therapies?"
        questions[7] = "How important is the risk of gastro-intestinal side effects (such as ulcer) to you when making a decision about osteoporosis therapies?"
        questions[8] = "What other negative factors are important to you when making a decision about osteoporosis therapies? (Please specify and negative factors you have considered and rate their importance to you)"
        
        if question_number == 0 || question_number==nil {
            question_number = 1
        }
        
        //load the initial question onto the screen
        questionLabel.text = questions[question_number!]
        
        //populate the percentage complete upto
        //and including the current question
        progressLabel.text = String(describing: Int(question_number!)) + "/8"
        
        //load the new progress bar image
        progressBar.progress = Float(question_number!)/8.0
        
        sliderValue.value = Float(answers[question_number!])/10.0
        valueLabel.text = String(answers[question_number!])
    }
    var stringValue: String = "5"

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //this is the label that will contain the survey questions
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet var sliderValue: UISlider!
   
    @IBOutlet var valueLabel: UILabel!
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        
        let temp = sliderValue.value * 10
        let intValue: Int = Int(temp)
        stringValue = String(intValue)
        valueLabel.text = String(intValue)
        
    }
    
    
    func updateQuestion(q_num:Int, direction:Int) {
        /*
         *  This function updates the questions when moving forward and back
         *  Direction is a bool flag: 0 go back, 1 go next
         */
        
        
        //passed from continuePressed
        if (direction == 1) {
            questionLabel.text = questions[q_num]
            progressLabel.text = String(Int(q_num)) + "/8"
            progressBar.progress = Float(q_num)/Float(8.0)
            
            valueLabel.text = String(answers[q_num])
            sliderValue.value = Float(answers[q_num])/Float(10.0)
        } else {
            //passed from backQuestion
            if (question_number != 1) {
                questionLabel.text = questions[q_num - 1]
                progressLabel.text = String(Int(q_num - 1)) + "/8"
                progressBar.progress = Float(q_num - 1)/Float(8.0)
                //answers[q_num] = Int(sliderValue.value*10)!
                valueLabel.text = String(answers[q_num - 1])
                sliderValue.value = Float(answers[q_num - 1])/Float(10.0)
                question_number!-=1
            } else {
                self.performSegue(withIdentifier: "backToSplash", sender: self)
            }
        }
    }
    
    
    
    @IBAction func continuePressed(_ sender: Any) {
        
        //the function handles when the first question is completed and the user clicks continue
        
        //shown all questions so segue
        question_number!+=1
        if question_number == 9 {
            answers[question_number!-1] = Int(sliderValue.value*10)
            self.performSegue(withIdentifier: "goToResults", sender: self)
        } else {
            answers[question_number!-1] = Int(sliderValue.value*10)
            updateQuestion(q_num: question_number!, direction: 1)
        }
    }
    
    @IBAction func backQuestion(_ sender: Any) {
        /*
         *  This function updates questions when moving backwards (back is clicked)
         *
         *
         */
        //problem is sliderValue.value*10?
        answers[question_number!] = Int(sliderValue.value*10)
        updateQuestion(q_num: question_number!, direction: 0)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "goToResults" && question_number == 9) {
            question_number = 1
            if let destination = segue.destination as? Review_ResponsesViewController {
                destination.full_questions = self.questions
                destination.answers = self.answers
            }
            
        }
        //case where went page 2-1, dont segue
        if (segue.identifier == "backToSplash" && question_number==1) {
            _ = segue.destination as? FirstLandingPageViewController
        }
    }

    

}
