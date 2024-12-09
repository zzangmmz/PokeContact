//
//  AddMemberView.swift
//  PokeContact
//
//  Created by 이명지 on 12/9/24.
//
import UIKit
import Alamofire

final class AddMemberView: UIView {
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 10
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let randomImageButton: UIButton = {
        let button = UIButton()
        button.setTitle("랜덤 이미지 생성", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = .systemFont(ofSize: 10)
        return button
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.frame.size.height = 30
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.autocapitalizationType = .none
        textField.placeholder = "닉네임"
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
