//
//  ImagePickerCell.swift
//  MeMe
//
//  Created by 권정근 on 12/21/24.
//

import UIKit

class ImagePickerCell: UITableViewCell {
    
    // MAKR: - UI Componnets
    
    
    // MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
