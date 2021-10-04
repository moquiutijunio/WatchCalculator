//
//  InterfaceController.swift
//  WatchCalculator WatchKit Extension
//
//  Created by Junio Cesar Moquiuti on 29/09/21.
//

import WatchKit
import Foundation

final class InterfaceController: WKInterfaceController {

    @IBOutlet weak var valueLabel: WKInterfaceLabel!
    
    private enum CalculatorOperators {
        case add, sub, mul, div
    }
    
    private var prevValue: Int = 0
    private var currentValue: Int = 0
    private var currentOperator: CalculatorOperators = .add
}

// MARK: - Calculators methods
extension InterfaceController {
    
    private func operatorPressed(_ calcOperator: CalculatorOperators) {
        switch calcOperator {
        case .add:
            valueLabel.setText("+")
        case .sub:
            valueLabel.setText("-")
        case .mul:
            valueLabel.setText("x")
        case .div:
            valueLabel.setText("÷")
        }
        
        prevValue = currentValue
        currentValue = 0
        currentOperator = calcOperator
    }
    
    private func addToNumber(_ number: Int) {
        let temp: String
        if number != 0, currentValue == 0 {
            temp = number.description
        } else {
            temp = currentValue.description + number.description
        }
        
        currentValue = Int(temp) ?? 0
        valueLabel.setText(temp.description)
    }
    
    private func resultPressed() {
        guard currentValue != 0 else { return }
        var tempResult: Int = 0
        
        switch currentOperator {
        case .add:
            tempResult = prevValue + currentValue
        case .sub:
            tempResult = prevValue - currentValue
        case .mul:
            tempResult = prevValue * currentValue
        case .div:
            tempResult = prevValue / currentValue
        }
        
        currentValue = tempResult
        valueLabel.setText(tempResult.description)
    }
    
    private func clearCalculatorValues() {
        prevValue = 0
        currentValue = 0
        valueLabel.setText(currentValue.description)
    }
}

// MARK: - Actions
extension InterfaceController {
    
    @IBAction func ac() {
        clearCalculatorValues()
    }
    
    @IBAction func add() {
        operatorPressed(.add)
    }
    
    @IBAction func subtrat() {
        operatorPressed(.sub)
    }
    
    @IBAction func multiply() {
        operatorPressed(.mul)
    }
    
    @IBAction func divide() {
        operatorPressed(.div)
    }
    
    @IBAction func result() {
        resultPressed()
    }
    
    @IBAction func zero() {
        addToNumber(0)
    }
    
    @IBAction func one() {
        addToNumber(1)
    }
    
    @IBAction func two() {
        addToNumber(2)
    }
    
    @IBAction func third() {
        addToNumber(3)
    }
    
    @IBAction func four() {
        addToNumber(4)
    }
    
    @IBAction func five() {
        addToNumber(5)
    }
    
    @IBAction func sex() {
        addToNumber(6)
    }
    
    @IBAction func seven() {
        addToNumber(7)
    }
    
    @IBAction func eight() {
        addToNumber(8)
    }
    
    @IBAction func nine() {
        addToNumber(9)
    }
}
