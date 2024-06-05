//
//  InfoViewController.swift
//  BullsEyeViewCode
//
//  Created by Jessica Sampaio on 04/06/24.
//

import UIKit
import WebKit
import Cartography

class InfoViewController: UIViewController {
    
    private lazy var backgroundImageView: UIImageView = {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Background")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        return backgroundImage
    }()
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        return webView
    }()
    
    private lazy var closeButton: UIButton = {
       let button = UIButton()
        button.setTitle("Close", for: .normal)
        button.setBackgroundImage(.buttonNormal, for: .normal)
        button.setBackgroundImage(.buttonHighlighted, for: .highlighted)
        button.setTitleColor(.textButton, for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        button.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        
        navigationItem.setHidesBackButton(true, animated: true)
        
        addSubviews()
        setupConstraints()
    }
    
    @objc private func closeButtonPressed() {
        navigationController?.pushViewController(ViewController(), animated: true)
    }
    
    private func addSubviews() {
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        view.addSubview(webView)
        view.addSubview(closeButton)
    }
    
    private func setupConstraints() {
        constrain(webView, closeButton, view.safeAreaLayoutGuide) { webview, button, view in
            webview.centerX == view.centerX
            webview.top == view.top
            webview.height == view.height * 0.7
            webview.width == view.width * 0.8
            
            button.centerX == view.centerX
            button.bottom == view.bottom - 24
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
