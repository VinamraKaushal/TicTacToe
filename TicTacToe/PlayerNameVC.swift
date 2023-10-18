//
//  PlayerNameVC.swift
//  TicTacToe
//
//  Created by Vinamra Kaushal on 14/10/23.
//

import UIKit
import AVFoundation

var name1: String = ""
var name2: String = ""

class PlayerNameVC: UIViewController {
    @IBOutlet weak var player1: UITextField!
    @IBOutlet weak var player2: UITextField!
    @IBAction func continueButton(_ sender: UIButton) {
        name1 = player1.text ?? "Player 1"
        name2 = player2.text ?? "Player 2"
        if name1 == "" {
            name1 = "Player 1"
        }
        if(name2 == "") {
            name2 = "Player 2"
        }
        playSound()
    }
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        player1.delegate = self
        player2.delegate = self

    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "touch", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player!.play()
    }
}

extension PlayerNameVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
