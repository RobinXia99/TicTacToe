//
//  BoardCollectionViewController.swift
//  TicTacToe
//
//  Created by Robin Xia on 2021-11-23.
//

import UIKit


class BoardCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var dataSource = [Board]()
    var boardSize = 9
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let game = Game()
    override func viewDidLoad() {
        super.viewDidLoad()
        
     /*   let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.size.width/3 , height: view.frame.size.width/3)*/

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        self.collectionView.register(BoardViewCell.self, forCellWithReuseIdentifier: "BoardCell")
        dataSource = game.createBoard(boardSize: boardSize)
        view.addSubview(collectionView)
        


    }

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
        
        print("Index Clicked: \(dataSource[indexPath.row].boardIndex)")
    }
    


}
