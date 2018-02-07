//
//  Review_ResponsesViewController.swift
//  Junior_Design_Final_Deliverable
//
//  Created by Aaron Wasserman on 11/20/17.
//  Copyright © 2017 TeamHeavyw8. All rights reserved.
//

import UIKit
import CoreData

class Review_ResponsesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var firstAnswer: String?
    var secondAnswer: String?
    var thirdAnswer: String?
    var questionSelected: String?
    
    //array containing all of the questions
    var full_questions: [String]?
    
    //array containing keywords for each question
    var questions : [String] = ["1. Hip Fracture importance: ", "2. Spinal Fracture importance: ", "3. Activity importance: ", "4. Other Positive Factors: ", "5. Risk of breast cancer importance: ", "6. Risk of blood clots importance: ", "7. Risk of gastro-intestinal side-effects: ", "8. Other Negative Factors: "]
    
    //array of the inputted answers by the user
    var answers : [Int]?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var responseTable: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 8
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.responseTable.dequeueReusableCell(withIdentifier: "responseCell", for: indexPath)
        
        
        cell.textLabel!.text = questions[indexPath.row] + String(answers![indexPath.row + 1])
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        questionSelected = String(indexPath.row + 1)
        self.performSegue(withIdentifier: "goUpdateResponse", sender: self) 
                
    }
    
    @IBAction func backToQuestions(_ sender: Any) {
        //submitPressed(self)
        performSegue(withIdentifier: "backToLastQuestion", sender: self)
    }
    
    @IBAction func submitPressed(_ sender: Any) {
        
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        
        let dateTime = formatter.string(from: currentDateTime)
        
        print(dateTime)
        
        // this is where we want to save to Core Data
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        let managedContext = appDelegate?.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Survey_Record", in: managedContext!)!
        
        let record = NSManagedObject(entity: entity, insertInto: managedContext)
        
        //this needs to be done for all 8 questions
        record.setValue(String(answers![1]), forKeyPath: "firstQuestion")
        record.setValue(String(answers![2]), forKeyPath: "secondQuestion")
        record.setValue(String(answers![3]), forKeyPath: "thirdQuestion")
        record.setValue(String(answers![4]), forKeyPath: "fourthQuestion")
        record.setValue(String(answers![5]), forKeyPath: "fifthQuestion")
        record.setValue(String(answers![6]), forKeyPath: "sixthQuestion")
        record.setValue(String(answers![7]), forKeyPath: "seventhQuestion")
        record.setValue(String(answers![8]), forKeyPath: "eighthQuestion")

        record.setValue(dateTime, forKeyPath: "dateTime")
        
        do {
            try managedContext?.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        self.performSegue(withIdentifier: "submitPressed", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "goUpdateResponse") {
            
            if let destination = segue.destination as? Update_ResponsesViewController {
                
                //problem passing back from here; a lot of things are nil so I need to update
                
                //pass full questions?
                destination.full_questions = self.full_questions
                destination.questions = self.questions
                destination.questionNumber = questionSelected
                //passing full array of answers
                destination.answers = self.answers
                destination.firstAnswer = firstAnswer
                destination.secondAnswer = secondAnswer
                destination.thirdAnswer = thirdAnswer
            }
            
        }
        
        if (segue.identifier == "backToLastQuestion") {
            if let destination = segue.destination as? First_SurveyViewController {
                destination.answers = self.answers!
                destination.questions = self.full_questions!
                destination.question_number = 8
                //destination.sliderValue.value = Float(answers![8])/Float(10.0)
                //destination.valueLabel.text = String(answers![8])
                //destination.progressLabel.text = "8/8"
            }
        }
    }


    
}
