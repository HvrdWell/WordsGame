//
//  Player.swift
//  WordsGame
//
//  Created by geka231 on 17.12.2022.
//

import Foundation

struct Player {
    let name: String
    private (set) var score = 0
    
    
    mutating func add(score: Int){
        self.score += score
    }
    
    
}
