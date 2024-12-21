//
//  FeedViewController.swift
//  MeMe
//
//  Created by 권정근 on 12/19/24.
//

import UIKit

class FeedViewController: UIViewController {
    
    // MARK: - Variables
    var userMemo: [Memo] = []
    
    // MARK: - UI Componnets
    private let feedTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = false
        tableView.rowHeight = UITableView.automaticDimension   // 동적 높이
        return tableView
    }()
    
    private let savedButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("저장하기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        button.titleLabel?.textColor = .label
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()
    
    private let submitButton = CustomButton(customButtonType: .text(title: "저장하기"), hasBackground: true)
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBrown
        
        setupDelegate()
        configureConstraints()
    }
    
    // MARK: - Layouts
    private func configureConstraints() {
        
        view.addSubview(feedTableView)
        // view.addSubview(savedButton)
        view.addSubview(submitButton)
        
        feedTableView.translatesAutoresizingMaskIntoConstraints = false
        savedButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            feedTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            feedTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            feedTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
//            savedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//            savedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
//            savedButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
//            savedButton.topAnchor.constraint(equalTo: feedTableView.bottomAnchor, constant: 10),
//            savedButton.heightAnchor.constraint(equalToConstant: 50)
            
            submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            submitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            submitButton.topAnchor.constraint(equalTo: feedTableView.bottomAnchor, constant: 10),
            submitButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
  
    }
    
    // MARK: - Functions
    private func setupDelegate() {
        feedTableView.delegate = self
        feedTableView.dataSource = self
        feedTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}


extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "TEST"
        return cell
    }
}



enum MemoItemType: CaseIterable {
    case imagePicker
    case textInput
}



