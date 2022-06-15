//
//  PvEViewController.swift
//  TicTacToe
//
//  Created by Robin Xia on 2021-12-02.
//

import UIKit

class GamesettingsVC: UIViewController {
    @IBOutlet weak var boardImage: UIImageView!
    
    @IBOutlet weak var PVPP1LBL: UILabel!
    @IBOutlet weak var PVPP2LBL: UILabel!
    @IBOutlet weak var PVPP1TF: UITextField!
    @IBOutlet weak var PVPP2TF: UITextField!
    @IBOutlet weak var PVCLBL: UILabel!
    @IBOutlet weak var PVCTF: UITextField!
    @IBOutlet weak var DifLBL: UILabel!
    @IBOutlet weak var EDifBTN: UIButton!
    @IBOutlet weak var HDifBTN: UIButton!
    
    
    
    let board = Board()
    var difficulty = 0
    var boardSize = 9
    var pvp = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(pvp)
        if (pvp == true){
            PVCTF.isHidden = true
            PVCLBL.isHidden = true
            PVPP1LBL.isHidden = false
            PVPP1TF.isHidden = false
            PVPP2LBL.isHidden = false
            PVPP2TF.isHidden = false
            DifLBL.isHidden = true
            EDifBTN.isHidden = true
            HDifBTN.isHidden = true
        }
        else{
            PVPP1LBL.isHidden = true
            PVPP1TF.isHidden = true
            PVPP2LBL.isHidden = true
            PVPP2TF.isHidden = true
            PVCTF.isHidden = false
            PVCLBL.isHidden = false
            DifLBL.isHidden = false
            EDifBTN.isHidden = false
            HDifBTN.isHidden = false
        }
        
    }
    
    @IBAction func x3Button(_ sender: Any) {
        boardSize = 9
        boardImage.image = UIImage(named: "3x33d")
    }
    @IBAction func x5Button(_ sender: Any) {
        boardSize = 25
        boardImage.image = UIImage(named: "5x53d")
    }
    @IBAction func xButton(_ sender: Any) {
        boardImage.image = UIImage(named: "?x?")
        let randomInt = Int.random(in: 0..<2)
        if (randomInt == 0){
            boardSize = 9
        }
        else {
            boardSize = 25
        }
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
            gameVC.boardSize = boardSize
            gameVC.isPvp = pvp
            if (pvp == true){
                gameVC.player1Name = PVPP1TF.text ?? "Player1"
                gameVC.player2Name = PVPP2TF.text ?? "Player2"
            }
            else{
                gameVC.player1Name = PVCTF.text ?? "Player1"
                gameVC.player2Name = "Computer"
                gameVC.difficulty = difficulty
            }

        }
    }

}
