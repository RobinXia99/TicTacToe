//
//  Game.swift
//  TicTacToe
//
//  Created by Robin Xia on 2021-11-23.
//

import Foundation
import UIKit


class Board {
    
    
    private var player1 = Player(name: "Player1", wins: 0, playerImage: UIImage(named: "staricon"), squares: [])
     
    private var player2 = Player(name: "Player2", wins: 0, playerImage: UIImage(named: "circleicon"), squares: [])
    
    private var squares = [Square]()
    
    
    let winningCombinations3x3 = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[3,4,5],[6,7,8],[0,4,8],[2,4,6]]
    
    func createBoard(boardSize: Int) -> [Square] {
        for index in 1...boardSize {
            squares.append(Square(isChecked: false, squareIndex: index, playerImage: nil))
        }
        return squares
    }
    
    func checkWin(player: Player) {
        if let playerSquares = player.squares {
            for (index,numbers) in winningCombinations3x3.enumerated() {
               if playerSquares.contains(numbers[0]) && playerSquares.contains(numbers[1]) &&
                    playerSquares.contains(numbers[2]) {
                    print("\(player.name) has won!")
                }
            }
        }
        

    }
    
    func getBoard() -> Array<Square> {
        return squares
    }
    
     
    func createPlayer(name: String) {
         if player1.name == "" {
             player1.name = name
         } else {
             player2.name = name
         }
     }
     
    func getPlayer1 () -> Player {
         return player1
     }
     
    func getPlayer2 () -> Player {
         return player2
     }
     
    func checkSquare (player: Player, squareIndex: Square) {
        squareIndex.squareIndex -= 1
        if squareIndex.isChecked {
            return
        } else {
            player.squares?.append(squareIndex.squareIndex)
            squares[squareIndex.squareIndex].isChecked = true
            squares[squareIndex.squareIndex].playerImage = player.playerImage
        }
     }
    
    
    
    
}
