//
//  BoardCollectionViewController.swift
//  TicTacToe
//
//  Created by Robin Xia on 2021-11-23.
//

import UIKit


class BoardCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var player1label: UILabel!
    @IBOutlet weak var player2label: UILabel!
    @IBOutlet weak var playerTurnLabel: UILabel!
    @IBOutlet weak var playAgainLabel: UIButton!
    var currentPlayer: Player = Player(name: "", playerImage: "", squares: [0])
    var dataSource = [Square]()
    var boardSize = 9
    var player1 = Player(name: "", wins: 0, playerImage: "", squares: nil)
    var player2 = Player(name: "", wins: 0, playerImage: "", squares: nil)
    var player1Name = ""
    var player2Name = ""
    var isPvp = true
    var difficulty = 0
    
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let board = Board()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = board.createBoard(boardSize: boardSize)
        board.createPlayer(namep1: player1Name, namep2: player2Name)
        player1 = board.getPlayer1()
        player2 = board.getPlayer2()
        dataSource = board.getBoard()
        currentPlayer = player1
        
        player1label.text = ("\(player1.name) 🥇 \(player1.wins)")
        player2label.text = ("\(player2.name) 🥇 \(player2.wins)")
        playerTurnLabel.text = player1.name + "'s turn"
        
    }
    
    
    func checkSquare (square: Square) {
        
        switch currentPlayer.name {
        case player1.name:
            if board.checkSquare(player: player1, squareIndex: square.squareIndex) == true {
                if !winOrDraw() {
                    currentPlayer = player2
                    playerTurnLabel.text = ("\(currentPlayer.name)'s turn")
                    if isPvp == false {
                        computersTurn()
                    }
                }
            }
        case player2.name:
            if isPvp == true {
                if board.checkSquare(player: player2, squareIndex: square.squareIndex) == true {
                    if !winOrDraw() {
                        currentPlayer = player1
                        playerTurnLabel.text = ("\(currentPlayer.name)'s turn")
                    }
                }
            }
        default:
            return
        }
        
    }
    
    func computersTurn() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.board.computerTurn(player: self.player2, difficulty: self.difficulty)
            if !self.winOrDraw() {
                self.currentPlayer = self.player1
                self.playerTurnLabel.text = ("\(self.currentPlayer.name)'s turn")
            }
        }
    }
    
    
    
    func winOrDraw() -> Bool {
        var gameEnded = false
        if board.checkWin(player: currentPlayer) {
            
            playerTurnLabel.text = ("\(currentPlayer.name) has won!")
            currentPlayer.awardPoint(player: currentPlayer)
            player1label.text = ("\(player1.name) 🥇 \(player1.wins)")
            player2label.text = ("\(player2.name) 🥇 \(player2.wins)")
            playAgainLabel.isHidden = false
            gameEnded = true
            
        } else if board.checkDraw(hasWon: board.checkWin(player: currentPlayer)) {
            
            playerTurnLabel.text = ("Draw!")
            playAgainLabel.isHidden = false
            gameEnded = true
        }
        collectionView.reloadData()
        return gameEnded
    }
    
    @IBAction func playAgainButton(_ sender: Any) {
        
        board.resetBoard()
        collectionView.reloadData()
        playAgainLabel.isHidden = true
        if currentPlayer.name == player1.name {
            currentPlayer = player2
            computersTurn()
        } else {
            currentPlayer = player1
        }
        playerTurnLabel.text = ("\(currentPlayer.name)'s turn")
        
    }
    
    
}

extension BoardCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let boardCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BoardCell", for: indexPath) as! BoardViewCell
        
        self.collectionView = collectionView
        
        boardCell.configureBoard(with: dataSource[indexPath.row])
        
        return boardCell
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        checkSquare(square: dataSource[indexPath.row])
        collectionView.reloadData()
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: board.getSquareWidth(), height: board.getSquareHeight())
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 13
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 29, left: 29, bottom: 29, right: 29)
    }
}

