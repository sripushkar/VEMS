//
//  File.swift
//  VEMS
//
//  Created by Venkat Krishnamoorthy on 7/16/19.
//  Copyright © 2019 Volunteers. All rights reserved.
//
import UIKit
import Firebase

class CreateEventController: UIViewController {
    
    // MARK: - Properties
    let scannerOpen: UIButton = {
        let generatecode = UIButton(type: .system)
        generatecode.setTitle("Scan existing event", for: .normal)
        generatecode.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        generatecode.setTitleColor(UIColor.mainBlue(), for: .normal)
        generatecode.backgroundColor = .white
        generatecode.layer.cornerRadius = 5
        generatecode.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        generatecode.addTarget(self, action: #selector(moveToScanner), for: .touchUpInside)
        return generatecode
    }()
    
    let newEvent: UIButton = {
        let generatecode = UIButton(type: .system)
        generatecode.setTitle("Create new event", for: .normal)
        generatecode.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        generatecode.setTitleColor(UIColor.mainBlue(), for: .normal)
        generatecode.backgroundColor = .white
        generatecode.layer.cornerRadius = 5
        generatecode.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        generatecode.addTarget(self, action: #selector(databaseCreateEvent), for: .touchUpInside)
        return generatecode
    }()
    
    
    
    var createLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alpha = 0
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let order =  UIStackView(arrangedSubviews: [newEvent, scannerOpen, createLabel])
        order.translatesAutoresizingMaskIntoConstraints = false
        order.axis = .vertical
        order.spacing = 10
        order.distribution = .fillEqually
        
        
        return order
    }()
    
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    // MARK: - Helper Functions
    
    @objc func databaseCreateEvent() {
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
    
    @objc func moveToScanner() {
        navigationController?.pushViewController(ScannerViewController(), animated: true)
    }
    
    func configureViewComponents(){
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "065 Burning Spring.png")!)
        
        navigationItem.title = "Create Event"
        
        /*
         navigationItem.leftBarButtonItem?.tintColor = .white
         navigationController?.navigationBar.barTintColor = UIColor.magenta
         */
        
        
        view.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = false
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = false
        stackView.heightAnchor.constraint(equalToConstant: view.frame.height/2)
        stackView.widthAnchor.constraint(equalToConstant: view.frame.width/1)
        
    }

}
