//
//  ViewModel.swift
//  NumberGuess
//
//  Created by Снытин Ростислав on 02.08.2022.
//

import Foundation

class EnterNumberViewModel {
    static var guess = Guess(userNumber: 0, computerNumber: 0, userTries: 0, computerTries: 0)

    func getUserNumber(number: String) {
        var newGame = EnterNumberViewModel.guess
        newGame.userTries = 0
        newGame.computerTries = 0

        let numbers = ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09"]

        if numbers.contains(number) {
            newGame.userNumber = Int(number.dropFirst()) ?? 0
        } else {
            newGame.userNumber = Int(number) ?? 0
        }
    }
}
