//
//  ContentCell.swift
//  MeMe
//
//  Created by 권정근 on 12/26/24.
//

import UIKit

class ContentCell: UITableViewCell {

    // MARK: - Variables
    static let reuseIdentifier: String = "ContentCell"
    
    // MARK: - UI Components
    private let contentTextView: CustomTextView = CustomTextView(contentType: .content)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier:  reuseIdentifier)
        
        contentView.backgroundColor = .systemBrown
        configureConstraints()
        contentTextView.delegate = self
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layouts
    private func configureConstraints() {
        contentView.addSubview(contentTextView)
        
        contentTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            contentTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentTextView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentTextView.heightAnchor.constraint(equalToConstant: 400)
            
        ])
    }
}


extension ContentCell: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard contentTextView.textColor == .secondaryLabel else { return }
        
        contentTextView.text = nil
        contentTextView.textColor = .label
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        guard contentTextView.text.isEmpty else { return }
        contentTextView.text = "오늘 하루는 어땠나요?"
        contentTextView.textColor = .secondaryLabel
    }
}
