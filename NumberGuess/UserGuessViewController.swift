//
//  UserGuessingViewController.swift
//  NumberGuess
//
//  Created by Снытин Ростислав on 29.07.2022.
//

import UIKit

class UserGuessViewController: UIViewController {
    private let viewModel = UserGuessViewModel()

    private let tryNumber = UILabel()
    private let youGuessLabel = UILabel()
    private let numberField = UITextField()
    private let guessButton = UIButton()
    private let answerLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.computerChooseNumber()
    }

    private func setupUI() {
        self.view.backgroundColor = .white
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleScreenTap(sender:)))
        self.view.addGestureRecognizer(tap)

        tryNumber.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tryNumber)
        tryNumber.text = "Try № 2"
        tryNumber.font = .systemFont(ofSize: 20)

        youGuessLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(youGuessLabel)
        youGuessLabel.text = "You are guessing"
        youGuessLabel.font = .systemFont(ofSize: 18)

        numberField.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(numberField)
        numberField.font = .systemFont(ofSize: 24)
        numberField.adjustsFontSizeToFitWidth = false
        numberField.placeholder = "Guess the number"
        numberField.textAlignment = .center
        numberField.borderStyle = .roundedRect
        numberField.delegate = self

        guessButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(guessButton)
        guessButton.clipsToBounds = true
        guessButton.layer.cornerRadius = 20
        guessButton.setTitle("Guess", for: .normal)
        guessButton.tintColor = .white
        guessButton.backgroundColor = .blue
        guessButton.addTarget(self, action: #selector(guessButtonPressed), for: .touchUpInside)

        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(answerLabel)
        answerLabel.text = "No, my number is ..."
        answerLabel.font = .systemFont(ofSize: 18)

        NSLayoutConstraint.activate([
            tryNumber.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 160),
            tryNumber.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),

            youGuessLabel.topAnchor.constraint(equalTo: tryNumber.bottomAnchor, constant: 20),
            youGuessLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),

            numberField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
            numberField.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20),
            numberField.topAnchor.constraint(equalTo: youGuessLabel.bottomAnchor, constant: 80),

            guessButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
            guessButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20),
            guessButton.heightAnchor.constraint(equalToConstant: 50),
            guessButton.topAnchor.constraint(equalTo: numberField.bottomAnchor, constant: 80),

            answerLabel.topAnchor.constraint(equalTo: guessButton.bottomAnchor, constant: 60),
            answerLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }

    private func updateUI() {
        let guessText = viewModel.userGuessNumber(number: numberField.text ?? "", view: self)
        answerLabel.text = "No, my number is \(guessText)"
    }

    @objc private func handleScreenTap(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }

    @objc private func guessButtonPressed() {
        updateUI()
    }
}

extension UserGuessViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.count == 0 {
            return true
        }
        let currentText = textField.text ?? ""
        let prospectiveText = (currentText as NSString).replacingCharacters(in: range, with: string)
        return prospectiveText.containsOnlyCharactersIn(matchCharacters: "0123456789") && prospectiveText.count <= 2
    }
}
