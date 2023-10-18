//
//  ScoreVC.swift
//  TicTacToe
//
//  Created by Vinamra Kaushal on 13/10/23.
//

import UIKit

var noughtLabel = "0"
var crossLabel = "0"

class ScoreVC: UIViewController {
    @IBOutlet weak var player1: UILabel!
    @IBOutlet weak var player2: UILabel!
    @IBOutlet weak var noughtScore: UILabel!
    @IBOutlet weak var crossesScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalScore()
        playerName()
    }
    func totalScore() {
        noughtScore.text = crossLabel
        crossesScore.text = noughtLabel
    }
    
    func playerName() {
        player1.text = name1
        player2.text = name2
    }
}
