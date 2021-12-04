//
//  ShowPhotos.swift
//  camApp
//
//  Created by nouf on 04/12/2021.
//

import UIKit

class ShowPhotos: UIViewController {
    var photo = UIImageView(frame: CGRect(x: 20, y: 136, width: 350, height: 550 ))

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(photo)
        view.backgroundColor = .white

        
    }
    


}
