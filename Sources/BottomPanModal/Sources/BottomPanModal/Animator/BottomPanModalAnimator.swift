//
//  BottomPanModalAnimator.swift
//  
//
//  Created by Aidos Mukatayev on 14.01.2023.
//

import UIKit

struct BottomPanModalAnimator {
    struct Constants {
        static let defaultTransitionDuration: TimeInterval = 0.5
    }

    static func animate(
        _ animations: @escaping BottomPanModalPresentable.AnimationBlockType,
        config: BottomPanModalPresentable?,
        _ completion: BottomPanModalPresentable.AnimationCompletionType? = nil
    ) {

        let transitionDuration = config?.transitionDuration ?? Constants.defaultTransitionDuration
        let springDamping = config?.springDamping ?? 1.0
        let animationOptions = config?.transitionAnimationOptions ?? []

        UIView.animate(
            withDuration: transitionDuration,
            delay: 0,
            usingSpringWithDamping: springDamping,
            initialSpringVelocity: 0,
            options: animationOptions,
            animations: animations,
            completion: completion
        )
    }
}
