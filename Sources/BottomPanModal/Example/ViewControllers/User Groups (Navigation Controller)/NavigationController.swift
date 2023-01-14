//
//  NavigationController.swift
//  PanModal
//
//  Created by Stephen Sowole on 2/26/19.
//  Copyright © 2019 PanModal. All rights reserved.
//

import UIKit

public class NavigationController: UINavigationController, BottomPanModalPresentable {

    private let navGroups = NavUserGroups()

    init() {
        super.init(nibName: nil, bundle: nil)
        viewControllers = [navGroups]
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    public override func popViewController(animated: Bool) -> UIViewController? {
        let vc = super.popViewController(animated: animated)
        panModalSetNeedsLayoutUpdate()
        return vc
    }

    public override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        panModalSetNeedsLayoutUpdate()
    }

    // MARK: - Pan Modal Presentable

    public var panScrollable: UIScrollView? {
        return (topViewController as? BottomPanModalPresentable)?.panScrollable
    }

    public var longFormHeight: BottomPanModalHeight {
        return .maxHeight
    }

    public var shortFormHeight: BottomPanModalHeight {
        return longFormHeight
    }
}

private class NavUserGroups: UserGroupViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "iOS Engineers"

        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 16),
            .foregroundColor: #colorLiteral(red: 0.7019607843, green: 0.7058823529, blue: 0.7137254902, alpha: 1)
        ]
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.7019607843, green: 0.7058823529, blue: 0.7137254902, alpha: 1)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1294117647, green: 0.1411764706, blue: 0.1568627451, alpha: 1)

        navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style: .plain, target: nil, action: nil)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let presentable = members[indexPath.row]
        let viewController = ProfileViewController(presentable: presentable)

        navigationController?.pushViewController(viewController, animated: true)
    }
}

