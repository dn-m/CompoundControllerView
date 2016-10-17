//
//  GraphicEqualizerView.swift
//  CompoundControllerView
//
//  Created by James Bean on 9/20/16.
//
//

import QuartzCore
import Color
import PathTools
import ControllerElements

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
        configureBackground()
        commitSliders()
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
    
    // TODO: add labels for -12, -6, 0, 6, 12
    private func configureBackground() {
        createReferenceLines()
        backgroundColor = Color(gray: 0, alpha: 1).cgColor
    }
    
    private func createYellowBackground() {
        let height = sliders.first!.slotHeight
        let yellowRectPath = Path.rectangle(rectangle: CGRect(x: 0, y: 0, width: frame.width, height: height))
        let yellowRectShape = CAShapeLayer()
        yellowRectShape.path = yellowRectPath.cgPath
        yellowRectShape.fillColor = Color(255, 204, 0, 1).cgColor
        addSublayer(yellowRectShape)
    }
    
    private func createReferenceLines() {
        createThinReferenceLines()
        createThickReferenceLines()
    }
    
    private func createThinReferenceLines() {
        for position: CGFloat in [0,0.5,1.0] {
            
            let altitude = position * sliders.first!.slotHeight
            let linePath = Path()
                .move(to: CGPoint(x: 0, y: altitude))
                .addLine(to: CGPoint(x: frame.width, y: altitude))
            
            let lineLayer = CAShapeLayer()
            lineLayer.path = linePath.cgPath
            lineLayer.lineWidth = 1
            lineLayer.strokeColor = Color(gray: 1, alpha: 0.5).cgColor
            addSublayer(lineLayer)
        }
    }
    
    private func createThickReferenceLines() {
        
        for position: CGFloat in [0.25, 0.75] {
            let altitude = position * sliders.first!.slotHeight
            let linePath = Path()
                .move(to: CGPoint(x: 0, y: altitude))
                .addLine(to: CGPoint(x: frame.width, y: altitude))
            
            let lineLayer = CAShapeLayer()
            lineLayer.path = linePath.cgPath
            lineLayer.lineWidth = 1
            lineLayer.strokeColor = Color(gray: 1, alpha: 0.5).cgColor
            addSublayer(lineLayer)
        }
    }
    
    private func createSliders() {
        let paddingProportion: CGFloat = 0.5
        let width = frame.width / (CGFloat(bands.count) + (CGFloat(bands.count - 1) * paddingProportion))
        
        var accumLeft: CGFloat = 0
        for label in bands {
            let origin = CGPoint(x: accumLeft, y: 0)
            let size = CGSize(width: width, height: frame.height)
            let slider = Slider(frame: CGRect(origin: origin, size: size), label: label)
            
            sliders.append(slider)
            
            accumLeft += width
            accumLeft += paddingProportion * width
        }
    }
    
    private func commitSliders() {
        sliders.forEach { addSublayer($0) }
    }
    
    private func layoutSliders() {
        // TODO
    }
}
