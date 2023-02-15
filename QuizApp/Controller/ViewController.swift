//
//  ViewController.swift
//  QuizApp
//
//  Created by KODDER on 14.02.2023.
//

import UIKit

class ViewController: UIViewController {

    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "No piece of square dry paper can be folded in half more than 7 times."
        label.numberOfLines = 5
        label.font = .systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var firstChoiceButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setImage(UIImage(named: "choice1Background"), for: .normal)
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var secondChoiceButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setImage(UIImage(named: "choice2Background"), for: .normal)
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        backgroundImageView.frame = view.bounds
    }

    private func setupView() {
        view.backgroundColor = #colorLiteral(red: 0.1923559308, green: 0.2327082157, blue: 0.3624993563, alpha: 1)
        
        view.addSubview(backgroundImageView)
        view.addSubview(textLabel)
        view.addSubview(firstChoiceButton)
        view.addSubview(secondChoiceButton)
        
//        updateUI()
    }
    
    @objc private func updateUI() {
        
    }

    @objc private func buttonTapped(sender: UIButton) {
          print("ok")
    }
}

//MARK: - Constraints
extension ViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 230),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            firstChoiceButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 650),
            firstChoiceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstChoiceButton.heightAnchor.constraint(equalToConstant: 60),
            firstChoiceButton.widthAnchor.constraint(equalToConstant: 300),
            
            secondChoiceButton.topAnchor.constraint(equalTo: firstChoiceButton.bottomAnchor, constant: 10),
            secondChoiceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondChoiceButton.heightAnchor.constraint(equalToConstant: 60),
            secondChoiceButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}
