//
//  ExampleViewController.swift
//  
//
//  Created by Aidos Mukatayev on 14.01.2023.
//

import UIKit
public class ExampleViewController: UITableViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        title = "PanModal"

        navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 16)
        ]

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
    }

    public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }

    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RowType.allCases.count
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)

        guard let rowType = RowType(rawValue: indexPath.row) else {
            return cell
        }
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.text = rowType.presentable.string
        cell.textLabel?.font = .systemFont(ofSize: 16)
        return cell
    }

    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        guard let rowType = RowType(rawValue: indexPath.row) else {
            return
        }
        dismiss(animated: true, completion: nil)
        presentPanModal(rowType.presentable.rowVC)
    }
}

protocol RowPresentable {
    var string: String { get }
    var rowVC: UIViewController & BottomPanModalPresentable { get }
}

private extension ExampleViewController {

    enum RowType: Int, CaseIterable {
        case basic
        case fullScreen
        case alert
        case transientAlert
        case userGroups
        case stacked
        case navController


        var presentable: RowPresentable {
            switch self {
            case .basic: return Basic()
            case .fullScreen: return FullScreen()
            case .alert: return Alert()
            case .transientAlert: return TransientAlert()
            case .userGroups: return UserGroup()
            case .stacked: return Stacked()
            case .navController: return Navigation()
            }
        }

        struct Basic: RowPresentable {
            let string: String = "Basic"
            let rowVC: BottomPanModalPresentable.LayoutType = BasicViewController()
        }

        struct FullScreen: RowPresentable {
            let string: String = "Full Screen"
            let rowVC: BottomPanModalPresentable.LayoutType = FullScreenNavController()
        }

        struct Alert: RowPresentable {
            let string: String = "Alert"
            let rowVC: BottomPanModalPresentable.LayoutType = AlertViewController()
        }

        struct TransientAlert: RowPresentable {
            let string: String = "Alert (Transient)"
            let rowVC: BottomPanModalPresentable.LayoutType = TransientAlertViewController()
        }

        struct UserGroup: RowPresentable {
            let string: String = "User Groups"
            let rowVC: BottomPanModalPresentable.LayoutType = UserGroupViewController()
        }

        struct Navigation: RowPresentable {
            let string: String = "User Groups (NavigationController)"
            let rowVC: BottomPanModalPresentable.LayoutType = NavigationController()
        }

        struct Stacked: RowPresentable {
            let string: String = "User Groups (Stacked)"
            let rowVC: BottomPanModalPresentable.LayoutType = UserGroupStackedViewController()
        }
    }
}
