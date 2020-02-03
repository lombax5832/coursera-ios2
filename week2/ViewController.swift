//
//  ViewController.swift
//  week2
//
//  Created by Alexei Snytkine on 1/27/20.
//  Copyright © 2020 Alexei Snytkine. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var filteredImage: UIImage?
    var originalImage: UIImage?
    
    @IBOutlet weak var bottomMenu: UIStackView!
    @IBOutlet var secondaryMenu: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var filterButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Sets an alpha componenet for the secondary menu's background to be a bit transparent
        secondaryMenu.backgroundColor = secondaryMenu.backgroundColor?.withAlphaComponent(0.5)
        
        //Disable the autoresizing mask, so we can do it ourselves
        secondaryMenu.translatesAutoresizingMaskIntoConstraints = false
        
        //Sets our sample image
        originalImage = UIImage(named: "scenery.png")
        imageView.image = originalImage
    }
    
    @IBAction func onShare(_ sender: Any) {
        let activityController = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: nil)
        
        present(activityController, animated: true, completion: nil)
    }
    
    @IBAction func onNewPhoto(_ sender: Any) {
        let actionSheet = UIAlertController(title: "New Photo", message: nil, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { action in
            self.showCamera()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Album", style: .default, handler: { action in
            self.showAlbum()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        self.present(actionSheet, animated:true, completion:nil)
    }
    
    func showCamera(){
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.sourceType = .camera
        
        present(cameraPicker, animated:true, completion:nil)
    }
    
    func showAlbum(){
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.sourceType = .photoLibrary
        
        present(cameraPicker, animated:true, completion:nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageView.image = image
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    //A simple toggle implementation
    @IBAction func onFilter(_ sender: UIButton) {
        if(sender.isSelected){
            hideSecondaryMenu()
            sender.isSelected = false
        }else{
            showSecondaryMenu()
            sender.isSelected = true
        }
        
    }
    
    func showSecondaryMenu(){
        view.addSubview(secondaryMenu)
        
        //Creates constraints for our secondary menu
        let bottomConstraint = secondaryMenu.bottomAnchor.constraint(equalTo: bottomMenu.topAnchor)
        let leftConstraint = secondaryMenu.leftAnchor.constraint(equalTo: view.leftAnchor)
        let rightConstraint = secondaryMenu.rightAnchor.constraint(equalTo: view.rightAnchor)
        let heightConstraint = secondaryMenu.heightAnchor.constraint(equalToConstant: 44)
        
        NSLayoutConstraint.activate([bottomConstraint, leftConstraint, rightConstraint, heightConstraint])
        
        //Updates to match constraints
        view.layoutIfNeeded()
        
        
        
        //Makes the menu appear
        self.secondaryMenu.alpha = 0.0
        UIView.animate(withDuration: 0.4, animations: {
            self.secondaryMenu.alpha = 1.0
        })
    }
    
    func hideSecondaryMenu(){
        //Smoothly hide the menu
        UIView.animate(withDuration: 0.4,
            animations:{self.secondaryMenu.alpha = 0;},
            completion:{[weak self] finished in
                self?.secondaryMenu.removeFromSuperview()
        })
    }
    
}

