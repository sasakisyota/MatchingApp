//
//  InfoCollectionViewCell.swift
//  MatchingApp
//
//  Created by 佐々木翔太 on 2021/12/11.
//

import UIKit


class InfoCollectionViewCell: UICollectionViewCell {
    
    var user: User? {
        didSet {
            nameTextFiled.text = user?.name
            emailTextFiled.text = user?.email
            ageTextFiled.text = user?.age
            residenceTextFiled.text = user?.residence
            hobbyTextFiled.text = user?.hobby
            introductionTextFiled.text = user?.introduction
        }
    }
    
    // MARK: UIViews
    let nameLabel = ProfileLabel(title: "名前")
    let ageLabel = ProfileLabel(title: "年齢")
    let emailLabel = ProfileLabel(title: "email")
    let residenceLabel = ProfileLabel(title: "居住地")
    let hobbyLabel = ProfileLabel(title: "趣味")
    let introductionLabel = ProfileLabel(title: "自己紹介")
    
    let nameTextFiled = ProfileTextField(placeholder: "名前")
    let ageTextFiled = ProfileTextField(placeholder: "年齢")
    let emailTextFiled = ProfileTextField(placeholder: "email")
    let residenceTextFiled = ProfileTextField(placeholder: "居住地")
    let hobbyTextFiled = ProfileTextField(placeholder: "趣味")
    let introductionTextFiled = ProfileTextField(placeholder: "自己紹介")

    override init(frame: CGRect) {
        super.init(frame: .zero)

        let views = [[nameLabel, nameTextFiled], [ageLabel, ageTextFiled], [emailLabel, emailTextFiled], [residenceLabel, residenceTextFiled], [hobbyLabel, hobbyTextFiled], [introductionLabel, introductionTextFiled]]
        
        let stackViews = views.map { (views) -> UIStackView in
            guard let label = views.first as? UILabel,
                  let textField = views.last as? UITextField else { return UIStackView() }
            
            let stackView = UIStackView(arrangedSubviews: [label, textField])
            stackView.axis = .vertical
            stackView.spacing = 5
            textField.anchor(height: 50)
            return stackView
        }
        
        let baseStackView = UIStackView(arrangedSubviews: stackViews)
        baseStackView.axis = .vertical
        baseStackView.spacing = 15
        
        addSubview(baseStackView)
        nameTextFiled.anchor(width: UIScreen.main.bounds.width - 40, height: 80)
        baseStackView.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, topPadding: 10, leftPadding: 20, rightPadding: 20)
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
