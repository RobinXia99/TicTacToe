//
//  Game.swift
//  TicTacToe
//
//  Created by Robin Xia on 2021-11-23.
//

import Foundation
import UIKit


class Board {
    
    
    private var player1 = Player(name: "Player1", wins: 0, playerImage: UIImage(named: "o"), squares: [])
     
    private var player2 = Player(name: "Player2", wins: 0, playerImage: UIImage(named: "x"), squares: [])
    
    private var squares = [Square]()
    
    private var board3x3 = false
    
    private var board5x5 = true
    
    let winningCombinations3x3 = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[3,4,5],[6,7,8],[0,4,8],[2,4,6]]
    
    let winningCombinations5x5 = [[0,1,2,3],[1,2,3,4],[5,6,7,8],[6,7,8,9],[10,11,12,13],[11,12,13,14],[15,16,17,18],[16,17,18,19],[20,21,22,23],[21,22,23,24],[0,5,10,15],[5,10,15,20],[1,6,11,16],[6,11,16,21],[2,7,12,17],[7,12,17,22],[3,8,13,18],[8,13,18,23],[4,9,14,19],[9,14,19,24],[0,6,12,18],[6,12,18,24],[1,7,13,19],[5,11,17,23],[4,8,12,16],[8,12,16,20],[3,7,11,15],[9,13,17,21]]
    
    func createBoard(boardSize: Int) -> [Square] {
        for index in 1...boardSize {
            squares.append(Square(isChecked: false, squareIndex: index, playerImage: nil))
        }
        return squares
    }
    
    func checkWin(player: Player) {
        if let playerSquares = player.squares {
            
            if board3x3 {
            for (index,numbers) in winningCombinations3x3.enumerated() {
               if playerSquares.contains(numbers[0]) && playerSquares.contains(numbers[1]) &&
                    playerSquares.contains(numbers[2]) {
                   for square in squares {
                       square.isChecked = true
                   }
                    print("\(player.name) has won!")
                }
            }
            } else if board5x5 {
                for (index,numbers) in winningCombinations5x5.enumerated() {
                   if playerSquares.contains(numbers[0]) && playerSquares.contains(numbers[1]) &&
                        playerSquares.contains(numbers[2]) &&
                        playerSquares.contains(numbers[3]) {
                        print("\(player.name) has won!")
                       for square in squares {
                           square.isChecked = true
                       }
                    }
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
     
    func checkSquare (player: Player, squareIndex: Square) -> Bool {
        squareIndex.squareIndex -= 1
        if squareIndex.isChecked {
            return false
        } else {
            player.squares?.append(squareIndex.squareIndex)
            squares[squareIndex.squareIndex].isChecked = true
            squares[squareIndex.squareIndex].playerImage = player.playerImage
            return true
        }
     }
    
    
    
    
}
