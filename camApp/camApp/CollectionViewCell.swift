//
//  CollectionViewCell.swift
//  camApp
//
//  Created by nouf on 04/12/2021.
//

import UIKit


class CollectionViewCell: UICollectionViewCell {

  
 let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 166, height: 150 ))
       
   
    override init( frame: CGRect){
//
        super.init(frame:.zero)
        
        contentView.addSubview(image)
        image.contentMode = .scaleToFill
               image.clipsToBounds = true
        image.layer.cornerRadius = 15
          
 image.topAnchor.constraint(equalTo:  contentView.topAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
}

