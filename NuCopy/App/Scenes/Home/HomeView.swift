//
//  HomeView.swift
//  NuCopy
//
//  Created by Diggo Silva on 31/10/25.
//

import UIKit

class HomeView: UIView {
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(HeaderCell.self, forCellReuseIdentifier: HomeCell.header.cellIdentifier)
        tv.register(NameCell.self, forCellReuseIdentifier: HomeCell.name.cellIdentifier)
        tv.register(AccountCell.self, forCellReuseIdentifier: HomeCell.account.cellIdentifier)
        tv.separatorStyle = .none
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        addSubview(tableView)
        backgroundColor = .systemBackground
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
