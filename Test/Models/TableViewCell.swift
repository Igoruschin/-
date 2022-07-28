//
//  TableViewCell.swift
//  Test
//
//  Created by Игорь Ущин on 25.07.2022.
//

import Foundation
import UIKit

final class TableViewCell: UITableViewCell {
    
    var labelName: UILabel =  {
        let label = UILabel()
        label.backgroundColor = .black
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.sizeToFit()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var labelSkills: UILabel =  {
        let label = UILabel()
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var profilePhoto: UIImageView =  {
        let image = UIImageView()
        image.clipsToBounds = true
        image.image = UIImage(named: "unnamed")
        image.backgroundColor = .blue
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var labelPhoneNumber: UILabel =  {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.sizeToFit()
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setupConstraints
    private func setup(){
        self.addSubview(labelName)
        self.addSubview(labelSkills)
        self.addSubview(profilePhoto)
        self.addSubview(labelPhoneNumber)
        
        NSLayoutConstraint.activate([
            labelName.topAnchor.constraint(equalTo: self.topAnchor, constant: 1),
            labelName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -1),
            labelName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 101),
            labelName.heightAnchor.constraint(equalToConstant: 25)
        ])
        NSLayoutConstraint.activate([
            labelSkills.topAnchor.constraint(equalTo: self.topAnchor, constant: 37),
            labelSkills.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 100),
            labelSkills.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 104),
        ])
        NSLayoutConstraint.activate([
            profilePhoto.topAnchor.constraint(equalTo: self.topAnchor, constant: 1),
            profilePhoto.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1),
            profilePhoto.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 1),
            profilePhoto.widthAnchor.constraint(equalToConstant: 100)
        ])
        NSLayoutConstraint.activate([
            labelPhoneNumber.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1),
            labelPhoneNumber.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 104),
            labelPhoneNumber.widthAnchor.constraint(equalToConstant: 180)
        ])
    }
}
