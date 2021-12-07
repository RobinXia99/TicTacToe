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
    
    private var board5x5 = false
    
    let winningCombinations3x3 = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    let winningCombinations5x5 = [[0,1,2,3],[1,2,3,4],[5,6,7,8],[6,7,8,9],[10,11,12,13],[11,12,13,14],[15,16,17,18],[16,17,18,19],[20,21,22,23],[21,22,23,24],[0,5,10,15],[5,10,15,20],[1,6,11,16],[6,11,16,21],[2,7,12,17],[7,12,17,22],[3,8,13,18],[8,13,18,23],[4,9,14,19],[9,14,19,24],[0,6,12,18],[6,12,18,24],[1,7,13,19],[5,11,17,23],[4,8,12,16],[8,12,16,20],[3,7,11,15],[9,13,17,21]]
    
    func createBoard(boardSize: Int) -> [Square] {
        switch boardSize {
        case 9:
            board3x3 = true
        case 25:
            board5x5 = true
        default:
            board3x3 = true
        }
        for index in 1...boardSize {
            squares.append(Square(isChecked: false, squareIndex: index - 1, playerImage: nil))
        }
        return squares
    }
    
    func resetBoard() {
        player1.squares?.removeAll()
        player2.squares?.removeAll()
        for square in squares {
            square.isChecked = false
            square.playerImage = nil
        }
        
        
    }
    
    func checkWin(player: Player) -> Bool {
        var hasWon = false
        if let playerSquares = player.squares {
            
            if board3x3 {
            for numbers in winningCombinations3x3 {
               if playerSquares.contains(numbers[0]) && playerSquares.contains(numbers[1]) &&
                    playerSquares.contains(numbers[2]) {
                   for square in squares {
                       square.isChecked = true
                   }
                   hasWon = true
                }
            }
            } else if board5x5 {
                for (index,numbers) in winningCombinations5x5.enumerated() {
                   if playerSquares.contains(numbers[0]) &&
                        playerSquares.contains(numbers[1]) &&
                        playerSquares.contains(numbers[2]) &&
                        playerSquares.contains(numbers[3]) {
                        
                       hasWon = true
                       
                       for square in squares {
                           square.isChecked = true
                       }
                    }
                }
            }
        }
        return hasWon
    }
    
    func checkDraw(hasWon: Bool) -> Bool {
        var isDraw = false
        var index = 0
        if hasWon == false {
            for square in squares {
                if square.isChecked {
                    index += 1
                }
            }
            if index == squares.count {
                isDraw = true
            }
        }
    
        return isDraw
    }

    
    func getBoard() -> Array<Square> {
        return squares
    }
    
    func getSquareWidth() -> Int {
        var width = 110
        if board3x3 {
            width = 110
        } else if board5x5 {
            width = 60
        }
        return width
    }
    
    func getSquareHeight() -> Int {
        var height = 110
        if board3x3 {
            height = 110
        } else if board5x5 {
            height = 60
        }
        return height
    }
    
     
    func createPlayer(namep1: String, namep2: String) {
        if namep1 != "" {
            player1.name = namep1
        } else if namep1 == "" {
            player1.name = "Player 1"
        }
        if namep2 != "" {
            player2.name = namep2
        } else if namep2 == ""{
            player2.name = "Player 2"
        }
     }
     
    func getPlayer1 () -> Player {
         return player1
     }
     
    func getPlayer2 () -> Player {
         return player2
     }
     
    func checkSquare (player: Player, squareIndex: Square) -> Bool {
        if squareIndex.isChecked {
            return false
        } else {
            player.squares?.append(squareIndex.squareIndex)
            squares[squareIndex.squareIndex].isChecked = true
            squares[squareIndex.squareIndex].playerImage = player.playerImage
            return true
        }
     }
    
    func computerTurn (player: Player, difficulty: Int) {
        var tempListOfSquares = [Int]()
        var uncheckedSquares = [Int]()
        for square in squares {
            if square.isChecked == false {
                uncheckedSquares.append(square.squareIndex)
            }
        }
        
        if difficulty == 1 {
            let randomSelection = uncheckedSquares.randomElement()
            if let selectedSquare = randomSelection {
                player.squares?.append(selectedSquare)
                squares[selectedSquare].isChecked = true
                squares[selectedSquare].playerImage = player.playerImage
            }
            
            
            
        } else if difficulty == 2 && board3x3 {
            var index = 0
            
            if let playerSquares = player1.squares {
            
                for number in winningCombinations3x3 {
                    if !playerSquares.contains(number[0]) {
                        tempListOfSquares.append(number[0])
                    }
                    if !playerSquares.contains(number[1]) {
                        tempListOfSquares.append(number[1])
                    }
                    if !playerSquares.contains(number[2]) {
                        tempListOfSquares.append(number[2])
                    }
                    
                    if tempListOfSquares.count == 1 {
                        if uncheckedSquares.contains(tempListOfSquares[0]) {
                            player.squares?.append(tempListOfSquares[0])
                            squares[tempListOfSquares[0]].isChecked = true
                            squares[tempListOfSquares[0]].playerImage = player.playerImage
                            print("1")
                            return
                        }
                    } else {
                        tempListOfSquares.removeAll()
                    }
                }
                    let randomSelection = uncheckedSquares.randomElement()
                    if let selectedSquare = randomSelection {
                        player.squares?.append(selectedSquare)
                        squares[selectedSquare].isChecked = true
                        squares[selectedSquare].playerImage = player.playerImage
                        print("2")
                        return
                    }
                
            }


            
        }

    }
    
    
    
    
}
