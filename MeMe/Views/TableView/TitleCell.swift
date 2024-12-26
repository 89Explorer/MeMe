//
//  TitleCell.swift
//  MeMe
//
//  Created by 권정근 on 12/22/24.
//

import UIKit

class TitleCell: UITableViewCell {
    
    // MARK: - Variables
    static let reuseIdentifier: String = "TitleCell"
    
    // MARK: - UI Components
    private let titleInput: CustomTextField = CustomTextField(authFieldType: .title)
    
    // MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBrown
        
        configureConstraints()
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    // MARK: - Layouts
    private func configureConstraints() {
        contentView.addSubview(titleInput)
        
        titleInput.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            titleInput.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleInput.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleInput.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleInput.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleInput.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
    }
}
