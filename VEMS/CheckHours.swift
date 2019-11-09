//
//  CheckHours.swift
//  VEMS
//
//  Created by Sri Julapally on 10/24/19.
//  Copyright © 2019 Volunteers. All rights reserved.
//

import Foundation
import UIKit

class hoursController: UIViewController{
    
    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        //SETS LOGO IMAGE
        iv.image = UIImage(named: "SmallLogo")
        return iv
    }()
    
    var emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email: volunteer@test.com"
        return label
    }()
    
    var eventCode: UILabel = {
        let code = UILabel()
        code.textColor = .white
        code.font = UIFont.systemFont(ofSize: 28)
        code.translatesAutoresizingMaskIntoConstraints = false
        code.text = "Event Code: 547563"
        return code
    }()
    
    var showedUp: UILabel = {
        let showed = UILabel()
        showed.textColor = .white
        showed.font = UIFont.systemFont(ofSize: 28)
        showed.translatesAutoresizingMaskIntoConstraints = false
        showed.text = "Showed Up: Yes"
        return showed
    }()
    
    var hoursLabel: UILabel = {
        let hours = UILabel()
        hours.textColor = .white
        hours.font = UIFont.systemFont(ofSize: 28)
        hours.translatesAutoresizingMaskIntoConstraints = false
        hours.text = "Hours: 3"
        return hours
    }()
    
    lazy var stackView: UIStackView = {
        let order =  UIStackView(arrangedSubviews: [emailLabel, hoursLabel, eventCode, showedUp])
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
        
        navigationItem.title = "Check your hours"
        
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
