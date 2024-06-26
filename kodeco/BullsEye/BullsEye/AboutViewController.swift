//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Jessica Sampaio on 21/05/24.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    @IBOutlet var webview: WKWebView!
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = Bundle.main.url(
            forResource: "BullsEye", withExtension: "html") {
            let request = URLRequest(url: url)
            webview.load(request)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        webview.stopLoading()
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
