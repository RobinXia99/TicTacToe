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
        boardSize = 9
        boardImage.image = UIImage(named: "5x53d")
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
            gameVC.isPvc = true

        }
    }

}
