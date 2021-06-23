//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Antarcticaman on 12/5/2564 BE.
//

import UIKit

class ResultViewController: UIViewController {

    var responses: [Answer]
    init?(coder:NSCoder, response: [Answer]) {
        self.responses = response
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @IBOutlet var resultAnswerLabel: UILabel!
    
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
       
    }
    

    func calculatePersonalityResult() {
        let frequencyOfAnswers = responses.reduce(into: [:]) {
            (counts, answer) in counts[answer.type, default: 0] += 1
        }
        
//        let frequentAnswersSorted =  frequencyOfAnswers.sorted(by: {(pair1, pair2) in
//            return pair1.value > pair2.value
//        })
//
//        let mostCommonAnswer = frequencyOfAnswers.first!.key
        
        // or we can use
         let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        
        resultAnswerLabel.text = "You are\(mostCommonAnswer.rawValue)"
        resultDefinitionLabel.text = mostCommonAnswer.definition
        print(responses)
        
    }
  


}
