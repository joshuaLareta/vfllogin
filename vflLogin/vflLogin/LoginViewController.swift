//
//  LoginViewController.swift
//  vflLogin
//
//  Created by Joshua on 12/6/20.
//  Copyright © 2020 Joshua. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    let welcomeTitle: UILabel = {
        let welcomeTitle = UILabel()
        welcomeTitle.translatesAutoresizingMaskIntoConstraints = false // we need to use autolayout so we need to disable autoresizing mask for that to happen
        welcomeTitle.text = "Login Screen"
        welcomeTitle.textAlignment = .center
        return welcomeTitle
    }()
    
    let usernameTextField: UITextField = {
        let usernameTextfield = UITextField()
        usernameTextfield.translatesAutoresizingMaskIntoConstraints = false // we need to use autolayout so we need to disable autoresizing mask for that to happen
        usernameTextfield.placeholder = "Username"
        usernameTextfield.layer.borderColor = UIColor.lightGray.cgColor
        usernameTextfield.leftViewMode = .always
        usernameTextfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 1)) // just add a 10 padding for the content
        usernameTextfield.layer.borderWidth = 1
        usernameTextfield.layer.cornerRadius = 10
        return usernameTextfield
    }()
    
    let passwordTextfield: UITextField = {
        let passwordTextfield = UITextField()
        passwordTextfield.translatesAutoresizingMaskIntoConstraints = false // we need to use autolayout so we need to disable autoresizing mask for that to happen
        passwordTextfield.placeholder = "Password"
        passwordTextfield.isSecureTextEntry = true // well it wouldn't be a password field if it's not secure
        passwordTextfield.leftViewMode = .always
        passwordTextfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 1)) // just add a 10 padding for the content
        passwordTextfield.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextfield.layer.borderWidth = 1
        passwordTextfield.layer.cornerRadius = 10
        return passwordTextfield
    }()
    
    let loginButton: UIButton = {
        let loginButton = UIButton(type: .custom) // or just UIButton() will do just fine
        loginButton.translatesAutoresizingMaskIntoConstraints = false // we need to use autolayout so we need to disable autoresizing mask for that to happen
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .systemBlue
        loginButton.layer.cornerRadius = 10
        return loginButton
    }()
    
    override func loadView() {
        let mainView = UIView(frame: UIScreen.main.bounds)
        mainView.backgroundColor = .white
        // let's add all the view components
        mainView.addSubview(welcomeTitle)
        mainView.addSubview(usernameTextField)
        mainView.addSubview(passwordTextfield)
        mainView.addSubview(loginButton)
        self.view = mainView
        // need to call the setup of constraints here. I like to call my function as setupConstraints
        setupConstraints()
    }
    
    private func setupConstraints() {
        // since everything seems to be one after the other vertically, I would setup the horizontal constraints of each element first
        
        // Setup horizontal constraints for welcome title
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[welcomeTitle]|",
                                                                options: [],
                                                                metrics: nil,
                                                                views: ["welcomeTitle": welcomeTitle]))
        
        // Setup username with a 20 gap trailing and leading
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[username]-20-|",
                                                                options: [],
                                                                metrics: nil,
                                                                views: ["username": usernameTextField]))
        
        // Setup password with a 20 gap trailing and leading
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[password]-20-|",
                                                                options: [],
                                                                metrics: nil,
                                                                views: ["password": passwordTextfield]))
        
        // Setup login button with a 20 gap trailing and leading
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[login]-20-|",
                                                                options: [],
                                                                metrics: nil,
                                                                views: ["login": loginButton]))
        
        // then setup the vertical constraints
        // Welcome title will have 80 offset from the top
        // Followed by username with a 50 gap between welcome and username, and Username having a 44 height.
        // Followed by password with a 10 gap between username and password, and password will have the same height as username.
        // Followed by login with a 30 gap between password and login, and Login button having a 44 height.
        // Lastly, login will have a greater than zero gap between the superview's bottom.
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-80-[welcomeTitle]-50-[username(==44)]-10-[password(==username)]-30-[login(==44)]->=0-|",
                                                                options: [],
                                                                metrics: nil,
                                                                views: ["welcomeTitle": welcomeTitle,
                                                                        "username": usernameTextField,
                                                                        "password": passwordTextfield,
                                                                        "login": loginButton]))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
