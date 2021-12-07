//
//  PvEViewController.swift
//  TicTacToe
//
//  Created by Robin Xia on 2021-12-02.
//

import UIKit

class PvCViewController: UIViewController {
    @IBOutlet weak var boardImage: UIImageView!
    @IBOutlet weak var playerNameTextField: UITextField!
    let board = Board()
    var difficulty = 0
    var boardSize = 9
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func x3Button(_ sender: Any) {
        boardSize = 9
        boardImage.image = UIImage(named: "3x33d")
    }
    @IBAction func x5Button(_ sender: Any) {
        boardSize = 25
        boardImage.image = UIImage(named: "5x53d")
    }
    @IBAction func easyModeButton(_ sender: Any) {
        difficulty = 1
    }
    @IBAction func hardModeButton(_ sender: Any) {
        difficulty = 2
    }
    
    @IBAction func startButton(_ sender: Any) {
        performSegue(withIdentifier: "PvCToGame", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PvCToGame" {
            let gameVC = segue.destination as! BoardCollectionViewController
            gameVC.player1Name = playerNameTextField.text ?? "Player1"
            gameVC.player2Name = "Computer"
            gameVC.boardSize = boardSize
            gameVC.difficulty = difficulty
            gameVC.isPvc = true

        }
    }

}
