//
//  HomeViewController.swift
//  MeMe
//
//  Created by 권정근 on 12/19/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Variables
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBrown
        
        setupNavigationItem()
        navigationItem.title = "MEME"
        
    }
    
    
    // MARK: - Layouts
    
    
    // MARK: - Functions
    private func setupNavigationItem() {
        let navigationRightButton = UIBarButtonItem(
            image: UIImage(systemName: "square.and.pencil"),
            style: .plain,
            target: self,
            action: #selector(didTapRightButton))
        
        navigationRightButton.tintColor = .label
        navigationItem.rightBarButtonItem = navigationRightButton
    }
    
    // MARK: - Actions
    @objc private func didTapRightButton() {
        print("didTapRightButton - called")
        let feedVC = FeedViewController()
        navigationController?.pushViewController(feedVC, animated: true)
    }
    
}

