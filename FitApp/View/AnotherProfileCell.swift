//
//  AnotherProfileCell.swift
//  FitApp
//
//  Created by Даулетбай Комекбаев on 03/07/23.
//

import UIKit

class AnotherProfileCell: UITableViewCell {
    private let anotherImageView = UIImageView()
    private let nextImageView = UIImageView()
    private let titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialize() {
        [anotherImageView,nextImageView,titleLabel].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            self.contentView.addSubview(view)
        }
        
        anotherImageView.image = UIImage(named: "water")
        anotherImageView.contentMode = .scaleAspectFit
        anotherImageView.backgroundColor = .white
        anotherImageView.clipsToBounds = true
//        anotherImageView.layer.cornerRadius = 12
        
        nextImageView.image = UIImage(named: "next")
        nextImageView.contentMode = .scaleAspectFit
        nextImageView.clipsToBounds = true
        
        titleLabel.text = "Name"
        titleLabel.font = .systemFont(ofSize: 18)
        titleLabel.textColor = .black
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            anotherImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
            anotherImageView.widthAnchor.constraint(equalToConstant: 19),
            anotherImageView.heightAnchor.constraint(equalTo: anotherImageView.widthAnchor, multiplier: 1),
            anotherImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 26),
            
            nextImageView.widthAnchor.constraint(equalToConstant: 18),
            nextImageView.heightAnchor.constraint(equalToConstant: 18),
            nextImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -26),
            nextImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: nextImageView.leadingAnchor, constant: -16),
            titleLabel.leadingAnchor.constraint(equalTo: anotherImageView.trailingAnchor , constant: 16),
           
        ])
    }
    
    func updateModel(item: AnotherProfileItem) {
        anotherImageView.image = UIImage(named: item.anotherImage)
        titleLabel.text = item.titleLabel
    }
}
