//
//  AnimationType.swift
//  Animation App
//
//  Created by Apple Macbook Pro 13 on 26.08.22.
//

import Foundation

enum AnimationType: String, CaseIterable {
    case SlideLeft = "slideLeft"
    case SlideRight = "slideRight"
    case SlideDown = "slideDown"
    case SlideUp = "slideUp"
    case SqueezeLeft = "squeezeLeft"
    case SqueezeRight = "squeezeRight"
    case SqueezeDown = "squeezeDown"
    case SqueezeUp = "squeezeUp"
    case FadeIn = "fadeIn"
    case FadeOut = "fadeOut"
    case FadeOutIn = "fadeOutIn"
    case FadeInLeft = "fadeInLeft"
    case FadeInRight = "fadeInRight"
    case FadeInDown = "fadeInDown"
    case FadeInUp = "fadeInUp"
    case ZoomIn = "zoomIn"
    case ZoomOut = "zoomOut"
    case Fall = "fall"
    case Shake = "shake"
    case Pop = "pop"
    case FlipX = "flipX"
    case FlipY = "flipY"
    case Morph = "morph"
    case Squeeze = "squeeze"
    case Flash = "flash"
    case Wobble = "wobble"
    case Swing = "swing"
}
