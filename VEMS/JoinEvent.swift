//
//  JoinEvent.swift
//  VEMS
//
//  Created by Venkat Krishnamoorthy on 7/16/19.
//  Copyright © 2019 Volunteers. All rights reserved.
//
import UIKit
import Firebase

class JoinEventController: UIViewController {
    
    // MARK: - Properties
    
    var a = 1
    
    let image1 = UIImageView()
    
    lazy var stackView: UIStackView = {
        let order =  UIStackView(arrangedSubviews: [CodeString, GenerateCodeButton, SaveImageButton, qrImage])
        order.translatesAutoresizingMaskIntoConstraints = false
        order.axis = .vertical
        order.spacing = 20
        order.distribution = .fillEqually
        return order
    }()
    
    /*let CodeImageView: UIImageView = {
        let image = UIImageView()
        image.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        return image
    }()
    */
    
    let CodeString: UITextField = {
        let string1 = UITextField(frame: CGRect(x: 10.0, y: 100.0, width: UIScreen.main.bounds.size.width - 30.0, height: 30.0))
        string1.backgroundColor = .white
        string1.borderStyle = .line
        return string1
    }()
    
    
    let GenerateCodeButton: UIButton = {
        let generatecode = UIButton(type: .system)
        generatecode.setTitle("Generate QR Code", for: .normal)
        generatecode.titleLabel?.font = UIFont.systemFont(ofSize: 44)
        generatecode.setTitleColor(UIColor.mainBlue(), for: .normal)
        generatecode.backgroundColor = .white
        generatecode.layer.cornerRadius = 5
        generatecode.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        generatecode.addTarget(self, action: #selector(handleGeneratingCode), for: .touchUpInside)
        return generatecode
    }()
    
    
    let SaveImageButton: UIButton = {
        let joinEvent = UIButton(type: .system)
        joinEvent.setTitle("Save Image", for: .normal)
        joinEvent.titleLabel?.font = UIFont.systemFont(ofSize: 44)
        joinEvent.setTitleColor(UIColor.mainBlue(), for: .normal)
        joinEvent.backgroundColor = .white
        joinEvent.layer.cornerRadius = 5
        joinEvent.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        joinEvent.addTarget(self, action: #selector(buttonScreenShot), for: .touchUpInside)
        return joinEvent
    }()
    
    
    var joinLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alpha = 0
        
        return label
    }()
    
    
    
    
    var qrImage: UIImageView = {
        
        
        let image1 = UIImageView()
        /*
        image1.translatesAutoresizingMaskIntoConstraints = false
        image1.centerXAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutXAxisAnchor>#>, constant: 100)
        // image.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        image1.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100).isActive = true
 
        image1.widthAnchor.constraint(equalToConstant: 150).isActive = true
        image1.heightAnchor.constraint(equalToConstant: 150).isActive = true
 */
        return image1
    }()
    
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image1 = UIImageView()
        //view.addSubview(image1)
        
        

        
        configureViewComponents()
        // Do any additional setup after loading the view, typically from a nib.

        SaveImageButton.isEnabled = false
    }
    
    
    // MARK: - Helper Functions
    @objc func handleGeneratingCode() {
        
        /*
        if let myString = CodeString.text{
            
            let data = myString.data(using: .ascii, allowLossyConversion: false)
            let filter = CIFilter(name: "CIQRCodeGenerator")
            filter?.setValue(data, forKey: "InputMessage")
            
            let ciImage = filter?.outputImage
            
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let transformImage = ciImage?.transformed(by: transform)
            
            let image = UIImage(ciImage: transformImage!)
            image1.image = image
            
            
            SaveImageButton.isEnabled = true
            
        }*/
        
        
        
    }
    
    
    @objc func buttonScreenShot(){
        
        let layer = UIApplication.shared.keyWindow!.layer
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale)
        
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        UIImageWriteToSavedPhotosAlbum(screenshot!, nil, nil, nil)
        
    }
    

    func configureViewComponents(){
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "065 Burning Spring.png")!)
        
        navigationItem.title = "Join Event"
        
        /*
         navigationItem.leftBarButtonItem?.tintColor = .white
         navigationController?.navigationBar.barTintColor = UIColor.magenta
         */
        
        view.addSubview(joinLabel)
        joinLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        joinLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = false
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = false
        stackView.heightAnchor.constraint(equalToConstant: view.frame.height/2)
        stackView.widthAnchor.constraint(equalToConstant: view.frame.width/1)
        
    }
    
}

