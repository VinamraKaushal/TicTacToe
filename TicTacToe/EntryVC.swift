//
//  EntryVC.swift
//  TicTacToe
//
//  Created by Vinamra Kaushal on 14/10/23.
//

import UIKit
import AVFoundation

class EntryVC: UIViewController {
    
    var player: AVAudioPlayer!
    
    @IBAction func startButton(_ sender: Any) {
        playSound()
    }
    
    @IBAction func quitButton(_ sender: UIButton) {
        playSound()
        exit(0)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "touch", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player!.play()
    }
}
