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
    

    
    @objc func handleJoinEvent() {
        print("/////// handlejoinevent run")
        navigationController?.pushViewController(JoinEventController(), animated: true)
        /*
        let eventCode = "930156"
        let rootRef = Database.database().reference()
        let childRef = Database.database().reference(withPath: "events")
        let itemsRef = rootRef.child("events")
        let eventcodeRef = itemsRef.child(eventCode)
        
        print("//////  Rootref key is 1")
        print(rootRef.key)
        print("//////  Childref key is 2")
        print(childRef.key)
        print("//////  itemsref key is 3")
        print(itemsRef.key)
        print("////// eventcoderef key is 4")
        print(eventcodeRef)
        Database.database().reference().child("events"). ("eventCode").isEqual(eventCode) { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject]{
                print(dictionary ["Event Name"] as? String)
            }
            //you can check console to see if it worked instead of going into firebase
            else {
            print("Test is not working")
            }
        })*/
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

