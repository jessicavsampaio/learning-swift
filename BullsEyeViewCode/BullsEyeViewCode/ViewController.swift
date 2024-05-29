//
//  ViewController.swift
//  BullsEyeViewCode
//
//  Created by Jessica Sampaio on 28/05/24.
//

import UIKit

class ViewController: UIViewController {
    
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
    
    private lazy var randomNumber: UILabel = {
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
        return button
    }()
    
    private lazy var startOverButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(.smallButton, for: .normal)
        button.setImage(.startOverIcon, for: .normal)
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
        
        addSubviews()
        setupConstraints()
        // Do any additional setup after loading the view.
    }
    
    @objc private func sliderValueChanged() {
        print("Slider value changed")
    }
    
    private func addSubviews() {
        
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        view.addSubview(titleLabel)
        view.addSubview(randomNumber)
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
            
            randomNumber.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
            randomNumber.topAnchor.constraint(equalTo: view.topAnchor, constant: 48),
            
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

