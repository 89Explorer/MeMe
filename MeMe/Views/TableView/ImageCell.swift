//
//  ImageCell.swift
//  MeMe
//
//  Created by 권정근 on 12/21/24.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    // MARK: - Variables
    static var resumeIdentifier: String = "ImageCell"
    
    // MARK: - UI Components
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "korea")
        return imageView
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "x.circle.fill"), for: .normal)
        button.tintColor = .black
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layouts
    private func configureConstraints() {
        contentView.addSubview(imageView)
        contentView.addSubview(cancelButton)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            cancelButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 5),
            cancelButton.topAnchor.constraint(equalTo: imageView.topAnchor
                                              , constant: -5)
            
        ])
    }
    
    
    // MARK: - Functions
    func configure(with image: String) {
        self.imageView.image = UIImage(named: image)
    }
}
