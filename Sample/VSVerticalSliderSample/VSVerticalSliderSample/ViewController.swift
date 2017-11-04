//
//  ViewController.swift
//  VSVerticalSliderSample
//
//  Created by Vincent Smithers on 10/23/17.
//  Copyright © 2017 Vincent Smithers. All rights reserved.
//

import UIKit
import VSVerticalSlider

class ViewController: UIViewController, VSVerticalSliderDelegate {
    
    @IBOutlet weak var sliderContainerView: UIView!
    @IBOutlet weak var percentageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSlider()
    }

    private func setupSlider() {
        let frameworkBundle = Bundle(for: self.classForCoder)
        print(frameworkBundle)
        let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent("VSVerticalSlider/Assets.xcassets")
        print(bundleURL)
        let resourceBundle = Bundle(url: bundleURL!)
        print(resourceBundle.image)
        let imagex = UIImage(named: "plus.png", in: resourceBundle, compatibleWith: nil)
        print(imagex)
        let image = UIImage(named: "test")
        let imagexx = UIImage(named: "plus.png")
        print(imagex ?? "no image x")
        print(imagexx ?? "no image xx")
        let primaryColor = UIColor.init(red: 70 / 255, green: 150 / 255, blue: 200 / 255, alpha: 1.0)
        let slider = VerticalSlider(height: sliderContainerView.frame.height - 40.0, primaryColor: primaryColor, positiveImage: image!, negativeImage: image!, offsetX: 20, offsetY: 60)
        slider.delegate = self
        sliderContainerView.addSubview(slider)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func valueDidChange(value: Int) {
        percentageLabel.text = "\(value) %"
    }
}

