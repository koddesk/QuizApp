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
        imageView.image = UIImage(named: "Background-Bubbles")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Score: 0"
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.text = "No piece of square dry paper can be folded in half more than 7 times."
        label.numberOfLines = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var firstButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("", for: .normal)
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var secondButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("", for: .normal)
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var thirdButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("", for: .normal)
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var quizBrain = QuizBrain()
    let buttonsArray = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
    }

    private func setupView() {
        view.backgroundColor = #colorLiteral(red: 0.1923559308, green: 0.2327082157, blue: 0.3624993563, alpha: 1)
        
        view.addSubview(backgroundImageView)
        view.addSubview(scoreLabel)
        view.addSubview(questionLabel)
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
        
        updateUI()
    }
    
    @objc private func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        
        let answer = quizBrain.getAnswer()
        firstButton.setTitle(answer[0], for: .normal)
        secondButton.setTitle(answer[1], for: .normal)
        thirdButton.setTitle(answer[2], for: .normal)
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        firstButton.backgroundColor = .systemFill
        secondButton.backgroundColor = .systemFill
        thirdButton.backgroundColor = .systemFill
    }
    
    @objc private func buttonTapped(sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    
    }
}

//MARK: - Constraints
extension ViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            scoreLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            scoreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            questionLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 100),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            firstButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 550),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.heightAnchor.constraint(equalToConstant: 60),
            firstButton.widthAnchor.constraint(equalToConstant: 300),
            
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 10),
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondButton.heightAnchor.constraint(equalToConstant: 60),
            secondButton.widthAnchor.constraint(equalToConstant: 300),
            
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 10),
            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thirdButton.heightAnchor.constraint(equalToConstant: 60),
            thirdButton.widthAnchor.constraint(equalToConstant: 300),
        ])
    }
}
