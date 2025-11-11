//
//  ViewController.swift
//  M2Homework5
//
//  Created by Oleg Konstantinov on 11.11.2025.
//

import UIKit

class MainViewController: UIViewController {
    private let users = UsersData.mockLoadData()

    
    private lazy var usersTableView: UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: CellIdentifier.users.rawValue)
        $0.dataSource = self
        
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(usersTableView)
        
        
    }
    

}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.users.rawValue, for: indexPath)
        var config = cell.defaultContentConfiguration()
        
        config.text = users[indexPath.row].name
        config.image = UIImage(systemName: users[indexPath.row].icon)
        config.imageProperties.tintColor = .black
        
        
        cell.contentConfiguration = config
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return String(CellIdentifier.users.rawValue).uppercased()
        default: return nil
        }
    }
}


