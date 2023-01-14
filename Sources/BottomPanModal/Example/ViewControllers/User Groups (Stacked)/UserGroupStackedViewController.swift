//
//  UserGroupStackedViewController.swift
//  PanModal
//
//  Created by Stephen Sowole on 2/26/19.
//  Copyright © 2019 PanModal. All rights reserved.
//

import UIKit

public class UserGroupStackedViewController: UserGroupViewController {

    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let presentable = members[indexPath.row]
        let viewController = StackedProfileViewController(presentable: presentable)

        presentPanModal(viewController)
    }

    public override var shortFormHeight: BottomPanModalHeight {
        return longFormHeight
    }
}
