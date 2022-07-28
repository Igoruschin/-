//
//  ViewController.swift
//  Test
//
//  Created by Игорь Ущин on 25.07.2022.
//

import Foundation
import UIKit

final class ViewController: UIViewController {
    
    private var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints =  false
        return table
    }()
    
    let identifire =  "TableViewCell"
    var employees: Company!
    let networking = NetworkService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
        configurateNavifgationController()
        jsonRequest()
    }
//MARK: - Request
    private func jsonRequest() {
          networking.jsonRequest { [weak self] result in
               switch result {
               case .success(let employees):
                   self?.employees = employees
                   self?.tableView.reloadData()
               case .failure(let error):
                   print(error.localizedDescription)
               }
           }
       }
    
   private func configurateNavifgationController(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Employees"
        view.backgroundColor = .gray
    }
    
//MARK: - setView
   private func setupTable(){
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: identifire)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        ])
    }
}
//MARK: - Delegate,DataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees?.company.employees.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath) as! TableViewCell
        let employye = employees?.company.employees[indexPath.row]
        let skills = employye?.skills.joined(separator: ", ")
        cell.labelName.text = "Name: \(employye?.name ?? "-")"
        cell.labelPhoneNumber.text = "Phone number: \(employye?.phoneNumber ?? "-")"
        cell.labelSkills.text = "Skills: \(skills ?? "-")"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 101
    }
}
