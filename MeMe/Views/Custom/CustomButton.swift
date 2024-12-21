//
//  CustomButton.swift
//  MeMe
//
//  Created by 권정근 on 12/21/24.
//

import UIKit

class CustomButton: UIButton {
    
    enum CustomButtonType {
        case systemName(imageName: String, title: String)
        case text(title: String)
    }
    
    private let customButtonType: CustomButtonType
    
    init(customButtonType: CustomButtonType, hasBackground: Bool = false) {
        self.customButtonType = customButtonType
        super.init(frame: .zero)
        
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = hasBackground ? .systemYellow : .clear
        configuration.baseForegroundColor = .label
        configuration.titleAlignment = .center
        
        // 공통 스타일 적용
        let titleFont = UIFont.systemFont(ofSize: 16, weight: .bold)
        let titleColor = UIColor.label
        
        switch customButtonType {
        case .systemName(imageName: let imageName, title: let title):
            // Configure system image and title
            let imageConfig = UIImage.SymbolConfiguration(pointSize: 16, weight: .bold)
            configuration.preferredSymbolConfigurationForImage = imageConfig
            configuration.image = UIImage(systemName: imageName)
            configuration.imagePadding = 8
            configuration.imagePlacement = .top
            configuration.title = title
            
            configuration.attributedTitle = AttributedString(title, attributes: AttributeContainer([
                .font: UIFont.systemFont(ofSize: 12, weight: .bold),
                .foregroundColor: titleColor
            ]))
            
        case .text(title: let title):
            // Configure text-only button
            configuration.title = title
            configuration.attributedTitle = AttributedString(title, attributes: AttributeContainer([
                .font: UIFont.systemFont(ofSize: 18, weight: .bold),
                .foregroundColor: titleColor
            ]))
        }
        
        self.configuration = configuration
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
