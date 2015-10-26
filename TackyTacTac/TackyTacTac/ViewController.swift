//
//  ViewController.swift
//  TackyTacTac
//
//  Created by Isaiah Khan on 10/26/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var grid = [[0,0,0],[0,0,0],[0,0,0]]
    
    var isPlayer1Turn = true
    
    var player1Score = 0
    var player2Score = 0
    var stalemateScore = 0
    
    let gameStatusLabel = UILabel(frame: CGRect(x: 0, y: 80, width: 200, height: 50))
    
    let player1WinningsLabel = UILabel(frame: CGRect(x: 0, y: 30, width: 200, height: 50))
    let player2WinningsLabel = UILabel(frame: CGRect(x: 0, y: 20, width: 200, height: 50))
    let stalemateWinningsLabel = UILabel(frame: CGRect(x: 0, y: 10, width: 200, height: 50))
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        gameStatusLabel.text = "Player 1 Turn" //tells which player to go
        gameStatusLabel.textAlignment = .Center
        
        gameStatusLabel.center.x = view.center.x
        
        view.addSubview(gameStatusLabel)
        
        let screenHeight = Int(UIScreen.mainScreen().bounds.height)
        let screenWidth = Int(UIScreen.mainScreen().bounds.width)
        
        let buttonHW = 100 //H & W means height and width.
        let buttonSpacing = 4
        
        let gridHW = (buttonHW * 3) + (buttonSpacing * 2)
        
        let leftSpacing = (screenWidth - gridHW) / 2
        let topSpacing = (screenHeight - gridHW) / 2
        
        //Nested Loop, runs a total of 9 times.
        for (r, row) in grid.enumerate()
        {
            for (c,_) in row.enumerate()
            {
                let x = c * (buttonHW + buttonSpacing) + leftSpacing
                let y = r * (buttonHW + buttonSpacing) + topSpacing
                
                let button = TTTButton(frame: CGRect(x: x, y: y, width: buttonHW, height: buttonHW))
                button.backgroundColor = UIColor.cyanColor()
                
                button.row = r
                button.col = c
                
                button.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
                view.addSubview(button)
            }
        }
        // where you would add your labels after your grid
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Action Handlers
    func spacePressed(button: TTTButton)
    {
        if button.player == 0
        {
            if isPlayer1Turn
            {
                button.player = 1
                gameStatusLabel.text = "Player 2 Turn"
            }
            else
            {
                button.player = 2
                gameStatusLabel.text = "Player 1 Turn"
            }
            //button.player = isPlayer1Turn ? 1:2 //ternary operater, checks to see if whats left of the question mark is a boolean. If its true then it uses 1 and if its false it goes to 2 which is right of the colon.
            grid[button.row][button.col] = isPlayer1Turn ? 1:2
            
            isPlayer1Turn = !isPlayer1Turn
            
            checkForWinner()
        }
    }
    
    //MARK: - Misc
    func checkForWinner()
    {
        let possibilities = [
            ((0,0),(0,1),(0,2)),
            ((1,0),(1,1),(1,2)),
            ((2,0),(2,1),(2,2)),
            ((0,0),(1,0),(2,0)),
            ((0,1),(1,1),(2,1)),
            ((0,2),(1,2),(2,2)),
            ((0,0),(1,1),(2,2)),
            ((2,0),(1,1),(0,2))
        ]
        for possibility in possibilities
        {
            let (p1,p2,p3) = possibility
            
            let value1 = grid[p1.0][p1.1]
            let value2 = grid[p2.0][p2.1]
            let value3 = grid[p3.0][p3.1]
            
            if value1 == value2 && value2 == value3
            {
                if value1 != 0
                {
                    print("Player \(value1) wins!")
                }
                else
                {
                    print("No Winner: all zeros")
                }
            }
            else
            {
                print("Does not match")
            }
        }
    }
    
    func updateGameStatusLabel()
    {
        gameStatusLabel.text = "Player 1 Turn"
        gameStatusLabel.text = "Player 2 Turn"
    }
}

class TTTButton: UIButton
{
    var row = 0
    var col = 0
    
    var player = 0
    {
        didSet
        {
            switch player
            {
            case 1:backgroundColor = UIColor.magentaColor()
                
            case 2:backgroundColor = UIColor.yellowColor()
        
            default:backgroundColor = UIColor.cyanColor()
            }
        }
    }
}


