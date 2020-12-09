//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by SLYTH on 19/11/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation
 
struct QuizBrain {
    
     var questionNumber = 0
     var score = 0
    
    let quiz = [
        Question(text: "Apakah Pertanyaan ini Adalah False?", answer: "False"),
        Question(text: "Apakah Nashwa akan Menjadi Jodoh Nabil?",answer: "True"),
        Question(text: "Apakah Nabil Taun Depan Dapet Jodoh?",answer: "True"),
        Question(text: "Apakah Kalian Siluman Cucu Dajjal?",answer: "True"),
        Question(text: "Apakah Rambut Nabil Lurus?",answer: "False")
    ]
    
    func getQuestionText() -> String{
        return quiz[questionNumber].text
    }

    func checkAnswer(userAnswer: String) -> Bool{
        if userAnswer == quiz[questionNumber].answer{
            
            return true
        } else{
            return false
        }
        
    }
    
     mutating func nextQuestion(){
        if questionNumber + 1 < quiz.count {
        questionNumber += 1
        } else {
        questionNumber = 0
        }
    }
    
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }
    
    func getScore() -> Int{
        return score
    }
    
}
