//
//  BoardCollectionViewController.swift
//  TicTacToe
//
//  Created by Robin Xia on 2021-11-23.
//

import UIKit


class BoardCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var turn = ""
    var dataSource = [Square]()
    var boardSize = 9
    var player1 = Player(name: "", wins: 0, playerImage: nil, squares: nil)
    var player2 = Player(name: "", wins: 0, playerImage: nil, squares: nil)
    
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let board = Board()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        self.collectionView.register(BoardViewCell.self, forCellWithReuseIdentifier: "BoardCell")
        dataSource = board.createBoard(boardSize: boardSize)
        player1 = board.getPlayer1()
        player2 = board.getPlayer2()
        turn = player1.name
        
        view.addSubview(collectionView)
        


    }

    func checkSquare (squareIndex: Square) {
        switch turn {
        case player1.name:
            board.checkSquare(player: player1, squareIndex: squareIndex)
            board.checkWin(player: player1)
            turn = player2.name
        case player2.name:
            board.checkSquare(player: player2, squareIndex: squareIndex)
            board.checkWin(player: player2)
            turn = player1.name
        default:
            print("default")
        }
    }
    
    

}

extension BoardCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let boardCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BoardCell", for: indexPath) as? BoardViewCell {
            
            boardCell.configureBoard(with: dataSource[indexPath.row])
            
            cell = boardCell
            
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("Index Clicked: \(dataSource[indexPath.row].squareIndex)")
        
        dataSource = board.getBoard()
        
        checkSquare(squareIndex: dataSource[indexPath.row])
        
        collectionView.reloadData()
            
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 110)
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

