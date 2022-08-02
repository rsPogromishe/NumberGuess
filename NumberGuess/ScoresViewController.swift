//
//  ScoresViewController.swift
//  NumberGuess
//
//  Created by Снытин Ростислав on 29.07.2022.
//

import UIKit

class ScoresViewController: UIViewController {
    private let viewModel = ScoresViewModel()

    private let scoresLabel = UILabel()
    private let youTriesLabel = UILabel()
    private let computerTriesLabel = UILabel()
    private let whoWinLabel = UILabel()
    private let menuButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        self.view.backgroundColor = .white

        scoresLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(scoresLabel)
        scoresLabel.text = "Scores"
        scoresLabel.font = .systemFont(ofSize: 20)

        youTriesLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(youTriesLabel)
        youTriesLabel.text = "Your's tries count: \(viewModel.getUserTries())"
        youTriesLabel.font = .systemFont(ofSize: 18)

        computerTriesLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(computerTriesLabel)
        computerTriesLabel.text = "Computer's tries count: \(viewModel.getComputerTries())"
        computerTriesLabel.font = .systemFont(ofSize: 18)

        whoWinLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(whoWinLabel)
        whoWinLabel.text = "\(viewModel.whoWin())"
        whoWinLabel.font = .systemFont(ofSize: 22)

        menuButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(menuButton)
        menuButton.clipsToBounds = true
        menuButton.layer.cornerRadius = 20
        menuButton.setTitle("Main menu", for: .normal)
        menuButton.tintColor = .white
        menuButton.backgroundColor = .blue
        menuButton.addTarget(self, action: #selector(pushToMainMenu), for: .touchUpInside)

        NSLayoutConstraint.activate([
            scoresLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            scoresLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),

            youTriesLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            youTriesLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 40),

            computerTriesLabel.topAnchor.constraint(equalTo: youTriesLabel.bottomAnchor, constant: 40),
            computerTriesLabel.leftAnchor.constraint(equalTo: youTriesLabel.leftAnchor),

            whoWinLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            whoWinLabel.bottomAnchor.constraint(equalTo: menuButton.topAnchor, constant: -140),

            menuButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
            menuButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20),
            menuButton.heightAnchor.constraint(equalToConstant: 50),
            menuButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -40)
        ])
    }

    @objc private func pushToMainMenu() {
        let vc = StartViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}
