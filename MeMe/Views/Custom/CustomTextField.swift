//
//  CustomTextField.swift
//  MeMe
//
//  Created by 권정근 on 12/20/24.
//

import UIKit

class CustomTextField: UITextField {
    
    // MARK: - Enum
    enum CustomTextFieldType {
        case title
        case feeling
    }
    
    private let authFieldType: CustomTextFieldType
    
    init(authFieldType: CustomTextFieldType) {
        self.authFieldType = authFieldType
        super.init(frame: .zero)
        
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 10
        
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.size.height))
        
        switch authFieldType {
        case .title:
            self.placeholder = "오늘 하루에 이름을 붙여준다면...😀"
        case .feeling:
            self.placeholder = "오늘 하루 기분은? 🥰"
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
