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
        
        titleLabel.text = "Name"
        titleLabel.font = .boldSystemFont(ofSize: 18)
        
        subtitleLabel.text = "Steph Jaslyn"
        subtitleLabel.textColor = .systemGray
        subtitleLabel.font = .systemFont(ofSize: 14)
        
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.selectionStyle = .none
    }
}

