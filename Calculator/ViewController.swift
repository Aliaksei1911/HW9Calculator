
import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation: Operation = .NULL

   
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLbl.text = "0"
        calcButtons.forEach { button in
                button.layoutIfNeeded()
                button.layer.cornerRadius = button.frame.height / 2
    }
}
    //MARK: - Methods
    func operation(operation: Operation)  {
        if currentOperation != .NULL {
            if runningNumber != "" {
                rightValue = runningNumber
                runningNumber = ""
                if currentOperation == .Add {
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                } else if currentOperation == .Subtract {
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                } else if currentOperation == .Multiply {
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                } else if currentOperation == .Divide {
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                }
                leftValue = result
                outputLbl.text = result
            }
            currentOperation = operation
        } else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
    // MARK: - IBOutlets
    
    @IBOutlet var calcButtons: [UIButton]!
     
    @IBOutlet weak var outputLbl: UILabel!
      
    // MARK: - IBActions
    @IBAction func numberPressed(_ sender: UIButton) {
        runningNumber += "\(sender.tag)"
        outputLbl.text = runningNumber
    }
    @IBAction func allClearPressed(_ sender: UIButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .NULL
        outputLbl.text = "0"
    }
    @IBAction func dotPressed(_ sender: UIButton) {
        runningNumber += "."
        outputLbl.text = runningNumber
    }
    @IBAction func equalPressed(_ sender: UIButton) {
        operation(operation: currentOperation)
    }
    @IBAction func addPressed(_ sender: UIButton) {
        operation(operation: .Add)
    }
    @IBAction func substractPressed(_ sender: UIButton) {
        operation(operation: .Subtract)
    }
    @IBAction func multiplyPressed(_ sender: UIButton) {
        operation(operation: .Multiply)
    }
    @IBAction func dividePresed(_ sender: UIButton) {
        operation(operation: .Divide)
    }
    
    enum Operation: String {
        case Add = "+"
        case Subtract = "-"
        case Multiply = "*"
        case Divide = "/"
        case NULL = "Null"
    }
}


  
