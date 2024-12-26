//
//  CustomTextView.swift
//  MeMe
//
//  Created by 권정근 on 12/21/24.
//

import UIKit

class CustomTextView: UITextView {

    // MARK: - Enum
    enum CustomtextView {
        case content
    }
    
    private let contentType: CustomtextView
    
    init(contentType: CustomtextView) {
        self.contentType = contentType
        super.init(frame: .zero, textContainer: nil)
        
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 10
        
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        switch contentType {
        case .content:
            self.text = "오늘 하루는 어땠나요?"
            self.font = .systemFont(ofSize: 16, weight: .bold)
            self.textColor = .secondaryLabel
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
