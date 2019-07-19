//
//  Pin.swift
//  VEMS
//
//  Created by Venkat Krishnamoorthy on 7/17/19.
//  Copyright © 2019 Volunteers. All rights reserved.
//
import UIKit
import Firebase

class PinController: UIViewController {
    
    // MARK: - Properties
    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        //SETS LOGO IMAGE
        iv.image = #imageLiteral(resourceName: "Logo")
        return iv
    }()
    
    lazy var stackView: UIStackView = {
        let order =  UIStackView(arrangedSubviews: [PinString, PinButton])
        order.translatesAutoresizingMaskIntoConstraints = false
        order.axis = .vertical
        order.spacing = 30
        order.distribution = .fillEqually
        return order
    }()
    
    let PinButton: UIButton = {
        let pin = UIButton(type: .system)
        pin.setTitle("Click to enter pin", for: .normal)
        pin.titleLabel?.font = UIFont.systemFont(ofSize: 44)
        pin.setTitleColor(UIColor.mainBlue(), for: .normal)
        pin.backgroundColor = .white
        pin.layer.cornerRadius = 5
        pin.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        pin.addTarget(self, action: #selector(handleJoinEvent), for: .touchUpInside)
        return pin
    }()
    
    
    let PinString: UITextField = {
        let pin = UITextField(frame: CGRect(x: 10.0, y: 100.0, width: UIScreen.main.bounds.size.width - 30.0, height: 30.0))
        pin.backgroundColor = .white
        pin.borderStyle = .line
        pin.keyboardType = .numberPad
        return pin
    }()
    
    
    var joinLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alpha = 0
        
        return label
    }()
    
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    //VERIFIES IF PIN EXISTS
    @objc func handleJoinEvent() {
        print("handlejoinevent TEST")
        
        let text = PinString.text
        let eventCode = Int(text!)
        print(eventCode as Any)
        Database.database().reference().child("events").queryOrdered(byChild: "Expected Volunteers")
        Database.database().reference().child("events").queryOrdered(byChild: "Event Code").queryEqual(toValue: eventCode).observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot.exists() {
                print("Pin Valid")
                self.navigationController?.pushViewController(JoinEventController(), animated: true)
                
                let expAmtVolunteers = 0
                let eventDict = ["Expected Volunteers": expAmtVolunteers] as [String : Any]
                Database.database().reference().child("events").child(text!).updateChildValues(["Expected Volunteers": expAmtVolunteers + 1])
                
                
            } else {
                print("Pin not found.")
                let alert = UIAlertController(title: "Error", message: "Please enter a valid PIN.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
                return
            }

          }
        )
    }
    
    // MARK: - Helper Functions
    
    func configureViewComponents(){
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "065 Burning Spring.png")!)
        
        navigationItem.title = "Enter the Pin"
        
        
        view.addSubview(stackView)
        view.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = false
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = false
        stackView.heightAnchor.constraint(equalToConstant: view.frame.height/2)
        stackView.widthAnchor.constraint(equalToConstant: view.frame.width/1)
        
    }
    
}

