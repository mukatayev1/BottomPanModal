//
//  File.swift
//  
//
//  Created by Aidos Mukatayev on 14.01.2023.
//

import UIKit

/**
 A view wrapper around the presented view in a PanModal transition.

 This allows us to make modifications to the presented view without
 having to do those changes directly on the view
 */
class BottomPanContainerView: UIView {

    init(presentedView: UIView, frame: CGRect) {
        super.init(frame: frame)
        addSubview(presentedView)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension UIView {

    /**
     Convenience property for retrieving a PanContainerView instance
     from the view hierachy
     */
    var panContainerView: BottomPanContainerView? {
        return subviews.first(where: { view -> Bool in
            view is BottomPanContainerView
        }) as? BottomPanContainerView
    }

}
