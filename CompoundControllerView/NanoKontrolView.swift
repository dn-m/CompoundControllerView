//
//  NanoKontrolView.swift
//  CompoundControllerView
//
//  Created by James Bean on 10/16/16.
//
//

import QuartzCore

public class NanoKontrolView: CompoundControllerView {
    
    // TODO: make dictionary of channels by index
    public var channels: [NanoKontrolChannel] = []
    
    // TODO: add 8 channels and master
    public override init(frame: CGRect) {
        super.init(frame: frame)
        createChannels()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createChannels() {
        var accumLeft: CGFloat = 0
        for i in 0 ..< 8 {
            let width = frame.width / 8
            let channel = NanoKontrolChannel(frame: CGRect(x: accumLeft, y: 0, width: width, height: frame.height))
            channels.append(channel)
            addSublayer(channel)
            accumLeft += width
        }
    }
}
