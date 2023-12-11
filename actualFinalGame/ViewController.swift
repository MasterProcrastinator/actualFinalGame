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
    
    var deck = createDeck()
    var dealer: [Card] = []
    var player: [Card] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        deck.shuffle()
    
        dealer.append(deck.removeLast())
        dealer.append(deck.removeLast())
        
        player.append(deck.removeLast())
        
        debugPrint(createImage(name: deck.removeLast()))

    }

    @IBAction func hitAction(_ sender: UIButton) {
        player.append(deck.removeLast())
    }

    
}

