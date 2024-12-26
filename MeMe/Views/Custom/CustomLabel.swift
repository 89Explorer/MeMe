//
//  CustomLabel.swift
//  MeMe
//
//  Created by 권정근 on 12/21/24.
//

import UIKit

class CustomLabel: UILabel {
    
    // enum: 라벨의 종류
    enum CustomLabelType {
        case title
    }
    
    private let customLabelType: CustomLabelType
    
    init(customLabelType: CustomLabelType, title: String) {
        self.customLabelType = customLabelType
        super.init(frame: .zero)
        
        self.backgroundColor = .systemBackground
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.textColor = .label
        self.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        switch customLabelType {
        case .title:
            self.text = title
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
