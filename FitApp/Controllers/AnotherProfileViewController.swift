//
//  AnotherProfileViewController.swift
//  FitApp
//
//  Created by Даулетбай Комекбаев on 01/07/23.
//

import Foundation
import UIKit

final class AnotherProfileViewController: UIViewController {
    private let topBackgroundView = UIView()
    private let tableView: UITableView = UITableView()
    private let titleLabel = UILabel()
    private let photoBackgroundView = UIView()
    private let profilePhoto = UIImageView()
    private let editButton = UIButton()
    
    //items[0][0] = AnotherProfileItem(titleLabel: "Popular",anotherImage: "")
    private var items: [[AnotherProfileItem]] = [
        [AnotherProfileItem(titleLabel: "Popular",anotherImage: ""),
         AnotherProfileItem(titleLabel: "Treading",anotherImage: ""),
         AnotherProfileItem(titleLabel: "Today",anotherImage: "")],
        
        [AnotherProfileItem(titleLabel: "Favourite", anotherImage: "heart"),
        AnotherProfileItem(titleLabel: "Download", anotherImage: "download")],
        
        [AnotherProfileItem(titleLabel: "Language", anotherImage: "translate"),
        AnotherProfileItem(titleLabel: "Darkmode", anotherImage: "moon"),
        AnotherProfileItem(titleLabel: "Only Download via Wifi", anotherImage: "wifi")]
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
        [topBackgroundView, titleLabel, photoBackgroundView ,profilePhoto, editButton, tableView].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
        
        topBackgroundView.backgroundColor = UIColor(red: 1, green: 0.55, blue: 0.46, alpha: 1)
        photoBackgroundView.backgroundColor = .white
        photoBackgroundView.layer.cornerRadius = 64
        
        profilePhoto.image = UIImage(named: "photoProfile")
        profilePhoto.clipsToBounds = true
        profilePhoto.layer.cornerRadius = 60
        
        tableView.register(AnotherProfileCell.self, forCellReuseIdentifier: "AnotherProfileCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 50
        tableView.sectionFooterHeight = 1.0
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 150, right: 0)
        
        editButton.backgroundColor = .black
        editButton.setTitle("Edit profile", for: .normal)
        editButton.addTarget(self, action: #selector(goToEditVC), for: .touchUpInside)
        
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            topBackgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            topBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topBackgroundView.heightAnchor.constraint(equalToConstant: 180),
            
            profilePhoto.widthAnchor.constraint(equalToConstant: 120),
            profilePhoto.heightAnchor.constraint(equalTo: profilePhoto.widthAnchor,
                                                 multiplier: 1),
            profilePhoto.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            profilePhoto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            photoBackgroundView.centerXAnchor.constraint(equalTo: profilePhoto.centerXAnchor),
            photoBackgroundView.centerYAnchor.constraint(equalTo: profilePhoto.centerYAnchor),
            photoBackgroundView.widthAnchor.constraint(equalToConstant: 128),
            photoBackgroundView.heightAnchor.constraint(equalTo: photoBackgroundView.widthAnchor, multiplier: 1),
            
            editButton.topAnchor.constraint(equalTo: photoBackgroundView.bottomAnchor, constant: 16),
            editButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            editButton.heightAnchor.constraint(equalToConstant: 30),
            editButton.widthAnchor.constraint(equalToConstant: 100),
            
            tableView.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor , constant: 150),
            
            
        ])
    }
    
    @objc func goToEditVC() {
        let vc = EditProfileController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension AnotherProfileViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnotherProfileCell") as! AnotherProfileCell
        cell.updateModel(item: items[indexPath.section][indexPath.row])
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count //3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count //3, 2, 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        switch section {
        case 0:
            label.text = "Mimi Headline"
        case 1:
            label.text = "Content"
        case 2:
            label.text = "Preferences"
        default:
            break
        }
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
        ])
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 30
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .zero
    }
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let view = UIView()
//        view.backgroundColor = .red
//        return view
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.selectionStyle = .none
    }
}
