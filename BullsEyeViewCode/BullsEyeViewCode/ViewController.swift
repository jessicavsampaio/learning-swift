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
        label.text = "Put the Bull's Eye as close as you can to:"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var targetNumberLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var minimumSliderLabel: UILabel = {
       let label = UILabel()
        label.text = "1"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 17)
        return label
    }()
    
    private lazy var slider: UISlider = {
       let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
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
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 17)
        return label
    }()
    
    private lazy var sliderStackView: UIStackView = {
       let stackview = UIStackView(arrangedSubviews: [minimumSliderLabel, slider, maximumSliderLabel])
        stackview.spacing = 10
        return stackview
    }()
    
    private lazy var hitMeButton: UIButton = {
       let button = UIButton()
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
        button.setBackgroundImage(.smallButton, for: .normal)
        button.setImage(.startOverIcon, for: .normal)
        button.addTarget(self, action: #selector(startNewGame), for: .touchUpInside)
        return button
    }()
    
    private lazy var scoreLabel: UILabel = {
       let label = UILabel()
        label.text = "Score:"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 17)
        return label
    }()
    
    private lazy var scoreValueLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var scoreStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [scoreLabel, scoreValueLabel])
        stackView.spacing = 5
        return stackView
    }()
    
    private lazy var roundLabel: UILabel = {
       let label = UILabel()
        label.text = "Round:"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 17)
        return label
    }()
    
    private lazy var roundValueLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var roundStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [roundLabel, roundValueLabel])
        stackView.spacing = 5
        return stackView
    }()
    
    private lazy var infoButton: UIButton = {
       let button = UIButton()
        button.setBackgroundImage(.smallButton, for: .normal)
        button.setImage(.infoButton, for: .normal)
        button.addTarget(self, action: #selector(infoButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var footerStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [startOverButton, scoreStackView, roundStackView, infoButton])
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setHidesBackButton(true, animated: true)
        
        addSubviews()
        setupConstraints()
        startNewGame()
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
    
    @objc private func infoButtonPressed() {
        self.present(InfoViewController(), animated: true)
    }
    
    private func addSubviews() {
        
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        view.addSubview(titleLabel)
        view.addSubview(targetNumberLabel)
        view.addSubview(sliderStackView)
        view.addSubview(hitMeButton)
        view.addSubview(footerStackView)
    }
    
    private func setupConstraints() {
        constrain(titleLabel, targetNumberLabel, view.safeAreaLayoutGuide) { label, targetLabel, view in
            label.centerX == view.centerX
            label.top == view.top + 24
            
            targetLabel.leading == label.trailing + 10
            targetLabel.top == label.top
        }
        
        constrain(titleLabel, sliderStackView, view.safeAreaLayoutGuide) { titleLabel, stackView, view in
            stackView.centerX == view.centerX
            stackView.top == titleLabel.bottom + 64
            stackView.width == view.width * 0.8
        }
        
        constrain(hitMeButton, slider, view.safeAreaLayoutGuide) { button, slider, view in
            button.top == slider.bottom + 48
            button.centerX == view.centerX
        }
        
        constrain(footerStackView, hitMeButton, view.safeAreaLayoutGuide) { stackView, button, view in
            stackView.bottom == view.bottom - 24
            stackView.leading == view.leading + 48
            stackView.trailing == view.trailing - 48
        }
    }

}

