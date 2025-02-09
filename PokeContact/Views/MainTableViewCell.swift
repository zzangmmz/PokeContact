//
//  MainTableViewCell.swift
//  PokeContact
//
//  Created by 이명지 on 12/9/24.
//
import UIKit

final class MainTableViewCell: UITableViewCell {
    // MARK: - UI Componets
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .gray
        label.textAlignment = .left
        return label
    }()
    
    private let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .gray
        label.textAlignment = .left
        return label
    }()
    
    private lazy var profileNameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileImageView, nameLabel])
        stackView.spacing = 20
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var cellStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileNameStackView, phoneNumberLabel])
        stackView.spacing = 40
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    // MARK: - LifeCycle
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
    }
    
    // MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        configureStackViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("i0nit(coder:) has not been implemented")
    }
    
    // MARK: - Private Functions
    private func configureStackViews() {
        self.contentView.addSubview(cellStackView)
    }
    
    private func configureConstraints() {
        cellStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(equalTo: profileImageView.heightAnchor),
            
            cellStackView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            cellStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            cellStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
        ])
    }
    
    // MARK: - Set Cell Data
    func configureCellData(_ contact: Contact) {
        self.profileImageView.image = contact.profileImage.toUIImage()
        self.nameLabel.text = contact.name
        self.phoneNumberLabel.text = contact.phoneNumber
    }
}

// MARK: - String -> UIImage? Type Convert Methods
extension String {
    func toUIImage() -> UIImage? {
        guard let imageData = Data(base64Encoded: self) else { return nil }
        return UIImage(data: imageData)
    }
}
