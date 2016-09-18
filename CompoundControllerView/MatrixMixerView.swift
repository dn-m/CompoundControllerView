//
//  MatrixMixerView.swift
//  CompoundControllerView
//
//  Created by James Bean on 9/18/16.
//
//

// TODO: Inject LayoutTools
import QuartzCore
import CompoundController
import ControllerElements

public class MatrixMixerView: CompoundControllerView {
    
    public init(frame: CGRect, matrixMixer: MatrixMixer) {
        super.init(frame: frame)
        self.frame = frame
        createDials()
        layoutDials()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createDials() {
        let dial = Dial(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        addSublayer(dial)
    }
    
    private func layoutDials() {
        
    }
}
