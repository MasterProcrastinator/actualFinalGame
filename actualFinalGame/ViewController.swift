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
    
    var deck = createDeck()
    var dealer: [Card] = []
    var player: [Card] = []
    var count = 0
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
        if(count <= 5){
            player.append(deck.removeLast())
            playerImageOutlet2.image = UIImage(named: "\(createImage(name: player[1]))")
            
        }
    }

    @IBAction func standAction(_ sender: UIButton) {
        imageOutlet2.image = UIImage(named:"\(createImage(name: dealer[1]))")
        playerImageOutlet2.image = UIImage(named: "\(createImage(name: player[1]))")
    }
    
}

