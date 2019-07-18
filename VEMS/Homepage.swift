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
    
    //BUTTONS STACKVIEW
    
    lazy var stackView: UIStackView = {
        let order =  UIStackView(arrangedSubviews: [createEventButton, joinEventButton])
        order.translatesAutoresizingMaskIntoConstraints = false
        order.axis = .vertical
        order.spacing = 10
        order.distribution = .fillEqually
        
        
        return order
    }()
    
    
    let createEventButton: UIButton = {
        let createEvent = UIButton(type: .system)
        createEvent.setTitle("Create Event", for: .normal)
        createEvent.titleLabel?.font = UIFont.systemFont(ofSize: 44)
        createEvent.setTitleColor(UIColor.mainBlue(), for: .normal)
        createEvent.backgroundColor = .white
        createEvent.layer.cornerRadius = 5
        createEvent.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        createEvent.addTarget(self, action: #selector(handleCreateEvent), for: .touchUpInside)
        createEvent.addTarget(self, action: #selector(eventsDatabase), for: .touchUpInside)
        return createEvent
    }()
    
    let joinEventButton: UIButton = {
        let joinEvent = UIButton(type: .system)
        joinEvent.setTitle("Join Event", for: .normal)
        joinEvent.titleLabel?.font = UIFont.systemFont(ofSize: 44)
        joinEvent.setTitleColor(UIColor.mainBlue(), for: .normal)
        joinEvent.backgroundColor = .white
        joinEvent.layer.cornerRadius = 5
        joinEvent.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        joinEvent.addTarget(self, action: #selector(handlePin), for: .touchUpInside)
        return joinEvent
    }()
    
    // Events Database Function
    @objc func eventsDatabase(){
        print("/////// eventsDatabase run 1")
        //uid is the unique identifier for the user. this line puts it to a variable
        guard let userID = Auth.auth().currentUser?.uid else { return }
        //this is the key value pair, replace with anything needed
        var eventName = "Open House"
        var eventCode = Int.random(in: 100000 ... 999999)
        print(eventCode)
        var expAmtVolunteers = 0
        var actualAmount = 0
        let eventDict = ["Event Name": eventName, "testEvent": eventCode, "Expected Volunteers": expAmtVolunteers, "Actual Amount of Volunteers": actualAmount] as [String : Any]
        //this updates it to the database. call this function into a button press, submit button, etc
        Database.database().reference().child("events").childByAutoId().updateChildValues(eventDict, withCompletionBlock: { (error, ref) in
            if let error = error{
                print("Failed to update database values with error: : ", error.localizedDescription)
                return
            }
            //you can check console to see if it worked instead of going into firebase
            print("Test is working")
        })
    }
 
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authenticateUserAndConfigureView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: - Selectors
    
    @objc func handleCreateEvent() {
        navigationController?.pushViewController(CreateEventController(), animated: true)
    }
    
    @objc func handlePin() {
        print("/////// handlepintest 2")
        navigationController?.pushViewController(PinController(), animated: true)
    }
    

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
        
        /*if Auth.auth().currentUser == nil {
            DispatchQueue.main.async{
                let navController = UINavigationController(rootViewController: LoginController())
                navController.navigationBar.barStyle = .black
                self.present(navController, animated: true, completion: nil)
            }
        }*/
            configureViewComponents()
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
        
        view.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = false
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = false
        stackView.heightAnchor.constraint(equalToConstant: view.frame.height/2)
        stackView.widthAnchor.constraint(equalToConstant: view.frame.width/1)
        

        /*
        view.addSubview(joinEventButton)
        joinEventButton.anchor(top: welcomeLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 16, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(createEventButton)
        createEventButton.anchor(top: joinEventButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 24, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        */
    }
}
