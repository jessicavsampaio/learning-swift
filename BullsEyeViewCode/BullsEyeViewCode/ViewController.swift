//
//  ViewController.swift
//  BullsEyeViewCode
//
//  Created by Jessica Sampaio on 28/05/24.
//

import UIKit

class ViewController: UIViewController {
    var currentValue = 0
    var targetValue = 0
    var round = 0
    var score = 0
    
    private lazy var backgroundImageView: UIImageView = {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Background")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        return backgroundImage
    }()
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Put the Bull's Eye as close as you can to:"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var targetNumberLabel: UILabel = {
       let label = UILabel()
        label.text = "99"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var minimumSliderLabel: UILabel = {
       let label = UILabel()
        label.text = "1"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 17)
        return label
    }()
    
    private lazy var slider: UISlider = {
       let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.setThumbImage(.sliderThumbNormal, for: .normal)
        slider.setThumbImage(.sliderThumbHighlighted, for: .highlighted)
        slider.setMinimumTrackImage(.sliderTrackLeft, for: .normal)
        slider.setMaximumTrackImage(.sliderTrackRight, for: .normal)
        slider.addTarget(self, action: #selector(sliderMoved), for: .valueChanged)
        return slider
    }()
    
    private lazy var maximumSliderLabel: UILabel = {
       let label = UILabel()
        label.text = "100"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 17)
        return label
    }()
    
    private lazy var hitMeButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(.buttonNormal, for: .normal)
        button.setBackgroundImage(.buttonHighlighted, for: .highlighted)
        button.setTitle("Hit Me!", for: .normal)
        button.setTitleColor(.textButton, for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        return button
    }()
    
    private lazy var startOverButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(.smallButton, for: .normal)
        button.setImage(.startOverIcon, for: .normal)
        button.addTarget(self, action: #selector(startNewGame), for: .touchUpInside)
        return button
    }()
    
    private lazy var scoreLabel: UILabel = {
       let label = UILabel()
        label.text = "Score:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 17)
        return label
    }()
    
    private lazy var scoreValueLabel: UILabel = {
       let label = UILabel()
        label.text = "999999"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var roundLabel: UILabel = {
       let label = UILabel()
        label.text = "Round:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 17)
        return label
    }()
    
    private lazy var roundValueLabel: UILabel = {
       let label = UILabel()
        label.text = "999"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var infoButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(.smallButton, for: .normal)
        button.setImage(.infoButton, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNewGame()
        addSubviews()
        setupConstraints()
    }
    
    @objc private func sliderMoved(_ sender: UISlider) {
        print("Slider value changed")
        currentValue = lroundf(sender.value)
    }
    
    @objc private func showAlert() {
        var difference = currentValue - targetValue
        if difference < 0 { difference *= -1 }
        
        var points = 100 - difference
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        score += points
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: title, 
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok",
                                   style: .default,
                                   handler: { _ in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func startNewGame() {
        score = 0
        round = 0
        startNewRound()
        print("start over buttton pressed")
    }
    
    private func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        
        updateLabels()
    }
    
    private func updateLabels() {
        targetNumberLabel.text = String(targetValue)
        scoreValueLabel.text = String(score)
        roundValueLabel.text = String(round)
    }
    
    private func addSubviews() {
        
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        view.addSubview(titleLabel)
        view.addSubview(targetNumberLabel)
        view.addSubview(minimumSliderLabel)
        view.addSubview(slider)
        view.addSubview(hitMeButton)
        view.addSubview(maximumSliderLabel)
        view.addSubview(startOverButton)
        view.addSubview(scoreLabel)
        view.addSubview(scoreValueLabel)
        view.addSubview(roundLabel)
        view.addSubview(roundValueLabel)
        view.addSubview(infoButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 48),
            
            targetNumberLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
            targetNumberLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 48),
            
            minimumSliderLabel.trailingAnchor.constraint(equalTo: slider.leadingAnchor, constant: -10),
            minimumSliderLabel.topAnchor.constraint(equalTo: slider.topAnchor),
            
            slider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            slider.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 64),
            slider.widthAnchor.constraint(equalTo: titleLabel.widthAnchor, multiplier: 1.2),
            
            maximumSliderLabel.leadingAnchor.constraint(equalTo: slider.trailingAnchor, constant: 10),
            maximumSliderLabel.topAnchor.constraint(equalTo: slider.topAnchor),
            
            hitMeButton.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 48),
            hitMeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            startOverButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -48),
            startOverButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 48),
            
            scoreLabel.bottomAnchor.constraint(equalTo: startOverButton.bottomAnchor),
            scoreLabel.leadingAnchor.constraint(equalTo: startOverButton.trailingAnchor, constant: 130),
            
            scoreValueLabel.bottomAnchor.constraint(equalTo: startOverButton.bottomAnchor),
            scoreValueLabel.leadingAnchor.constraint(equalTo: scoreLabel.trailingAnchor, constant: 5),
            
            roundLabel.bottomAnchor.constraint(equalTo: startOverButton.bottomAnchor),
            roundLabel.trailingAnchor.constraint(equalTo: roundValueLabel.leadingAnchor, constant: -5),
            
            roundValueLabel.bottomAnchor.constraint(equalTo: startOverButton.bottomAnchor),
            roundValueLabel.trailingAnchor.constraint(equalTo: infoButton.leadingAnchor, constant: -130),
            
            infoButton.bottomAnchor.constraint(equalTo: startOverButton.bottomAnchor),
            infoButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -48)
        ])
    }

}

