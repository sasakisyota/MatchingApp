//
//  UIImage-Extension.swift
//  MatchingApp
//
//  Created by 佐々木翔太 on 2021/12/01.
//

import UIKit

extension UIImage{
    
    func resize(size _size: CGSize) -> UIImage? {
            let widthRatio = _size.width / size.width
            let heightRatio = _size.height / size.height
            let ratio = widthRatio < heightRatio ? widthRatio : heightRatio
            
            let resizeSize = CGSize(width: size.width * ratio, height: size.height * ratio)
            
            UIGraphicsBeginImageContextWithOptions(resizeSize, false, 0.0)
            draw(in: CGRect(origin: .zero, size: resizeSize))
            let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return resizedImage
        }
    
}
