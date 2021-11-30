//
//  PvPViewController.swift
//  TicTacToe
//
//  Created by Robin Xia on 2021-11-28.
//

import UIKit

class PvPViewController: UIViewController {
    
    @IBOutlet weak var boardImage: UIImageView!
    @IBOutlet weak var p1TextField: UITextField!
    @IBOutlet weak var p2TextField: UITextField!
    @IBOutlet weak var p1TextLabel: UILabel!
    @IBOutlet weak var p2textLabel: UILabel!
    @IBOutlet weak var timerTextField: UITextField!
    
    let board = Board()

    var boardSize = 9
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func x3Button(_ sender: UIButton) {
        boardSize = 9
        boardImage.image = UIImage(named: "3x33d")
    }
    
    @IBAction func x5Button(_ sender: UIButton) {
        boardSize = 25
        boardImage.image = UIImage(named: "5x53d")
    }
    @IBAction func startGameSegue(_ sender: Any) {
        performSegue(withIdentifier: "PvPtoGame", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PvPtoGame" {
            let gameVC = segue.destination as! BoardCollectionViewController
            gameVC.player1Name = p1TextField.text ?? "Player1"
            gameVC.player2Name = p2TextField.text ?? "Player2"
            gameVC.boardSize = boardSize

        }
    }
    
}
