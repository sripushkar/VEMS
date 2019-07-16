//
//  HomeController.swift
//  VEMS
//
//  Created by Sri Julapally on 7/13/19.
//  Copyright © 2019 Volunteers. All rights reserved.
//
import UIKit
import Firebase

class HomeController: UIViewController {
    
    // MARK: - Properties
    
    var welcomeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alpha = 0
        return label
    }()
    
    let createEventButton: UIButton = {
        let createEvent = UIButton(type: .system)
        createEvent.setTitle("CREATE EVENT", for: .normal)
        createEvent.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        createEvent.setTitleColor(UIColor.mainBlue(), for: .normal)
        createEvent.backgroundColor = .white
        //createEvent.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        createEvent.layer.cornerRadius = 5
        return createEvent
    }()
    
    let joinEventButton: UIButton = {
        let joinEvent = UIButton(type: .system)
        joinEvent.setTitle("JOIN EVENT", for: .normal)
        joinEvent.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        joinEvent.setTitleColor(UIColor.mainBlue(), for: .normal)
        joinEvent.backgroundColor = .white
        //createEvent.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        joinEvent.layer.cornerRadius = 5
        return joinEvent
    }()
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authenticateUserAndConfigureView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: - Selectors
    
    @objc func handleSignOut(){
        let alertController = UIAlertController(title: nil, message: "Are you sure you want to sign out?", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { (_) in
            self.signOut()
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - API
    
    func signOut() {
        do{
            try Auth.auth().signOut()
            let navController = UINavigationController(rootViewController: LoginController())
            navController.navigationBar.barStyle = .black
            self.present(navController, animated: true, completion: nil)
        }
        catch let error {
            print("Failed to sign out with error..", error)
        }
        
    }
    
    func authenticateUserAndConfigureView(){
        
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async{
                let navController = UINavigationController(rootViewController: LoginController())
                navController.navigationBar.barStyle = .black
                self.present(navController, animated: true, completion: nil)
            }
        }
        else{
            configureViewComponents()
        }
    }
    
    // MARK: - Helper Functions
    
    func configureViewComponents(){
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "065 Burning Spring.png")!)
        
        navigationItem.title = "Welcome to VEMS"
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "baseline_arrow_back_white_24dp"), style: .plain, target: self, action: #selector(handleSignOut))
        /*
        navigationItem.leftBarButtonItem?.tintColor = .white
        navigationController?.navigationBar.barTintColor = UIColor.magenta
        */
        
        view.addSubview(welcomeLabel)
        welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        //CENTER BUTTONS HERE
        
        view.addSubview(joinEventButton)
        joinEventButton.anchor(top: welcomeLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 16, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(createEventButton)
        createEventButton.anchor(top: joinEventButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 24, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
    }
}

