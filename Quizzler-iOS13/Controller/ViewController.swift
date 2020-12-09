import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var quizLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    var quizBrain = QuizBrain()
       
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func buttonAnswer(_ sender: UIButton) {
        timer.invalidate()
        
        let userAnswer = sender.currentTitle!
        let actualAnswer = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if actualAnswer {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateQuiz), userInfo: nil, repeats: false)
    }
    
    @objc func updateQuiz(){
        quizLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }
    
}

