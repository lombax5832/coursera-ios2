//
//  ViewController.swift
//  week2
//
//  Created by Alexei Snytkine on 1/27/20.
//  Copyright © 2020 Alexei Snytkine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageOrig: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "scenery.png")!
        var rgbaImage = RGBAImage(image: image)!
        
        imageOrig.image = image
        
        //let pixelCount = rgbaImage.width * rgbaImage.height
        let avgRed = 107
        //let avgGreen = 109
        //let avgBlue = 110
        //let sum = avgRed + avgGreen + avgBlue
        
        for y in 0..<rgbaImage.height {
            for x in 0..<rgbaImage.width {
                let index = y*rgbaImage.width + x
                
                var pixel = rgbaImage.pixels[index]
                
                let redDelta = Int(pixel.red) - avgRed
                //let greenDelta = Int(pixel.green) - avgGreen
                //let blueDelta = Int(pixel.blue) - avgBlue
                
                var modifier = 1 + 10*(Double(y)/Double(rgbaImage.height))
                if (Int(pixel.red)<avgRed) {
                    modifier = 1
                }
                
                pixel.red = UInt8(max(min(255, Int(round(Double(avgRed) + modifier*Double(redDelta)))), 0))
                
                rgbaImage.pixels[index] = pixel
            }
        }
        
        let result = rgbaImage.toUIImage()
        
        print("This code has executed")
        
        imageView.image = result
    }


}

