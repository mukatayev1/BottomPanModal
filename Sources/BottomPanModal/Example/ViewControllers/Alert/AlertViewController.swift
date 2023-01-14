//
//  AlertViewController.swift
//  PanModal
//
//  Created by Stephen Sowole on 2/26/19.
//  Copyright © 2019 PanModal. All rights reserved.
//

import UIKit

public class AlertViewController: UIViewController, BottomPanModalPresentable {

    private let alertViewHeight: CGFloat = 68

    let alertView: AlertView = {
        let alertView = AlertView()
        alertView.layer.cornerRadius = 10
        return alertView
    }()

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        view.addSubview(alertView)
        alertView.translatesAutoresizingMaskIntoConstraints = false
        alertView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        alertView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        alertView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        alertView.heightAnchor.constraint(equalToConstant: alertViewHeight).isActive = true
    }

    // MARK: - PanModalPresentable

    public var panScrollable: UIScrollView? {
        return nil
    }

    public var shortFormHeight: BottomPanModalHeight {
        return .contentHeight(alertViewHeight)
    }

    public var longFormHeight: BottomPanModalHeight {
        return shortFormHeight
    }

    public var panModalBackgroundColor: UIColor {
        return UIColor.black.withAlphaComponent(0.1)
    }

    public var shouldRoundTopCorners: Bool {
        return false
    }

    public var showDragIndicator: Bool {
        return true
    }

    public var anchorModalToLongForm: Bool {
        return false
    }

    public var isUserInteractionEnabled: Bool {
        return true
    }
}
