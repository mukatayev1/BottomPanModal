//
//  FullScreenNavController.swift
//  PanModalDemo
//
//  Created by Stephen Sowole on 5/2/19.
//  Copyright © 2019 Detail. All rights reserved.
//

import UIKit

public class FullScreenNavController: UINavigationController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        pushViewController(FullScreenViewController(), animated: false)
    }
}

extension FullScreenNavController: BottomPanModalPresentable {

    public var panScrollable: UIScrollView? {
        return nil
    }

    public var topOffset: CGFloat {
        return 0.0
    }

    public var springDamping: CGFloat {
        return 1.0
    }

    public var transitionDuration: Double {
        return 0.4
    }

    public var transitionAnimationOptions: UIView.AnimationOptions {
        return [.allowUserInteraction, .beginFromCurrentState]
    }

    public var shouldRoundTopCorners: Bool {
        return false
    }

    public var showDragIndicator: Bool {
        return false
    }
}

private class FullScreenViewController: UIViewController {

    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Drag downwards to dismiss"
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Full Screen"
        view.backgroundColor = .white
        setupConstraints()
    }

    private func setupConstraints() {
        view.addSubview(textLabel)
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

}
