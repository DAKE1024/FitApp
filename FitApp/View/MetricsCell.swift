//
//  MetricsCell.swift
//  FitApp
//
//  Created by Temur on 28/06/2023.
//

import UIKit

class MetricsCell: UITableViewCell {
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
        
        [mainImageView, titleLabel, subtitleLabel].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            self.contentView.addSubview(view)
        }
        
        mainImageView.image = UIImage(named: "water")
        mainImageView.contentMode = .scaleAspectFit
        mainImageView.backgroundColor = UIColor(red: 0.52, green: 0.87, blue: 0.17, alpha: 0.3)
        mainImageView.clipsToBounds = true
        mainImageView.layer.cornerRadius = 12
        
        titleLabel.text = "Water"
        titleLabel.font = .boldSystemFont(ofSize: 18)
        
        subtitleLabel.text = "2 litres"
        subtitleLabel.textColor = .systemGray
        subtitleLabel.font = .systemFont(ofSize: 14)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
            mainImageView.widthAnchor.constraint(equalToConstant: 44),
            mainImageView.heightAnchor.constraint(equalTo: mainImageView.widthAnchor, multiplier: 1),
            mainImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 54),
            
            titleLabel.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 30),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -54),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4)
        ])
    }
    
    func updateModel(item: MetricItem) {
        mainImageView.image = UIImage(named: item.image)
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
    }
}
