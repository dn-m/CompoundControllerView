//
//  GraphicEqualizerView.swift
//  CompoundControllerView
//
//  Created by James Bean on 9/20/16.
//
//

import QuartzCore
import Color
import ControllerElements

// TODO: Add lines at -12, -6, 0, 6, 12
public class GraphicEqualizerView: CompoundControllerView {
    
    private var sliders: [Slider] = []
    
    // TODO: Create dictionary of [label: slider]
    
    private let bands = [
        "GAIN",
        "31.25",
        "62.5",
        "125",
        "250",
        "500",
        "1K",
        "2K",
        "4K",
        "8K",
        "16K"
    ]
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        createSliders()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public subscript (slider: UInt) -> Slider {
        
        get {
            return sliders[Int(slider)]
        }
        
        set {
            sliders[Int(slider)] = newValue
        }
    }
    
    private func createSliders() {
        let width = frame.width / CGFloat(bands.count)
        
        self.sliders = bands.enumerated().map { i, label in
            let left = frame.width * (CGFloat(i) / CGFloat(bands.count))
            let origin = CGPoint(x: left, y: 0)
            let size = CGSize(width: width, height: frame.height)
            let slider = Slider(frame: CGRect(origin: origin, size: size), label: label)
            addSublayer(slider)
            return slider
        }
    }
    
    private func layoutSliders() {
        // TODO
    }
}
