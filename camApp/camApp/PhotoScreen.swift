//
//  PhotoScreen.swift
//  camApp
//
//  Created by nouf on 02/12/2021.
//


import UIKit

class PhotoScreen: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    var collectionView: UICollectionView?
    var arrimage = [UIImage]()
    
    var labelName = UILabel(frame: CGRect(x: 15, y: 60, width: 374, height: 55))
    var photo = UIImageView(frame: CGRect(x: 20, y: 136, width: 350, height: 550 ))
    var takePhoto = UIButton (frame: CGRect(x: 75, y: 720 , width: 265, height: 45))
    var name = "Nouf"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //collectionView
        setupCollectionView()
        
        //         label name
        view.addSubview(labelName)
        labelName.textAlignment = .center
        labelName.textColor = .black
        labelName.font = UIFont(name:"Helvetica-BoldOblique", size: 25)
        labelName.text = "\(name)'s Photo"
        
        //        image
        view.addSubview(photo)
        photo.image = UIImage(named: "no_photos")
        
        view.addSubview(takePhoto)
        takePhoto.backgroundColor = .black
        takePhoto.layer.cornerRadius = 20
        takePhoto.setTitle("Take a Picture!", for: .normal)
        takePhoto.addTarget( self, action: #selector(camera) , for: .touchDown )
    }
    
    
    
    @objc func camera() {
        
        let cameraView = UIImagePickerController()
        cameraView.delegate = self
        cameraView.sourceType = .camera
        photo.image = .none
        self.present(cameraView, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        save(image:pickedImage!)
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func save(image :UIImage) {
        
        arrimage.append(image)
        collectionView?.reloadData()
        
    }
}



// MARK: - Collection View




extension PhotoScreen: UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    
    fileprivate func setupCollectionView() {
        collectionView = UICollectionView(frame: CGRect(x: 20, y: 136, width: 350, height: 550  ), collectionViewLayout: UICollectionViewFlowLayout())
        collectionView?.delegate = self
        collectionView?.dataSource = self
        //        collectionView?.backgroundColor = .gray
        collectionView?.register( CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        view.addSubview(collectionView!)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrimage.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        cell.image.image = arrimage[indexPath.row]
        cell.layer.cornerRadius = 15
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 166 , height: 150 )
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 0.2
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return  10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let select =  arrimage[indexPath.row]
        let ShowPhoto =  ShowPhotos()
        ShowPhoto.photo.image = select
        self.present( ShowPhoto, animated: true)
    }
    
}
