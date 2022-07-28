//
//  CompanyModel.swift
//  Test
//
//  Created by Игорь Ущин on 28.07.2022.
//

import Foundation

// MARK: - Company
struct Company: Codable {
    let company: CompanyClass
}

// MARK: - CompanyClass
struct CompanyClass: Codable {
    let name: String
    let employees: [Employee]
}

// MARK: - Employee
struct Employee: Codable {
    let name, phoneNumber: String
    let skills: [String]

    enum CodingKeys: String, CodingKey {
        case name
        case phoneNumber = "phone_number"
        case skills
    }
}
