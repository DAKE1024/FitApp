//
//  ProfileCell.swift
//  FitApp
//
//  Created by Даулетбай Комекбаев on 01/07/23.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    private let pencilImageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize() {
        [pencilImageView,titleLabel,subtitleLabel].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            self.contentView.addSubview(view)
        }
        pencilImageView.image = UIImage(named: "pencil")
        pencilImageView.contentMode = .scaleAspectFit
        pencilImageView.clipsToBounds = true
        
        titleLabel.text = "Name"
        titleLabel.font = .systemFont(ofSize: 18)
        titleLabel.textColor = UIColor(red: 0.18, green: 0.18, blue: 0.33, alpha: 1)
        
        subtitleLabel.text = "Daulet Komekbaev"
        subtitleLabel.textColor = .black
        subtitleLabel.font = .boldSystemFont(ofSize: 14)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            pencilImageView.widthAnchor.constraint(equalToConstant: 18),
            pencilImageView.heightAnchor.constraint(equalToConstant: 18),
            pencilImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -26),
            pencilImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: pencilImageView.leadingAnchor, constant: -16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant: 16),
           
            subtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 33),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 2),
            subtitleLabel.trailingAnchor.constraint(equalTo: pencilImageView.leadingAnchor, constant: -16)
            
            
        ])
    }
    
    func updateModel() {
        
    }

}
