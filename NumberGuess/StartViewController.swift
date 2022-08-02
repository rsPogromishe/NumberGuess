//
//  ViewController.swift
//  NumberGuess
//
//  Created by Снытин Ростислав on 28.07.2022.
//

import UIKit

class StartViewController: UIViewController {
    private let textLabel = UILabel()
    private let startButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        self.view.backgroundColor = .white

        textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(textLabel)
        textLabel.font = .systemFont(ofSize: 24)
        textLabel.text = "My Awesome Game"
        startButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(startButton)
        startButton.clipsToBounds = true
        startButton.layer.cornerRadius = 15
        startButton.backgroundColor = .blue
        startButton.tintColor = .white
        startButton.setTitle("Start New Game", for: .normal)
        startButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            textLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),

            startButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
            startButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20),
            startButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100),
            startButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc private func buttonTapped() {
        let vc = EnterNumberViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}

