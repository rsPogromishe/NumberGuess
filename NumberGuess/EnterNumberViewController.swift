//
//  EnterNumberViewController.swift
//  NumberGuess
//
//  Created by Снытин Ростислав on 29.07.2022.
//

import UIKit

class EnterNumberViewController: UIViewController {
    private let textField = UITextField()
    private let enterButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        self.view.backgroundColor = .white
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleScreenTap(sender:)))
        self.view.addGestureRecognizer(tap)

        textField.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(textField)
        textField.font = .systemFont(ofSize: 24)
        textField.adjustsFontSizeToFitWidth = false
        textField.placeholder = "Guess the number"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.delegate = self

        enterButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(enterButton)
        enterButton.clipsToBounds = true
        enterButton.layer.cornerRadius = 20
        enterButton.setTitle("Enter The Number", for: .normal)
        enterButton.tintColor = .white
        enterButton.backgroundColor = .blue

        NSLayoutConstraint.activate([
            textField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
            textField.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20),
            textField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),

            enterButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
            enterButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20),
            enterButton.heightAnchor.constraint(equalToConstant: 50),
            enterButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100)
        ])
    }

    private func checkEmptyStroke() {
        if textField.text?.isEmpty == true {
            enterButton.isEnabled = false
            enterButton.alpha = 0.5
        } else {
            enterButton.isEnabled = true
            enterButton.alpha = 1
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        checkEmptyStroke()
    }
}

extension EnterNumberViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.count == 0 {
            return true
        }
        let currentText = textField.text ?? ""
        let prospectiveText = (currentText as NSString).replacingCharacters(in: range, with: string)
        return prospectiveText.containsOnlyCharactersIn(matchCharacters: "0123456789") && prospectiveText.count <= 2
    }

    @objc func handleScreenTap(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}
