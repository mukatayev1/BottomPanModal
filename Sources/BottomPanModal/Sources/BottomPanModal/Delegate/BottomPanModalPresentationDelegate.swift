//
//  File.swift
//  
//
//  Created by Aidos Mukatayev on 14.01.2023.
//

import UIKit

/**
 The PanModalPresentationDelegate conforms to the various transition delegates
 and vends the appropriate object for each transition controller requested.

 Usage:
 ```
 viewController.modalPresentationStyle = .custom
 viewController.transitioningDelegate = PanModalPresentationDelegate.default
 ```
 */
public class BottomPanModalPresentationDelegate: NSObject {

    /**
     Returns an instance of the delegate, retained for the duration of presentation
     */
    public static var `default`: BottomPanModalPresentationDelegate = {
        return BottomPanModalPresentationDelegate()
    }()

}

extension BottomPanModalPresentationDelegate: UIViewControllerTransitioningDelegate {

    /**
     Returns a modal presentation animator configured for the presenting state
     */
    public func animationController(
        forPresented presented: UIViewController,
        presenting: UIViewController,
        source: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        return BottomPanModalPresentationAnimator(transitionStyle: .presentation)
    }

    /**
     Returns a modal presentation animator configured for the dismissing state
     */
    public func animationController(
        forDismissed dismissed: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        return BottomPanModalPresentationAnimator(transitionStyle: .dismissal)
    }

    /**
     Returns a modal presentation controller to coordinate the transition from the presenting
     view controller to the presented view controller.

     Changes in size class during presentation are handled via the adaptive presentation delegate
     */
    public func presentationController(
        forPresented presented: UIViewController,
        presenting: UIViewController?,
        source: UIViewController
    ) -> UIPresentationController? {
        let controller = BottomPanModalPresentationController(
            presentedViewController: presented,
            presenting: presenting
        )
        controller.delegate = self
        return controller
    }
}

extension BottomPanModalPresentationDelegate: UIAdaptivePresentationControllerDelegate {

    /**
     - Note: We do not adapt to size classes due to the introduction of the UIPresentationController
     & deprecation of UIPopoverController (iOS 9), there is no way to have more than one
     presentation controller in use during the same presentation

     This is essential when transitioning from .popover to .custom on iPad split view...
     unless a custom popover view is also implemented
     (popover uses UIPopoverPresentationController & we use PanModalPresentationController)
     */

    /**
     Dismisses the presented view controller
     */
    public func adaptivePresentationStyle(
        for controller: UIPresentationController,
        traitCollection: UITraitCollection
    ) -> UIModalPresentationStyle {
        return .none
    }
}

extension BottomPanModalPresentationDelegate: UIPopoverPresentationControllerDelegate {
}
