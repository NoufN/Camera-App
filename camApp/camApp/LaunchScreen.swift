//
//  LaunchScreen.swift
//  camApp
//
//  Created by nouf on 02/12/2021.
//

import UIKit

class LaunchScreen: UIViewController {

    var myImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myImage)
        myImage.image = UIImage(named: "camera")
       
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myImage.center = view.center
        view.backgroundColor = .white
        DispatchQueue.main.asyncAfter(deadline: .now()+0.9, execute: {
                        self.animate()
        })
    }
    
    private func animate() {
        UIView.animate(withDuration: 3, animations: {
            let size = self.view.frame.size.width * 3
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size
            self.myImage.frame = CGRect(
                x: -(diffX/2),
                y: diffY/2,
                width: size,
                height: size
            )
        })
        UIView.animate(withDuration: 1, animations: {
            self.myImage.alpha = 0
        }, completion: { done in
            if done {
                DispatchQueue.main.asyncAfter(deadline: .now()+0.1, execute: {
                    let LoginScreen =  LoginScreen()
                    LoginScreen.modalPresentationStyle = .fullScreen
                    self.present(LoginScreen, animated: true)
                })
            }
        })
    }
 
}
