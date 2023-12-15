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
    var test = 0
    var handValue = 0
    var dealerValue = 0
    var dealerCount = 0
    var deck = createDeck()
    var dealer: [Card] = []
    var player: [Card] = []
    var count = 1
    var isBust = false
    var dealerIsBust = false
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
        
        if (isBust) {
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
            isBust = true
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
        dealerValue = countCards

        if(countCards > 21) {
            dealerIsBust = true
        }
        
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
        
    }
    
}

