//
//  ViewController.swift
//  actualFinalGame
//
//  Created by ALVIN CHEN on 12/8/23.
//

import UIKit

class ViewController: UIViewController {

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
    
    let bustAlert = UIAlertController(title: "Bust", message: "You've gone over 21 and lost", preferredStyle: .alert) //done
    
    let dealerBustAlert = UIAlertController(title: "Dealer has Busted", message: "You've Won!", preferredStyle: .alert) //done
    
    let victoryAlert = UIAlertController(title: "Congratulations", message: "Your hand won", preferredStyle: .alert) //done

    let lossAlert = UIAlertController(title: "Better luck next time", message: "the dealer won", preferredStyle: .alert) //done
    
    let twentyOneAlert = UIAlertController(title: "hit 21!", message: "instant victory for you", preferredStyle: .alert) //done
    
    let twentyOneDealerAlert = UIAlertController(title: "Dealer hit 21", message: "say goodbye to your money", preferredStyle: .alert)
    
    let tieAlert = UIAlertController(title: "Tie", message: "bets are returned", preferredStyle: .alert)//done
    

    
    var test = 0
    var handValue = 0
    var dealerValue = 0
    var dealerCount = 0
    var deck = createDeck()
    var dealer: [Card] = []
    var player: [Card] = []
    var count = 1

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        deck.shuffle()
    
        dealer.append(deck.removeLast())
        imageOutlet1.image = UIImage(named: "\(createImage(name: dealer[0]))")
        
        dealer.append(deck.removeLast())
        
        player.append(deck.removeLast())
        
        playerImageOutlet1.image = UIImage(named: "\(createImage(name: player[0]))")

    }

    @IBAction func hitAction(_ sender: UIButton) {
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

            let replayAction = UIAlertAction(title: "Play Again", style: .default){ (action) in
                self.test = 0
                self.handValue = 0
                self.dealerValue = 0
                self.dealerCount = 0
                self.deck = createDeck()
                self.dealer = []
                self.player = []
                self.count = 1
                
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

            
            bustAlert.addAction(replayAction)

            present(bustAlert, animated: true, completion: nil)
            
            
        }

        if(countCards == 21){
            let replayAction = UIAlertAction(title: "Play Again", style: .default){ (action) in
                self.test = 0
                self.handValue = 0
                self.dealerValue = 0
                self.dealerCount = 0
                self.deck = createDeck()
                self.dealer = []
                self.player = []
                self.count = 1
                
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

            
            twentyOneAlert.addAction(replayAction)

            present(twentyOneAlert, animated: true, completion: nil)
        }
        
        print("\(countCards)")
        
    }

    @IBAction func standAction(_ sender: UIButton) {
        imageOutlet2.image = UIImage(named:"\(createImage(name: dealer[1]))")
        
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


        if(countCards > 21) {
            
            let replayAction = UIAlertAction(title: "Play Again", style: .default){ (action) in
                self.test = 0
                self.handValue = 0
                self.dealerValue = 0
                self.dealerCount = 0
                self.deck = createDeck()
                self.dealer = []
                self.player = []
                self.count = 1
                
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
            
            if(countCards == 21){
                let replayAction = UIAlertAction(title: "Play Again", style: .default){ (action) in
                    self.test = 0
                    self.handValue = 0
                    self.dealerValue = 0
                    self.dealerCount = 0
                    self.deck = createDeck()
                    self.dealer = []
                    self.player = []
                    self.count = 1
                    
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

                
                twentyOneDealerAlert.addAction(replayAction)

                present(twentyOneDealerAlert, animated: true, completion: nil)
            }

            
            dealerBustAlert.addAction(replayAction)

            present(dealerBustAlert, animated: true, completion: nil)
        }
        
        dealerValue = countCards
        
        while(dealerValue < 16 && dealer.count != 5){
            dealer.append(deck.removeLast())
        }
        
        for cards in dealer{
            dealerCount += 1
        }
        
        if(dealerCount >= 2){
            imageOutlet3.image = UIImage(named: "\(createImage(name: dealer[2]))")
        }
        if(dealerCount >= 3){
            imageOutlet4.image = UIImage(named: "\(createImage(name: dealer[3]))")
        }
        if(dealerCount >= 4){
            imageOutlet5.image = UIImage(named: "\(createImage(name: dealer[4]))")
        }
        
        if(dealerValue > handValue){
            let replayAction = UIAlertAction(title: "Play Again", style: .default){ (action) in
                self.test = 0
                self.handValue = 0
                self.dealerValue = 0
                self.dealerCount = 0
                self.deck = createDeck()
                self.dealer = []
                self.player = []
                self.count = 1
                
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

            
            lossAlert.addAction(replayAction)

            present(lossAlert, animated: true, completion: nil)
        }
        
        else if(handValue > dealerValue){
            let replayAction = UIAlertAction(title: "Play Again", style: .default){ (action) in
                self.test = 0
                self.handValue = 0
                self.dealerValue = 0
                self.dealerCount = 0
                self.deck = createDeck()
                self.dealer = []
                self.player = []
                self.count = 1
                
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

            
            victoryAlert.addAction(replayAction)

            present(victoryAlert, animated: true, completion: nil)
        }
        
        else{
            let replayAction = UIAlertAction(title: "Play Again", style: .default){ (action) in
                self.test = 0
                self.handValue = 0
                self.dealerValue = 0
                self.dealerCount = 0
                self.deck = createDeck()
                self.dealer = []
                self.player = []
                self.count = 1
                
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

            
            tieAlert.addAction(replayAction)

            present(tieAlert, animated: true, completion: nil)
        }
        
    }
    
}

