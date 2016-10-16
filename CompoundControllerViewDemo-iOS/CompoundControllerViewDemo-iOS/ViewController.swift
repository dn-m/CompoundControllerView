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
        
        let eq = GraphicEqualizerView(frame: CGRect(x: 100, y: 100, width: 400, height: 200))
        view.layer.addSublayer(eq)
        
        eq[2].ramp(to: 0.5, over: 20)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
