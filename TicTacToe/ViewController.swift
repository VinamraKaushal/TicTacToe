//
//  ViewController.swift
//  TicTacToe
//
//  Created by Vinamra Kaushal on 11/10/23.
//

import UIKit
import AVFoundation

enum Turn {
    case Nought
    case Cross
}

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    @IBAction func scoreButton(_ sender: UIButton) {
        playSound()
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        playSound()
        resetBoard()
    }
    
    var firstTurn = Turn.Cross
    var currentTurn = Turn.Cross
    
    var NOUGHT = "O"
    var CROSS = "X"
    var board = [UIButton]()
    
    var noughtsScore = 0
    var crossesScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        turnLabel.text = name1
        a1.layer.cornerRadius = 25
        a2.layer.cornerRadius = 25
        a3.layer.cornerRadius = 25
        b1.layer.cornerRadius = 25
        b2.layer.cornerRadius = 25
        b3.layer.cornerRadius = 25
        c1.layer.cornerRadius = 25
        c2.layer.cornerRadius = 25
        c3.layer.cornerRadius = 25
        initBoard()
    }
    
    func initBoard() {
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
    }
    
    @IBAction func boardTapAction(_ sender: UIButton) {
        addToBoard(sender)
        if(checkForVictory(CROSS)) {
            crossesScore += 1
            crossLabel = String(crossesScore)
            resultAlert(title: name1 + " Won")
            playWinning()
        }
        if(checkForVictory(NOUGHT)) {
            noughtsScore += 1
            noughtLabel = String(noughtsScore)
            resultAlert(title: name2 + " Won")
            playWinning()
        }
        if(fullBoard()) {
            resultAlert(title: "Draw")
        }
    }
    
    func checkForVictory(_ s: String) -> Bool {
        //Horizontal Victory
        if thisSymbol(a1, s) && thisSymbol(a2, s) && thisSymbol(a3, s) {
            a1.backgroundColor = .systemYellow
            a2.backgroundColor = .systemYellow
            a3.backgroundColor = .systemYellow
            return true;
        }
        if thisSymbol(b1, s) && thisSymbol(b2, s) && thisSymbol(b3, s) {
            b1.backgroundColor = .systemYellow
            b2.backgroundColor = .systemYellow
            b3.backgroundColor = .systemYellow
            return true;
        }
        if thisSymbol(c1, s) && thisSymbol(c2, s) && thisSymbol(c3, s) {
            c1.backgroundColor = .systemYellow
            c2.backgroundColor = .systemYellow
            c3.backgroundColor = .systemYellow
            return true;
        }
        //Vertical Victory
        if thisSymbol(a1, s) && thisSymbol(b1, s) && thisSymbol(c1, s) {
            a1.backgroundColor = .systemYellow
            b1.backgroundColor = .systemYellow
            c1.backgroundColor = .systemYellow
            return true;
        }
        if thisSymbol(a2, s) && thisSymbol(b2, s) && thisSymbol(c2, s) {
            a2.backgroundColor = .systemYellow
            b2.backgroundColor = .systemYellow
            c2.backgroundColor = .systemYellow
            return true;
        }
        if thisSymbol(a3, s) && thisSymbol(b3, s) && thisSymbol(c3, s) {
            a3.backgroundColor = .systemYellow
            b3.backgroundColor = .systemYellow
            c3.backgroundColor = .systemYellow
            return true;
        }
        //Diagonal Victory
        if thisSymbol(a1, s) && thisSymbol(b2, s) && thisSymbol(c3, s) {
            a1.backgroundColor = .systemYellow
            b2.backgroundColor = .systemYellow
            c3.backgroundColor = .systemYellow
            return true;
        }
        if thisSymbol(a3, s) && thisSymbol(b2, s) && thisSymbol(c1, s) {
            a3.backgroundColor = .systemYellow
            b2.backgroundColor = .systemYellow
            c1.backgroundColor = .systemYellow
            return true;
        }
        return false
    }
    
    func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool {
        return button.title(for: .normal) == symbol
    }
    
    func resultAlert(title: String) {
        
            let ac = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
            ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in self.resetBoard() }))
            self.present(ac, animated: true)
    }
    
    
    func resetBoard() {
        for button in board {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
            button.backgroundColor = .white
        }
        if(firstTurn == Turn.Nought) {
            firstTurn = Turn.Cross
            turnLabel.text = name1
        }
        else if(firstTurn == Turn.Cross) {
            firstTurn = Turn.Nought
            turnLabel.text = name2
        }
       
        currentTurn = firstTurn
    }
    
    func fullBoard() -> Bool {
        for button in board {
            if(button.title(for: .normal) == nil) {
                return false
            }
        }
        return true
    }
    
    func addToBoard(_ sender: UIButton) {
        if(sender.title(for: .normal) == nil) {
            if(currentTurn == Turn.Nought) {
                sender.setTitle(NOUGHT, for: .normal)
                sender.setTitleColor(.systemGreen, for: .normal)
                currentTurn = Turn.Cross
                turnLabel.text = name1
            }
            else if(currentTurn == Turn.Cross) {
                sender.setTitle(CROSS, for: .normal)
                sender.setTitleColor(.systemPink, for: .normal)
                currentTurn = Turn.Nought
                turnLabel.text = name2
            }
            sender.isEnabled = false
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "touch", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player!.play()
    }
    
    func playWinning() {
        let url = Bundle.main.url(forResource: "winning", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player!.play()
    }
}

