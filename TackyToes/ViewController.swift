//
//  ViewController.swift
//  TackyToes
//
//  Created by Michaela Beyer on 2022-10-03.
//

import UIKit

class ViewController: UIViewController {
   
    let p1 = "X"
    let p2 = "O"
    var player = 1
    var board = [0, 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0]
    var gameIsOn = true
    let gameContinue = 0
    
    
    @IBOutlet var boxes : [UIButton]!
    
    
    @IBOutlet weak var rotatedLabel: UILabel!
    @IBOutlet weak var upsideLabel: UILabel!
    
    @IBOutlet weak var againBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        //Rotated upper Label for 2 player mode
        rotatedLabel.transform = CGAffineTransform(rotationAngle: -(.pi / 1))
        
        rotatedLabel.text = "Your Turn"
        
        againBtn.isHidden = true
        
        
    }
    
    @IBAction func pressedField(_ sender: UIButton) {
        
        
        if (board[sender.tag] == 0  && gameIsOn == true) {
            
            board[sender.tag] = player
            
            
            if (player == 1)
            {
                sender.setTitle(p1, for: .normal)
                rotatedLabel.text = "Player 1"
                upsideLabel.text = "Your Turn"
                player = 2
            }
            else
            {
                sender.setTitle(p2, for: .normal)
                upsideLabel.text = "Player 2"
                rotatedLabel.text = "Your Turn"
                player = 1
            }
            
            
        }

        
        let result = checkWin()
               
               if result != gameContinue {
                   
                   
                   againBtn.isHidden = false
                   
                   rotatedLabel.text = "PLAYER \(result) HAS WON"
                   upsideLabel.text = "PLAYER \(result) HAS WON"
               }
               
               // Checking if its a tie
               var count = 0
               
               for i in board {
                   if i != 0 {
                       count += 1
                       
                       if count > 8 && result != 1 && result != 2 {
                           
                           
                           againBtn.isHidden = false
                           
                          
                           rotatedLabel.text = "You Both Lose"
                           upsideLabel.text = "You Both Lose"
                       }
                   }
               }
               
           }
    
    
    @IBAction func againBtnPressed(_ sender: UIButton) {
        
       playAgain()
        
        
    }
    
    
    func playAgain() {
        board = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        player = 1
        
        for box in boxes {
            box.setTitle("", for: .normal)
        
        }
        rotatedLabel.text = "Your Turn"
        
        againBtn.isHidden = true
        
    }
    
        
        func checkWin() -> Int {
            
           
            if board[0] == board[1] && board[0] == board[2] && board[0] != 0 {
                
                return board[0]
            }
            
           
            if board[3] == board[4] && board[3] == board[5] && board[3] != 0 {
                
                return board[3]
            }
            
            
            if board[6] == board[7] && board[6] == board[8] && board[6] != 0 {
                
                return board[6]
            }
            
            
            if board[0] == board[3] && board[0] == board[6] && board[0] != 0 {
                
                return board[0]
            }
            
            
            if board[1] == board[4] && board[1] == board[7] && board[1] != 0 {
                
                return board[1]
            }
            
            
            if board[2] == board[5] && board[2] == board[8] && board[2] != 0 {
                
                return board[2]
            }
            
           
            if board[0] == board[4] && board[0] == board[8] && board[0] != 0 {
                
                return board[0]
            }
            
            
            if board[2] == board[4] && board[2] == board[6] && board[2] != 0 {
                
                return board[2]
            }
            
            return gameContinue
        }
        
        
        


}

