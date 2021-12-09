//
//  LoginViewController.swift
//  SeventhBuildingApp0119
//
//  Created by cmStudent on 2021/07/15.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var logInTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logInTextField.delegate = self
        logInButton.isEnabled = false
        setUpButton()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setUpButton() {
        
        logInButton.layer.masksToBounds = true
        logInButton.layer.cornerRadius = logInButton.frame.size.height / 2
        
        
        let botommColor = UIColor(red: 6 / 255, green: 219 / 255, blue: 2 / 255, alpha: 1)
        let topColor = UIColor(red: 144 / 255, green: 255 / 255, blue: 144 / 255, alpha: 1)
        
        let gradientColors = [botommColor.cgColor, topColor.cgColor]
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.frame = logInButton.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.3)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        logInButton.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @IBAction func logIn(_ sender: Any) {
        
        UserDefaults.standard.setValue("open2021", forKey: "logIn")
        
        let tabBarController = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
        tabBarController.modalPresentationStyle = .fullScreen
        self.present(tabBarController, animated: true, completion: nil)
        
    }
    
    
}

extension LoginViewController: UITextFieldDelegate {
    
    // returnでキーボードを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        if textField.text == "open2021" {
            logInButton.isEnabled = true
        } else {
            logInButton.isEnabled = false
        }
        
        return true
        
    }
    
}

