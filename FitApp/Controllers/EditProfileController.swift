//
//  EditProfileController.swift
//  FitApp
//
//  Created by Temur on 03/07/2023.
//

import UIKit

class EditProfileController: UIViewController {
    let button = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    private func initialize() {
        button.backgroundColor = .black
        button.setTitle("Back", for: .normal)
        button.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalTo: button.heightAnchor, multiplier: 1),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    
    
    @objc func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
}
