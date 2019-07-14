//
//  ViewController.swift
//  DemoApp
//
//  Created by Amelia Płatek on 11/07/2019.
//  Copyright © 2019 paw. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    // MARK: - View
    var tableView: UITableView!
    var textField: UITextField!
    
    // MARK: - Model
    var resoults: Resoult?
    
    // MARK: - Handlers
    var handlePresentDetails: ((Item) -> Void)?
    
    // MARK: - Init
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildUI()
        
        tableView.delegate = self
        tableView.dataSource = self
        textField.delegate = self
    }
}

// MARK: - UI
extension ViewController {
    
    func buildUI() {
        view.backgroundColor = .white
        
        textField = UITextField()
        textField.placeholder = "Search"
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .search
        
        view.addSubview(textField)
        
        tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        view.addSubview(tableView)
        
        // constraints
        textField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100.0)
            $0.leading.equalToSuperview().offset(18.0)
            $0.trailing.equalToSuperview().offset(-18.0)
            $0.height.equalTo(50)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let resoults = resoults else { return }
        
        let indexRow = indexPath.row
        let item = resoults.items[indexRow]
        
        handlePresentDetails?(item)
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let resoults = resoults else {
            return 0
        }
        
        return resoults.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {
            return UITableViewCell()
        }
        
        guard let resoults = resoults else {
            return UITableViewCell()
        }
        
        let indexRow = indexPath.row
        let name = resoults.items[indexRow].name
        
        cell.mainLabelTitle = name
        
        return cell
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return false }
        
        DataFetcher.shared.getResolts(query: text, page: 1) { [weak self] (resoults, error) in
            
            guard let self = self else { return }
            self.resoults = resoults
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.tableView.reloadData()
            }
        }
        textField.endEditing(true)
        return true
    }
}
