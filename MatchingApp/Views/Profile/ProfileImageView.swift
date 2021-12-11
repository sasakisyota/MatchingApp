//
//  ProfileImageView.swift
//  MatchingApp
//
//  Created by 佐々木翔太 on 2021/12/11.
//

import UIKit

class ProfileImageView: UIImageView {
    
    init() {
        super.init(frame: .zero)
        
        self.image = UIImage(named: "no-image")
        self.contentMode = .scaleAspectFill
        self.layer.cornerRadius = 90
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
