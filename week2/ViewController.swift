//
//  ViewController.swift
//  week2
//
//  Created by Alexei Snytkine on 1/27/20.
//  Copyright © 2020 Alexei Snytkine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var filteredImage: UIImage?
    var originalImage: UIImage?
    
    @IBOutlet weak var bottomMenu: UIStackView!
    @IBOutlet var secondaryMenu: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var filterButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondaryMenu.backgroundColor = secondaryMenu.backgroundColor?.withAlphaComponent(0.5)
        
        secondaryMenu.translatesAutoresizingMaskIntoConstraints = false
        
        originalImage = UIImage(named: "scenery.png")
        
        imageView.image = originalImage
    }

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
        
        let bottomConstraint = secondaryMenu.bottomAnchor.constraint(equalTo: bottomMenu.topAnchor)
        let leftConstraint = secondaryMenu.leftAnchor.constraint(equalTo: view.leftAnchor)
        let rightConstraint = secondaryMenu.rightAnchor.constraint(equalTo: view.rightAnchor)
        
        let heightConstraint = secondaryMenu.heightAnchor.constraint(equalToConstant: 44)
        
        NSLayoutConstraint.activate([bottomConstraint, leftConstraint, rightConstraint, heightConstraint])
        
        view.layoutIfNeeded()
    }
    
    func hideSecondaryMenu(){
        secondaryMenu.removeFromSuperview()
    }
    
}

