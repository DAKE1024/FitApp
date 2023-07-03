//
//  AnotherProfileViewController.swift
//  FitApp
//
//  Created by Даулетбай Комекбаев on 01/07/23.
//

import Foundation
import UIKit

final class AnotherProfileViewController: UIViewController {
    
    private let tableView: UITableView = UITableView()
    private let titleLabel = UILabel()
    private let profilePhoto = UIImageView()
    
    private var items: [AnotherProfileItem] = [
        AnotherProfileItem(titleLabel: "Popular",anotherImage: ""),
        AnotherProfileItem(titleLabel: "Treading",anotherImage: ""),
        AnotherProfileItem(titleLabel: "Today",anotherImage: ""),
        AnotherProfileItem(titleLabel: "Favourite", anotherImage: "heart"),
        AnotherProfileItem(titleLabel: "Download", anotherImage: "download"),
        AnotherProfileItem(titleLabel: "Language", anotherImage: "translate"),
        AnotherProfileItem(titleLabel: "Darkmode", anotherImage: "moon"),
        AnotherProfileItem(titleLabel: "Only Download via Wifi", anotherImage: "wifi")
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
        [titleLabel].forEach { label in
            label.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(label)
        }
        
        profilePhoto.image = UIImage(named: "photoProfile")
        profilePhoto.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(profilePhoto)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(AnotherProfileCell.self, forCellReuseIdentifier: "AnotherProfileCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 50
        tableView.separatorStyle = .none
        self.view.addSubview(tableView)
        
        
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            profilePhoto.widthAnchor.constraint(equalToConstant: 120),
            profilePhoto.heightAnchor.constraint(equalTo: profilePhoto.widthAnchor,
                                                 multiplier: 1),
            profilePhoto.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            profilePhoto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: profilePhoto.bottomAnchor, constant: 106),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor , constant: 150),
            
            
        ])
        
        
    }
}

extension AnotherProfileViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnotherProfileCell") as! AnotherProfileCell
        
        cell.updateModel(item: items[indexPath.row])
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
