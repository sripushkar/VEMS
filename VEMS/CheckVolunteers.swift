//
//  CheckVolunteers.swift
//  VEMS
//
//  Created by Sri Julapally on 10/24/19.
//  Copyright © 2019 Volunteers. All rights reserved.
//

import Foundation
import UIKit

class trackVolunteersController: UIViewController{
    
    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        //SETS LOGO IMAGE
        iv.image = UIImage(named: "SmallLogo")
        return iv
    }()
    
    var eventCode: UILabel = {
        let code = UILabel()
        code.textColor = .white
        code.font = UIFont.systemFont(ofSize: 28)
        code.translatesAutoresizingMaskIntoConstraints = false
        code.text = "Event Code: 547563"
        return code
    }()
    
    var hoursList: UILabel = {
        let hours = UILabel()
        hours.textColor = .white
        hours.font = UIFont.systemFont(ofSize: 28)
        hours.translatesAutoresizingMaskIntoConstraints = false
        hours.text = "Hours: 3"
        return hours
    }()
    
    var expectedVolunteers: UILabel = {
        let expected = UILabel()
        expected.textColor = .white
        expected.font = UIFont.systemFont(ofSize: 28)
        expected.translatesAutoresizingMaskIntoConstraints = false
        expected.text = "Volunteers who signed up: 1"
        return expected
    }()
    
    var actualVolunteers: UILabel = {
        let actual = UILabel()
        actual.textColor = .white
        actual.font = UIFont.systemFont(ofSize: 28)
        actual.translatesAutoresizingMaskIntoConstraints = false
        actual.text = "Volunteers who scanned in: 1"
        return actual
    }()
    
    lazy var stackView: UIStackView = {
        let order =  UIStackView(arrangedSubviews: [eventCode, hoursList, expectedVolunteers, actualVolunteers])
        order.translatesAutoresizingMaskIntoConstraints = false
        order.axis = .vertical
        order.spacing = 10
        order.distribution = .fillEqually
        
        
        return order
    }()
    
    @objc func backPage(){
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
        // other stuff goes here
    }
    
    func configureViewComponents(){
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "065 Burning Spring.png")!)
        
        navigationItem.title = "Track Event"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "baseline_arrow_back_white_24dp"), style: .plain, target: self, action: #selector(backPage))
        
        view.addSubview(logoImageView)
        view.addSubview(stackView)
        
        logoImageView.anchor(top: nil, left: nil, bottom: stackView.topAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 30, paddingRight: 0, width: 0, height: 0)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        stackView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
}
