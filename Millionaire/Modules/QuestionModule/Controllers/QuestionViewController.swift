import UIKit

class QuestionViewController: UIViewController {
    
    let questionManager = QuestionManager(totalQuestions: 15)

    override func viewDidLoad() {
        super.viewDidLoad()

        print(questionManager.testArrays())
        
    }
}
