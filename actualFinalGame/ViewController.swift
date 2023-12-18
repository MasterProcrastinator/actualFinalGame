//
//  ViewController.swift
//  actualFinalGame
//
//  Created by ALVIN CHEN on 12/8/23.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var multiplierOutlet: UILabel!
    
    
    @IBOutlet weak var imageOutlet1: UIImageView!
    
    @IBOutlet weak var imageOutlet2: UIImageView!
    
    @IBOutlet weak var imageOutlet3: UIImageView!
    
    @IBOutlet weak var imageOutlet4: UIImageView!
    
    @IBOutlet weak var imageOutlet5: UIImageView!
    
    @IBOutlet weak var playerImageOutlet1: UIImageView!
    
    @IBOutlet weak var playerImageOutlet2: UIImageView!
    
    @IBOutlet weak var playerImageOutlet3: UIImageView!
    
    @IBOutlet weak var playerImageOutlet4: UIImageView!
    
    @IBOutlet weak var playerImageOutlet5: UIImageView!
    
    @IBOutlet weak var moneyOutlet: UILabel!
    
    @IBOutlet weak var currentBetOutlet: UILabel!

    
    
    
    
    @IBOutlet weak var textFieldOutlet: UITextField!
    
    var input: Double?
    var bet = 0.0
    var test = 0
    var handValue = 0
    var dealerValue = 0
    var dealerCount = 0
    var deck = createDeck()
    var dealer: [Card] = []
    var player: [Card] = []
    var count = 1
    var gameInSession = false
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        deck.shuffle()
        
        dealer.append(deck.removeLast())
        imageOutlet1.image = UIImage(named: "\(createImage(name: dealer[0]))")
        
        dealer.append(deck.removeLast())
        
        player.append(deck.removeLast())
        
        playerImageOutlet1.image = UIImage(named: "\(createImage(name: player[0]))")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        moneyOutlet.text = "$\(Bank.money)"
        multiplierOutlet.text = "Current Win Multiplier: \(Bank.multiplier)"
    }
    
    @IBAction func hitAction(_ sender: UIButton) {
        let bustAlert = UIAlertController(title: "Bust", message: "You've gone over 21 and lost", preferredStyle: .alert)
        let twentyOneAlert = UIAlertController(title: "hit 21!", message: "instant victory for you", preferredStyle: .alert)
        let replayAction = UIAlertAction(title: "Play Again", style: .default){ (action) in
            self.test = 0
            self.handValue = 0
            self.dealerValue = 0
            self.dealerCount = 0
            self.deck = createDeck()
            self.dealer = []
            self.player = []
            self.count = 1
            self.bet = 0
            self.gameInSession = false
            
            self.deck.shuffle()
            
            self.dealer.append(self.deck.removeLast())
            self.imageOutlet1.image = UIImage(named: "\(createImage(name: self.dealer[0]))")
            
            self.dealer.append(self.deck.removeLast())
            
            self.player.append(self.deck.removeLast())
            
            self.playerImageOutlet1.image = UIImage(named: "\(createImage(name: self.player[0]))")
            
            self.playerImageOutlet2.image = UIImage(named: "")
            
            self.playerImageOutlet3.image = UIImage(named: "")
            
            self.playerImageOutlet4.image = UIImage(named: "")
            
            self.playerImageOutlet5.image = UIImage(named: "")
            
            self.imageOutlet2.image = UIImage(named: "card_back")
            
            self.imageOutlet3.image = UIImage(named: "")
            
            self.imageOutlet4.image = UIImage(named: "")
            
            self.imageOutlet5.image = UIImage(named: "")
            
            
            
        }
        
        gameInSession = true
        if(count >= 5){
            return
        }
        
        
        player.append(deck.removeLast())
        
        if(count == 1){
            playerImageOutlet2.image = UIImage(named: "\(createImage(name: player[count]))")
        }
        if(count == 2){
            playerImageOutlet3.image = UIImage(named: "\(createImage(name: player[count]))")
        }
        if(count == 3){
            playerImageOutlet4.image = UIImage(named: "\(createImage(name: player[count]))")
        }
        if(count == 4){
            playerImageOutlet5.image = UIImage(named: "\(createImage(name: player[count]))")
        }
        count += 1
        
        var countCards = 0
        var numAces: Int = 0
        
        for card in player {
            countCards += card.worth.value
            if(card.worth.value == 11){
                numAces += 1
            }
        }
        
        if(countCards > 21){
            for i in 0..<numAces{
                countCards -= 10
                if(countCards <= 21){
                    break
                }
            }
        }
        
        handValue = countCards
        
        if(countCards > 21) {
            
            bustAlert.addAction(replayAction)

            present(bustAlert, animated: true, completion: nil)
            currentBetOutlet.text = "$0"
            return
            
        }
        
        if(countCards == 21){
            
            Bank.money += bet*Double(Bank.multiplier)
            moneyOutlet.text = "$\(Bank.money)"
            
            twentyOneAlert.addAction(replayAction)
            
            present(twentyOneAlert, animated: true, completion: nil)
            currentBetOutlet.text = "$0"
            return
        }
        
        print("\(countCards)")
        
    }
    
    @IBAction func standAction(_ sender: UIButton) {
        let dealerBustAlert = UIAlertController(title: "Dealer has Busted", message: "You've Won!", preferredStyle: .alert)
        
        let victoryAlert = UIAlertController(title: "Congratulations", message: "Your hand won", preferredStyle: .alert)
        
        let lossAlert = UIAlertController(title: "Better luck next time", message: "the dealer won", preferredStyle: .alert)
        
        let twentyOneDealerAlert = UIAlertController(title: "Dealer hit 21", message: "say goodbye to your money", preferredStyle: .alert)
        
        let tieAlert = UIAlertController(title: "Tie", message: "bets are returned", preferredStyle: .alert)
        
        let replayAction = UIAlertAction(title: "Play Again", style: .default){ (action) in
            self.test = 0
            self.handValue = 0
            self.dealerValue = 0
            self.dealerCount = 0
            self.deck = createDeck()
            self.dealer = []
            self.player = []
            self.count = 1
            self.bet = 0
            self.gameInSession = false
            
            self.deck.shuffle()
            
            self.dealer.append(self.deck.removeLast())
            
            self.imageOutlet1.image = UIImage(named: "\(createImage(name: self.dealer[0]))")
            
            self.dealer.append(self.deck.removeLast())
            
            self.player.append(self.deck.removeLast())
            
            self.playerImageOutlet1.image = UIImage(named: "\(createImage(name: self.player[0]))")
            
            self.playerImageOutlet2.image = UIImage(named: "")
            
            self.playerImageOutlet3.image = UIImage(named: "")
            
            self.playerImageOutlet4.image = UIImage(named: "")
            
            self.playerImageOutlet5.image = UIImage(named: "")
            
            self.imageOutlet2.image = UIImage(named: "card_back")
            
            self.imageOutlet3.image = UIImage(named: "")
            
            self.imageOutlet4.image = UIImage(named: "")
            
            self.imageOutlet5.image = UIImage(named: "")
            
            
            
        }
        gameInSession = true
        imageOutlet2.image = UIImage(named:"\(createImage(name: dealer[1]))")
        
        var countCards2 = 0
        var numAces: Int = 0
        
        for card in dealer {
            countCards2 += card.worth.value
            if(card.worth.value == 11){
                numAces += 1
            }
        }
        
        if(countCards2 > 21){
            for i in 0..<numAces{
                countCards2 -= 10
                if(countCards2 <= 21){
                    break
                }
            }
        }
        
        while(countCards2 < 16 && dealer.count != 5){
            countCards2 = 0
            numAces = 0
            
            for card in dealer {
                countCards2 += card.worth.value
                if(card.worth.value == 11){
                    numAces += 1
                }
            }
            
            if(countCards2 > 21){
                for i in 0..<numAces{
                    countCards2 -= 10
                    if(countCards2 <= 21){
                        break
                    }
                }
            }
            if(countCards2 < 16){
                dealer.append(deck.removeLast())
            }
        }
        
        print("\(countCards2)")
        
        
        

        
        dealerValue = countCards2

        for cards in dealer{
            dealerCount += 1
            print(dealer[dealerCount-1].worth)
            
            if(dealerCount == 3){
                imageOutlet3.image = UIImage(named: "\(createImage(name: dealer[2]))")
            }
            if(dealerCount == 4){
                imageOutlet4.image = UIImage(named: "\(createImage(name: dealer[3]))")
            }
            if(dealerCount == 5){
                imageOutlet5.image = UIImage(named: "\(createImage(name: dealer[4]))")
            }
        }

        if(countCards2 > 21) {
            
            Bank.money += bet*Double(Bank.multiplier)
            moneyOutlet.text = "$\(Bank.money)"

            
            dealerBustAlert.addAction(replayAction)
            
            present(dealerBustAlert, animated: true, completion: nil)
            currentBetOutlet.text = "$0"
            return
        }
        
        if(countCards2 == 21){
            
            twentyOneDealerAlert.addAction(replayAction)
            present(twentyOneDealerAlert, animated: true, completion: nil)
            currentBetOutlet.text = "$0"
            return
        }
        
        if(dealerValue > handValue){
            
            lossAlert.addAction(replayAction)
            
            present(lossAlert, animated: true, completion: nil)
            currentBetOutlet.text = "$0"
            return
        }
        
        else if(handValue > dealerValue){
        
            Bank.money += bet*Double(Bank.multiplier)
            moneyOutlet.text = "$\(Bank.money)"
            
            victoryAlert.addAction(replayAction)
            
            present(victoryAlert, animated: true, completion: nil)
            currentBetOutlet.text = "$0"
            return
        }
        
        else{
            
            Bank.money += bet
            moneyOutlet.text = "$\(Bank.money)"
            
            tieAlert.addAction(replayAction)
            
            present(tieAlert, animated: true, completion: nil)
            currentBetOutlet.text = "$0"
            return
        }
        
    }
    
    @IBAction func betAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Error", message: "Please bet what you actually have", preferredStyle: .alert)
        
        let alert2 = UIAlertController(title: "Error", message: "game in session", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        input = Double(textFieldOutlet.text!)
        if let temp = input{
            if(Bank.money >= temp && gameInSession == false){
                Bank.money -= temp
                bet += temp
                currentBetOutlet.text = "$\(bet)"
                moneyOutlet.text = "$\(Bank.money)"
                gameInSession = true
            }
           
            else if(gameInSession == true){
                alert2.addAction(alertAction)
                present(alert2, animated: true, completion: nil)
                
            }
            
            else{
                alert.addAction(alertAction)
                present(alert, animated: true, completion: nil)
            }

            
            
        }
        textFieldOutlet.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldOutlet.resignFirstResponder()

        return true
    }
}
