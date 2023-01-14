//
//  TransientAlertViewController.swift
//  PanModal
//
//  Created by Stephen Sowole on 3/1/19.
//  Copyright © 2019 Detail. All rights reserved.
//

import UIKit

public class TransientAlertViewController: AlertViewController {

    private weak var timer: Timer?
    private var countdown: Int = 5

    public override func viewDidLoad() {
        super.viewDidLoad()
        alertView.titleLabel.text = "Transient Alert"
        updateMessage()
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startTimer()
    }

    private func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.countdown -= 1
            self?.updateMessage()
        }
    }

    @objc func updateMessage() {
        guard countdown > 0 else {
            invalidateTimer()
            dismiss(animated: true, completion: nil)
            return
        }
        alertView.message.text = "Message disppears in \(countdown) seconds"
    }

    func invalidateTimer() {
        timer?.invalidate()
    }

    deinit {
        invalidateTimer()
    }

    // MARK: - Pan Modal Presentable

    public override var showDragIndicator: Bool {
        return false
    }

    public override var anchorModalToLongForm: Bool {
        return true
    }

    public override var panModalBackgroundColor: UIColor {
        return .clear
    }

    public override var isUserInteractionEnabled: Bool {
        return false
    }
}
