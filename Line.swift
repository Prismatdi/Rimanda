//
//  Line.swift
//  AppRimanda
//
//  Created by Angelo Vittorio Zapponi on 20/04/15.
//  Copyright (c) 2015 Angelo Vittorio Zapponi. All rights reserved.
//

import UIKit

class Line:NSObject, NSCoding{
    
    var start:CGPoint
    var end:CGPoint
    init (start _start:CGPoint, end _end:CGPoint){
        start = _start
        end = _end
    }
    required init?(coder aDecoder: NSCoder) {
        start = aDecoder.decodeCGPoint(forKey: "startPoint")
        end = aDecoder.decodeCGPoint(forKey: "endPoint")
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(start, forKey: "startPoint")
        aCoder.encode(end, forKey: "endPoint")
    }
}
