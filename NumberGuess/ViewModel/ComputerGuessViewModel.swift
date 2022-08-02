//
//  ComputerGuessViewModel.swift
//  NumberGuess
//
//  Created by Снытин Ростислав on 02.08.2022.
//

import Foundation

class ComputerGuessViewModel {
    private var arrayOfNumbers: [Int] = []
    private var guessNumber = 0
    
    func computerRandomGuess() -> String {
        for i in 0...99 {
            arrayOfNumbers.append(i)
        }
        guard let randomNumber = arrayOfNumbers.randomElement() else { return "" }
        guessNumber = randomNumber
        let stringNumber = "\(String(describing: randomNumber))"
        return stringNumber
    }

    func biggerButtonGuess() -> String {
        EnterNumberViewModel.guess.computerTries += 1
        arrayOfNumbers.removeAll { $0 < guessNumber }
        guard let randomNumber = arrayOfNumbers.randomElement() else { return "" }
        guessNumber = randomNumber
        let stringNumber = "\(String(describing: randomNumber))"
        return stringNumber
    }

    func lessButtonGuess() -> String {
        EnterNumberViewModel.guess.computerTries += 1
        arrayOfNumbers.removeAll { $0 > guessNumber }
        guard let randomNumber = arrayOfNumbers.randomElement() else { return "" }
        guessNumber = randomNumber
        let stringNumber = "\(String(describing: randomNumber))"
        return stringNumber
    }
}
