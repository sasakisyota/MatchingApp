//
//  CardInfoLabel.swift
//  MatchingApp
//
//  Created by 佐々木翔太 on 2021/12/07.
//

import Foundation
import UIKit

class CardInfoLabel: UILabel {
    
    init(text: String, textColor: UIColor) {
        super.init(frame: .zero)
        
        font = .boldSystemFont(ofSize: 45)
        self.text = text
        self.textColor = textColor
        
        layer.borderWidth = 3
        layer.borderColor = textColor.cgColor
        layer.cornerRadius = 10
        
        textAlignment = .center
        alpha = 0
    }
    
    init(font: UIFont) {
        super.init(frame: .zero)
        self.font = font
        textColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
