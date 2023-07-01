//
//  ProfileCell.swift
//  FitApp
//
//  Created by Даулетбай Комекбаев on 01/07/23.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    private let mainImageView = UIImageView()
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
        [mainImageView,titleLabel,subtitleLabel].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            self.contentView.addSubview(view)
        }
        mainImageView.image = UIImage(named: "pencil")
        mainImageView.contentMode = .scaleAspectFit
        mainImageView.clipsToBounds = true
        
        titleLabel.text = "Name"
        titleLabel.font = .boldSystemFont(ofSize: 18)
        
        subtitleLabel.text = "Daulet Komekbaev"
        subtitleLabel.textColor = .systemGray
        subtitleLabel.font = .systemFont(ofSize: 14)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            mainImageView.widthAnchor.constraint(equalToConstant: 18),
            mainImageView.heightAnchor.constraint(equalToConstant: 18),
            mainImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -26),
            mainImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 4),
            titleLabel.widthAnchor.constraint(equalToConstant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant: 16),
           
            subtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 33),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 2),
            subtitleLabel.trailingAnchor.constraint(equalTo: mainImageView.leadingAnchor, constant: -16)
            
            
        ])
    }
    
    func updateModel() {
        
    }

}
