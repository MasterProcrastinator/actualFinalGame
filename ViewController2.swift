//
//  ViewController2.swift
//  actualFinalGame
//
//  Created by ALVIN CHEN on 12/17/23.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var currentBalance: UILabel!
    
    @IBOutlet weak var currentDebt: UILabel!
    
    @IBOutlet weak var textFieldOutlet: UITextField!
    
    @IBOutlet weak var upgradeOutlet1: UILabel!
    
    @IBOutlet weak var upgradeOutlet2: UILabel!
    
    let alert = UIAlertController(title: "Error", message: "you're too broke", preferredStyle: .alert)
    
    let alert2 = UIAlertController(title: "Error", message: "already bought", preferredStyle: .alert)
    let alert3 = UIAlertController(title: "too much debt", message: "must be less than 5k in debt", preferredStyle: .alert)
    let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
    
    var input : Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alert.addAction(alertAction)
        alert2.addAction(alertAction)
        alert3.addAction(alertAction)

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        currentBalance.text = "$\(Bank.money)"
        currentDebt.text = "$\(Bank.debt)"
        
        if(Bank.upgrade1 == true){
            upgradeOutlet1.text = "bought"
            Bank.multiplier = 3
        }
        if(Bank.upgrade2 == true){
            upgradeOutlet2.text = "bought"
            Bank.multiplier = 3
        }
        while(Bank.upgrade1 == true && Bank.upgrade2 == true){
            Bank.multiplier = 4
        }

    }

    @IBAction func loanAction(_ sender: UIButton) {
        Bank.debt -= 1000
        Bank.money += 1000
        currentDebt.text = "$\(Bank.debt)"
        currentBalance.text = "$\(Bank.money)"
    }
    @IBAction func payAction(_ sender: UIButton) {
        input = Double(textFieldOutlet.text!)
        if let temp = input{
            if(Bank.money >= temp){
                Bank.debt = Bank.debt + temp
                Bank.money = Bank.money - temp
                currentBalance.text = "$\(Bank.money)"
                currentDebt.text = "$\(Bank.debt)"
            }
            else{
                let debtAlert = UIAlertController(title: "Error", message: "you don't have that much money", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                debtAlert.addAction(okAction)
                present(debtAlert, animated: true, completion: nil)
            }
        }
        textFieldOutlet.resignFirstResponder()
    }
    
    @IBAction func upgradeAction(_ sender: UIButton) {
        if(Bank.money >= 5000 && Bank.upgrade1 != true && Bank.debt > -5000){
            Bank.upgrade1 = true
            Bank.money -= 5000
            currentBalance.text = "$\(Bank.money)"
            upgradeOutlet1.text = "bought"
        }
        else if(Bank.upgrade1 == true){
            present(alert2, animated: true, completion: nil)
        }
        else if(Bank.money < 5000){
            present(alert, animated: true, completion: nil)
        }
        else{
            present(alert3, animated: true, completion: nil)
        }
    }
    
    @IBAction func upgradeAction2(_ sender: UIButton) {
        if(Bank.money >= 15000 && Bank.upgrade2 != true && Bank.debt > -5000){
            Bank.upgrade2 = true
            Bank.money -= 15000
            currentBalance.text = "$\(Bank.money)"
            upgradeOutlet2.text = "bought"
        }
        else if(Bank.upgrade1 == true){
            present(alert2, animated: true, completion: nil)
        }
        else if(Bank.money < 5000){
            present(alert, animated: true, completion: nil)
        }
        else{
            present(alert3, animated: true, completion: nil)
        }
    }
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldOutlet.resignFirstResponder()

        return true
    }
    
}
