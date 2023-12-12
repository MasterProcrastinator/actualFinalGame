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
    
    @IBOutlet weak var playerImageOutlet1: UIImageView!
    
    @IBOutlet weak var playerImageOutlet2: UIImageView!
    
    @IBOutlet weak var playerImageOutlet3: UIImageView!
    @IBOutlet weak var playerImageOutlet4: UIImageView!
    
    @IBOutlet weak var playerImageOutlet5: UIImageView!
    var test = 0
    
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
        if(count < 5){
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
        }
    }

    @IBAction func standAction(_ sender: UIButton) {
        imageOutlet2.image = UIImage(named:"\(createImage(name: dealer[1]))")
        
        
    }
    
}

