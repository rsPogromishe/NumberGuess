//
//  ScoresViewModel.swift
//  NumberGuess
//
//  Created by Снытин Ростислав on 03.08.2022.
//

import Foundation

class ScoresViewModel {
    private let scores = EnterNumberViewModel.guess

    func getComputerTries() -> String {
        return String(scores.computerTries)
    }

    func getUserTries() -> String {
        return String(scores.userTries)
    }

    func whoWin() -> String {
        if scores.userTries < scores.computerTries {
            return "You win"
        } else if scores.userTries > scores.computerTries {
            return "Computer win"
        } else {
            return "Draw"
        }
    }
}
