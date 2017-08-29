//
//  DrawView.swift
//  AppRimanda
//
//  Created by Angelo Vittorio Zapponi on 20/04/15.
//  Copyright (c) 2015 Angelo Vittorio Zapponi. All rights reserved.
//

import UIKit

class DrawView: UIView {
    
    var lines: [Line] = []
    var lastPoint: CGPoint!
    var reduction :CGFloat = 1.0
    var origin: CGPoint = CGPoint.zero
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        lastPoint = touch!.location(in: self)
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let newPoint = touch!.location(in: self)
        lines.append(Line(start: lastPoint, end: newPoint))
        lastPoint = newPoint
        self.setNeedsDisplay()
    }

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
//        var col = UIColor.yellowColor().CGColor
//        CGContextSetFillColorWithColor(context, col)
//        CGContextFillRect(context, rect)
        context?.beginPath()
        for line in lines{
            context?.move(to: CGPoint(x: origin.x + line.start.x * reduction, y: origin.y + line.start.y * reduction))
            context?.addLine(to: CGPoint(x: origin.x + line.end.x * reduction, y: origin.y + line.end.y * reduction))
        }
        context?.setLineCap(CGLineCap.round)
        context?.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        context?.setLineWidth(1)
        context?.strokePath()
    }

}
