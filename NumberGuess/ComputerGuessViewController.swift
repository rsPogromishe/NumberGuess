//
//  ComputeGuessingViewController.swift
//  NumberGuess
//
//  Created by Снытин Ростислав on 29.07.2022.
//

import UIKit

class ComputerGuessViewController: UIViewController {
    private let viewModel = ComputerGuessViewModel()

    private let tryNumber = UILabel()
    private let computerGuessingLabel = UILabel()
    private let guessLabel = UILabel()
    private let numberLabel = UILabel()
    private let biggerButton = UIButton()
    private let guessButton = UIButton()
    private let lessButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        self.view.backgroundColor = .white

        tryNumber.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tryNumber)
        tryNumber.text = "Try № 1"
        tryNumber.font = .systemFont(ofSize: 20)

        computerGuessingLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(computerGuessingLabel)
        computerGuessingLabel.text = "Computer is guessing"
        computerGuessingLabel.font = .systemFont(ofSize: 18)

        guessLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(guessLabel)
        guessLabel.text = "Your number is - \(String(describing: viewModel.computerRandomGuess())) ?"
        guessLabel.font = .systemFont(ofSize: 18)

        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(numberLabel)
        numberLabel.text = "My number is..."
        numberLabel.font = .systemFont(ofSize: 18)

        biggerButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(biggerButton)
        biggerButton.backgroundColor = .white
        biggerButton.layer.cornerRadius = 10
        biggerButton.layer.borderColor = UIColor.black.cgColor
        biggerButton.layer.borderWidth = 1
        biggerButton.setTitle(">", for: .normal)
        biggerButton.setTitleColor(.black, for: .normal)
        biggerButton.contentHorizontalAlignment = .center
        biggerButton.addTarget(self, action: #selector(biggerButtonTapped), for: .touchUpInside)

        guessButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(guessButton)
        guessButton.backgroundColor = .white
        guessButton.layer.cornerRadius = 10
        guessButton.layer.borderColor = UIColor.black.cgColor
        guessButton.layer.borderWidth = 1
        guessButton.setTitle("=", for: .normal)
        guessButton.setTitleColor(.black, for: .normal)
        guessButton.contentHorizontalAlignment = .center
        guessButton.addTarget(self, action: #selector(guessButtonTapped), for: .touchUpInside)

        lessButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lessButton)
        lessButton.backgroundColor = .white
        lessButton.layer.cornerRadius = 10
        lessButton.layer.borderColor = UIColor.black.cgColor
        lessButton.layer.borderWidth = 1
        lessButton.setTitle("<", for: .normal)
        lessButton.setTitleColor(.black, for: .normal)
        lessButton.contentHorizontalAlignment = .center
        lessButton.addTarget(self, action: #selector(lessButtonTapped), for: .touchUpInside)

        NSLayoutConstraint.activate([
            tryNumber.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80),
            tryNumber.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),

            computerGuessingLabel.topAnchor.constraint(equalTo: tryNumber.bottomAnchor, constant: 20),
            computerGuessingLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),

            guessLabel.topAnchor.constraint(equalTo: computerGuessingLabel.bottomAnchor, constant: 80),
            guessLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),

            biggerButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80),
            biggerButton.heightAnchor.constraint(equalToConstant: 50),
            biggerButton.widthAnchor.constraint(equalToConstant: 50),

            guessButton.leftAnchor.constraint(equalTo: biggerButton.rightAnchor, constant: 20),
            guessButton.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 20),
            guessButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            guessButton.widthAnchor.constraint(equalToConstant: 50),
            guessButton.heightAnchor.constraint(equalToConstant: 50),

            lessButton.leftAnchor.constraint(equalTo: guessButton.rightAnchor, constant: 20),
            lessButton.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 20),
            lessButton.widthAnchor.constraint(equalToConstant: 50),
            lessButton.heightAnchor.constraint(equalToConstant: 50),
            
            numberLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            numberLabel.bottomAnchor.constraint(equalTo: biggerButton.topAnchor, constant: -20)
            
        ])
    }

    private func ifBiggerUpdateUI() {
        guessLabel.text = "Your number is - \(String(describing: viewModel.biggerButtonGuess())) ?"
    }

    private func ifLessUpdateUI() {
        guessLabel.text = "Your number is - \(String(describing: viewModel.lessButtonGuess())) ?"
    }

    @objc private func biggerButtonTapped() {
        ifBiggerUpdateUI()
    }

    @objc private func lessButtonTapped() {
        ifLessUpdateUI()
    }

    @objc private func guessButtonTapped() {
        let vc = UserGuessViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}
