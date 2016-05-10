//
//  ViewController.swift
//  Calculator 2
//
//  Created by Andrew Conrad on 5/9/16.
//  Copyright © 2016 AndrewConrad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet   weak    var         displayLabel            :   UILabel!
    var mathString = ""
    var previousMath = ""
    var previousOperation = ""
    var operatorBool = false
    var decimalBool = false
    var equation = 0.0 as Double
    var percenter = 0.0 as Double
    var decimalCheck = 0.0 as Double
    var modulusCheck = 0.0
    
    
    
    //MARK - Called Functions
    
    func operationReseter(sender: UIButton) {
        previousMath = String(equation)
        mathString = ""
        previousOperation = sender.titleLabel!.text!
        displayLabel.text = sender.titleLabel!.text!
    }
    
    func operationSwitcher(sender: UIButton) {
        switch previousOperation {
        case "+":
            equation = Double(previousMath)! + Double(mathString)!
            operationReseter(sender)
        case "-":
            equation = Double(previousMath)! - Double(mathString)!
            operationReseter(sender)
        case "x":
            equation = Double(previousMath)! * Double(mathString)!
            operationReseter(sender)
        case "⌹":
            equation = Double(previousMath)! / Double(mathString)!
            operationReseter(sender)
        default:
            print("Error")
        }
    }
    
    //MARK - Interactivity Methods
    
    @IBAction   func    numberButtonPressed(sender : UIButton)  {
        mathString = mathString +  sender.titleLabel!.text!
        displayLabel.text = mathString
        
    }
    
    @IBAction   func    plusMinusButtonPressed(sender : UIButton)   {
        if Double(mathString) > 0 {
            mathString = "-" + mathString
            displayLabel.text = mathString
        } else if Double(mathString) < 0 {
            mathString = String(mathString.characters.dropFirst())
            displayLabel.text = mathString
        }
    }
    
    
    @IBAction   func    basicOperatorPressed(sender : UIButton)     {
        if operatorBool == false && mathString != "" {
            displayLabel.text = sender.titleLabel!.text!
            previousOperation = sender.titleLabel!.text!
            previousMath = mathString
            mathString = ""
            operatorBool = true
        } else  if operatorBool == true {
            operationSwitcher(sender)
            print(equation)
        }
        decimalBool = false
    }
        
    
    @IBAction   func    equalsButtonPressed(sender : UIButton)      {
        operationSwitcher(sender)
        displayLabel.text = String(equation)
        print(equation)
        
        mathString = ""
        previousMath = ""
        previousOperation = ""
        operatorBool = false
        decimalBool = false
        equation = 0.0
        percenter = 0.0
        decimalCheck = 0.0
        modulusCheck = 0.0
    }
    
    @IBAction   func    allClearButtonPressed(sender : UIButton)    {
        
        mathString = ""
        previousMath = ""
        previousOperation = ""
        operatorBool = false
        decimalBool = false
        equation = 0.0
        percenter = 0.0
        decimalCheck = 0.0
        modulusCheck = 0.0
        
        displayLabel.text = ""
    }
    
    @IBAction   func    percentageButtonPressed(sender : UIButton)  {
        percenter = Double(mathString)! / 100
        mathString = String(percenter)
        //I am not sure why I had to do this as 2 steps, but whatever
    }
    
    @IBAction   func    decimalButtonPressed(sender : UIButton)     {
        decimalCheck = Double(mathString)!
        modulusCheck = decimalCheck % 1
        if modulusCheck == 0 && decimalBool == false {
            mathString = mathString +  sender.titleLabel!.text!
            displayLabel.text = mathString
            decimalBool = true
        }
    }
    
    //MARK - Life Cycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

