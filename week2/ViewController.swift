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
        
        //Sets an alpha componenet for the secondary menu's background to be a bit transparent
        secondaryMenu.backgroundColor = secondaryMenu.backgroundColor?.withAlphaComponent(0.5)
        
        //Disable the autoresizing mask, so we can do it ourselves
        secondaryMenu.translatesAutoresizingMaskIntoConstraints = false
        
        //Sets our sample image
        originalImage = UIImage(named: "scenery.png")
        imageView.image = originalImage
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

