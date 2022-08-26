//
//  AnimationService.swift
//  Animation App
//
//  Created by Apple Macbook Pro 13 on 26.08.22.
//

import Foundation
import Spring

class AnimationService {
    static func makeRandomAnimation(view: SpringView) {
        let animation = AnimationType.allCases.randomElement()!.rawValue
        let curve = CurveType.allCases.randomElement()!.rawValue
        
        view.animation = animation
        view.curve = curve
        view.force = CGFloat.random(in: (0.5)...2)
        view.duration = 3
        view.delay = 1
    }
}
