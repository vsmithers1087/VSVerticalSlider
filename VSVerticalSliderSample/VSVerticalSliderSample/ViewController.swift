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
        let primaryColor = UIColor.init(red: 70 / 255, green: 150 / 255, blue: 200 / 255, alpha: 1.0)
        let slider = VerticalSlider(height: sliderContainerView.frame.height - 40.0, primaryColor: primaryColor, offsetX: 20, offsetY: 63)
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

