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
    
    
    
    
    var createLabel: UILabel = {
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
    
    
    // MARK: - Helper Functions
    
    func configureViewComponents(){
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "065 Burning Spring.png")!)
        
        navigationItem.title = "Create Event"
        
        /*
         navigationItem.leftBarButtonItem?.tintColor = .white
         navigationController?.navigationBar.barTintColor = UIColor.magenta
         */
        
        view.addSubview(createLabel)
        createLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        createLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }

}
