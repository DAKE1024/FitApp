//
//  ViewController.swift
//  FitApp
//
//  Created by Даулетбай Комекбаев on 28/06/23.
//

import UIKit

//frame
//constraint (Code or Storyboard)
//SwiftUI

final class HomeViewController: UIViewController {
    private let logoImageView = UIImageView()
    private let tableView: UITableView = UITableView()
    
    private var items: [MetricItem] = [
        MetricItem(title: "Water", subtitle: "2 litres", image: "water"),
        MetricItem(title: "Steps", subtitle: "1234 steps", image: "walking"),
        MetricItem(title: "Weight", subtitle: "75 kg", image: "weight")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupContstraints()
    }
    
    private func initialize() {
        logoImageView.image = UIImage(named: "logo")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(logoImageView)
        
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MetricsCell.self, forCellReuseIdentifier: "Cell")
        tableView.rowHeight = 80
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
    }
    
    private func setupContstraints() {
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalToConstant: 80),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 1),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            
            tableView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 24),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
        ])
    }
        
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MetricsCell
        
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

