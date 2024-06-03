//
//  ViewController.swift
//  BullsEyeViewCode
//
//  Created by Jessica Sampaio on 28/05/24.
//

import UIKit
import Cartography

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
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = UIImage(named: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage?.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        let trackRightImage = UIImage(named: "SliderTrackRight")
        let trackRightResizable = trackRightImage?.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
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
        constrain(titleLabel, targetNumberLabel, view) { label, targetLabel, view in
            label.centerX == view.centerX
            label.top == view.top + 48
            
            targetLabel.leading == label.trailing + 10
            targetLabel.top == label.top
        }
        
        constrain(titleLabel, minimumSliderLabel, slider, maximumSliderLabel, view) { titleLabel, minimumLabel, slider, maximumLabel, view in
            slider.centerX == view.centerX
            slider.top == titleLabel.bottom + 64
            slider.width == view.width * 0.5
            
            minimumLabel.trailing == slider.leading - 10
            minimumLabel.top == slider.top
            
            maximumLabel.leading == slider.trailing + 10
            maximumLabel.top == slider.top
        }
        
        constrain(hitMeButton, slider, view) { button, slider, view in
            button.top == slider.bottom + 48
            button.centerX == view.centerX
        }
        
        constrain(startOverButton, view.safeAreaLayoutGuide) { button, safeArea in
            button.bottom == safeArea.bottom - 48
            button.leading == safeArea.leading + 48
        }
        
        constrain(scoreLabel, startOverButton, scoreValueLabel, view) { scoreLabel, button, scoreValueLabel, view in
            scoreLabel.bottom == button.bottom
            scoreLabel.leading == button.trailing + 130
            
            scoreValueLabel.bottom == button.bottom
            scoreValueLabel.leading == scoreLabel.trailing + 5
        }
        
        constrain(infoButton, view.safeAreaLayoutGuide) { button, safeArea in
            button.bottom == safeArea.bottom - 48
            button.trailing == safeArea.trailing - 48
        }
        
        constrain(roundLabel, infoButton, roundValueLabel, view) { roundLabel, button, roundValueLabel, view in
            roundLabel.bottom == button.bottom
            roundLabel.trailing == button.leading - 130
            
            roundValueLabel.bottom == button.bottom
            roundValueLabel.trailing == roundLabel.leading - 5
        }
        /*NSLayoutConstraint.activate([
            startOverButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -48),
            startOverButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 48),
            
            infoButton.bottomAnchor.constraint(equalTo: startOverButton.bottomAnchor),
            infoButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -48)8
        ])*/
    }

}

