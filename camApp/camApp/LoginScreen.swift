//
//  LoginScreen.swift
//  camApp
//
//  Created by nouf on 02/12/2021.
//

import UIKit

class LoginScreen: UIViewController {
    
    let mainLebel = UILabel()
    let name = UILabel()
    let textName = UITextField()
    let password = UILabel()
    let textPassword = UITextField()
    let myButton = UIButton()
    let alertLebel = UILabel()
    let img = UIImageView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //title
        mainLebel.frame = CGRect(x: 90, y: 100, width: 200, height: 100)
        mainLebel.numberOfLines = 0
        mainLebel.text = "Welcome To\nYour Camera App"
        mainLebel.textAlignment = .center
        mainLebel.textColor = .black
        mainLebel.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(mainLebel)
        //logo img
        img.frame = CGRect(x: 120, y: 250, width: 150, height: 150)
        img.image = UIImage(named: "camera")
        view.addSubview(img)
        //name lebel
        name.frame = CGRect(x: 40, y: 470, width: 200, height: 30)
        name.text = "Name"
        name.textColor = .black
        view.addSubview(name)
        //name text field
        textName.frame = CGRect(x: 40, y: 500, width: 300, height: 30)
        textName.backgroundColor = .white
        textName.textColor = .black
        textName.placeholder = "Enter your name"
        view.addSubview(textName)
        //password lebel
        password.frame = CGRect(x: 40, y: 540, width: 200, height: 30)
        password.text = "Password"
        password.textColor = .black
        view.addSubview(password)
        //password text field
        textPassword.frame = CGRect(x: 40, y: 570, width: 300, height: 30)
        textPassword.placeholder = "password"
        textPassword.textColor = .black
        textPassword.backgroundColor = .white
        textPassword.isSecureTextEntry = true
        view.addSubview(textPassword)
        //button
        myButton.frame = CGRect(x: 70, y: 650, width: 250, height: 45)
        myButton.backgroundColor = .black
        myButton.layer.cornerRadius = 15
        myButton.setTitle("Login", for: .normal)
        myButton.addTarget(self, action: #selector (loginState), for: .touchDown)
        view.addSubview(myButton)
        //alert
        alertLebel.frame = CGRect(x: 55, y: 720, width: 300, height: 30)
        alertLebel.text = "You don't have an account? Sign up"
        alertLebel.textColor = .black
        view.addSubview(alertLebel)
        //ViewController
        view.backgroundColor = .white
        
    }
    
    @objc func loginState(){
        if textName.text == "Nora" &&  textPassword.text == "123"
        {
            let photoScreen = PhotoScreen()
            photoScreen.name = textName.text!
            photoScreen.modalPresentationStyle = .fullScreen
            present(photoScreen, animated: true , completion: nil)
        } else {
            print("Eerro")
        }
    }
    
    override func touchesBegan( _ touches:
                                Set<UITouch> , with event:UIEvent?) {
        self.view.endEditing(true)
    }
    
//    func textFieldShouldReturn(_ textField:
//                               UITextField) -> Bool {
//        textName.resignFirstResponder()
//        textPassword.resignFirstResponder()
//        return (true)
//    }


    
}
