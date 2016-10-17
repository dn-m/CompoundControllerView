//
//  ViewController.swift
//  CompoundControllerViewDemo-iOS
//
//  Created by James Bean on 9/18/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import UIKit
import CompoundControllerView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Test EQ
        let eq = GraphicEqualizerView(frame: CGRect(x: 100, y: 100, width: 600, height: 200))
        view.layer.addSublayer(eq)
        
        eq[2].ramp(to: 0.5, over: 20)
        
        
        // Test NanoKontrol Channel
        let channel = NanoKontrolChannel(frame: CGRect(x: 400, y: 400, width: 100, height: 600))
        
        channel.slider.ramp(to: 1, over: 10)
        channel.dial.ramp(to: 0.2, over: 12)
        
        view.layer.addSublayer(channel)
        
        // Text NanoKontrol
        let nanoKontrol = NanoKontrolView(frame: CGRect(x: 100, y: 200, width: 400, height: 200))
        
        nanoKontrol.channels[6].slider.ramp(to: 1, over: 20)
        
        view.layer.addSublayer(nanoKontrol)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
