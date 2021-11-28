//
//  PvPViewController.swift
//  TicTacToe
//
//  Created by Robin Xia on 2021-11-28.
//

import UIKit

class PvPViewController: UIViewController {
    
    let board = Board()

    var boardSize = 9
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func x3Button(_ sender: UIButton) {
        boardSize = 9
    }
    
    @IBAction func x5Button(_ sender: UIButton) {
        boardSize = 25
    }
    @IBAction func startGameSegue(_ sender: Any) {
        performSegue(withIdentifier: "PvPtoGame", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PvPtoGame" {
            let gameVC = segue.destination as! BoardCollectionViewController
            gameVC.boardSize = boardSize
            
        }
    }
    
}
