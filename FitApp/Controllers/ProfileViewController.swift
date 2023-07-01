//
//  ProfileViewController.swift
//  FitApp
//
//  Created by Temur on 28/06/2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    private let logoImageView = UIImageView()
    private let tableView: UITableView = UITableView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    
    private var items: [ProfileInfoItem] = [
    ProfileInfoItem(title: "Name", subtitle: "Komekbaev Daulet"),
    ProfileInfoItem(title: "Status", subtitle: "At Gym"),
    ProfileInfoItem(title: "Phone No", subtitle: "+998 99 123 45 67"),
    ProfileInfoItem(title: "User Name", subtitle: "daulet.jaslyn"),
    ProfileInfoItem(title: "Password", subtitle: "12341234", isSecure: true)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initialize()
    }
    override func viewWillAppear(_ animated: Bool) {
        setupConstraints()
    }
    
    private func initialize() {
        [titleLabel, subtitleLabel].forEach { label in
            label.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(label)
        
        }
        
        logoImageView.image = UIImage(named: "logo")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(logoImageView)

        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ProfileCell.self, forCellReuseIdentifier: "ProfileCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 54
        tableView.separatorStyle = .none
        self.view.addSubview(tableView)
        
        
        
        setupConstraints()
        
    }
           
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor,
                                                  multiplier: 1),
            logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor,constant: 83),
            
            tableView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
}

extension ProfileViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as! ProfileCell
        
        cell.updateModel(item: items [indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.selectionStyle = .none
    }
}

