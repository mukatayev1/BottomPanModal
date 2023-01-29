//
//  UIViewController+PanModalPresenter.swift
//  
//
//  Created by Aidos Mukatayev on 14.01.2023.
//

import UIKit

/**
 Extends the UIViewController to conform to the PanModalPresenter protocol
 */
extension UIViewController: BottomPanModalPresenter {

    /**
     A flag that returns true if the topmost view controller in the navigation stack
     was presented using the custom PanModal transition

     - Warning: ⚠️ Calling `presentationController` in this function may cause a memory leak. ⚠️

     In most cases, this check will be used early in the view lifecycle and unfortunately,
     there's an Apple bug that causes multiple presentationControllers to be created if
     the presentationController is referenced here and called too early resulting in
     a strong reference to this view controller and in turn, creating a memory leak.
     */
    public var isPanModalPresented: Bool {
        return (transitioningDelegate as? BottomPanModalPresentationDelegate) != nil
    }

    /**
     Configures a view controller for presentation using the PanModal transition

     - Parameters:
        - viewControllerToPresent: The view controller to be presented
        - sourceView: The view containing the anchor rectangle for the popover.
        - sourceRect: The rectangle in the specified view in which to anchor the popover.
        - completion: The block to execute after the presentation finishes. You may specify nil for this parameter.

     - Note: sourceView & sourceRect are only required for presentation on an iPad.
     */
    public func presentPanModal(_ viewControllerToPresent: BottomPanModalPresentable.LayoutType,
                                sourceView: UIView? = nil,
                                sourceRect: CGRect = .zero,
                                completion: (() -> Void)? = nil) {

            viewControllerToPresent.modalPresentationStyle = .custom
            viewControllerToPresent.modalPresentationCapturesStatusBarAppearance = true
            viewControllerToPresent.transitioningDelegate = BottomPanModalPresentationDelegate.default

        present(viewControllerToPresent, animated: true, completion: completion)
    }

}
