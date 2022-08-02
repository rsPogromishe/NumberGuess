//
//  UserGuessViewModel.swift
//  NumberGuess
//
//  Created by Снытин Ростислав on 03.08.2022.
//

import UIKit

class UserGuessViewModel {
    private var arrayOfNumbers: [Int] = []
    private var computerNumber = EnterNumberViewModel.guess.computerNumber

    func computerChooseNumber() {
        for i in 0...99 {
            arrayOfNumbers.append(i)
        }
        guard let randomNumber = arrayOfNumbers.randomElement() else { return }
        computerNumber = randomNumber
    }

    func userGuessNumber(number: String, view: UIViewController) -> String {
        EnterNumberViewModel.guess.userTries += 1
        if Int(number) ?? 0 > computerNumber {
            return "less"
        } else if Int(number) ?? 0 < computerNumber {
            return "more"
        } else if Int(number) ?? 0 == computerNumber {
            let vc = ScoresViewController()
            vc.modalPresentationStyle = .fullScreen
            view.present(vc, animated: true)
        }
        return ""
    }
}
