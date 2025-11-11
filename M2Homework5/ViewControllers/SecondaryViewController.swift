//
//  SecondaryViewController.swift
//  M2Homework5
//
//  Created by Oleg Konstantinov on 11.11.2025.
//

import UIKit

class SecondaryViewController: UIViewController {
    
    private let mockUsers = UsersData.mockLoadData()
    private let mockGroup = GroupsData.mockLoadData()

    private lazy var usersAndGroupsTableView: UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: CellIdentifier.users.rawValue)
        $0.register(UITableViewCell.self, forCellReuseIdentifier: CellIdentifier.groups.rawValue)
        $0.dataSource = self
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(usersAndGroupsTableView)
    }


}

extension SecondaryViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return mockUsers.count
        case 1:
            return mockGroup.count
        default:
            return 0
        }
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.users.rawValue, for: indexPath)
            var config = cell.defaultContentConfiguration()
            config.text = mockUsers[indexPath.row].name
            config.textProperties.font = .systemFont(ofSize: 16)
            config.image = UIImage(systemName: mockUsers[indexPath.row].icon)
            config.imageProperties.tintColor = .black
            config.imageProperties.maximumSize = CGSize(width: 24, height: 24)
            
            cell.contentConfiguration = config
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.groups.rawValue, for: indexPath)
            var config = cell.defaultContentConfiguration()
            
            config.text = mockGroup[indexPath.row].group
            config.textProperties.font = .systemFont(ofSize: 16)
            config.secondaryText = mockGroup[indexPath.row].description
            config.secondaryTextProperties.color = .black
            config.secondaryTextProperties.font = .systemFont(ofSize: 10)
            config.image = UIImage(systemName: mockGroup[indexPath.row].image)
            config.imageProperties.tintColor = .black
            config.imageProperties.maximumSize = CGSize(width: 24, height: 24)
            
            cell.contentConfiguration = config
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Любой текст для футтера"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return String(CellIdentifier.users.rawValue).uppercased()
        case 1:
            return String(CellIdentifier.groups.rawValue).uppercased()
        default:
            return nil
        }
    }
    
}
