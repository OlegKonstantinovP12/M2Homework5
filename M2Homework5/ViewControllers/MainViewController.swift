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
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "users")
        $0.dataSource = self
        
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    
    private lazy var nextViewButton: UIButton = {
        $0.setTitle("Следующее окно", for: .normal)
        $0.backgroundColor = .black
        $0.tintColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 15
        
        return $0
    }(UIButton(primaryAction: action))
    
    private lazy var action = UIAction { _ in
        let secondaryVC = SecondaryViewController()
        self.navigationController?.pushViewController(secondaryVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(usersTableView)
        view.addSubview(nextViewButton)
        
        navigationController?.navigationBar.isHidden = true
        NSLayoutConstraint.activate([
            nextViewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nextViewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            nextViewButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            nextViewButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    

}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "users", for: indexPath)
        var config = cell.defaultContentConfiguration()
        
        config.text = users[indexPath.row].name
        config.image = UIImage(systemName: users[indexPath.row].icon)
        config.imageProperties.tintColor = .black
        
        
        cell.contentConfiguration = config
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Users"
        default: return nil
        }
    }
}


