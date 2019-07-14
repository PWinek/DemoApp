//
//  DetailsViewController.swift
//  DemoApp
//
//  Created by Amelia Płatek on 13/07/2019.
//  Copyright © 2019 paw. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    private var idValueLabel: UILabel!
    private var nameValueLabel: UILabel!
    private var fullNameValueLabel: UILabel!
    private var watchersValueLabel: UILabel!
    private var forksCountValueLabel: UILabel!
    private var scoreValueLabel: UILabel!
    
    private var idLabel: UILabel!
    private var nameLabel: UILabel!
    private var fullNameLabel: UILabel!
    private var watchersLabel: UILabel!
    private var forksCountLabel: UILabel!
    private var scoreLabel: UILabel!
    
    var item: Item?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        buildUI()
        setValueLabels(item: item)
    }
    
    private func setValueLabels(item: Item?) {
        guard let item = item else { return }
        
        idValueLabel.text = String(item.id)
        nameValueLabel.text = item.name
        fullNameValueLabel.text = item.fullName
        watchersValueLabel.text = String(item.watchersCount)
        forksCountValueLabel.text = String(item.forksCount)
        scoreValueLabel.text = String(item.score)
    }
}

// MARK: - UI
extension DetailsViewController {
    
    private func buildUI() {
        idValueLabel = UILabel()
        nameValueLabel = UILabel()
        fullNameValueLabel = UILabel()
        watchersValueLabel = UILabel()
        forksCountValueLabel = UILabel()
        scoreValueLabel = UILabel()
        
        idLabel = UILabel()
        nameLabel = UILabel()
        fullNameLabel = UILabel()
        watchersLabel = UILabel()
        forksCountLabel = UILabel()
        scoreLabel = UILabel()
        
        idLabel.text = "Id"
        nameLabel.text = "Name"
        fullNameLabel.text = "Full name"
        watchersLabel.text = "Watchers count"
        forksCountLabel.text = "Forks count"
        scoreLabel.text = "Score"
        
        [
            idValueLabel,
            nameValueLabel,
            fullNameValueLabel,
            watchersValueLabel,
            forksCountValueLabel,
            scoreValueLabel,
        ].forEach {
                $0?.font = UIFont.boldSystemFont(ofSize: 17.0)
        }
        
        let leftStackView = UIStackView(
            arrangedSubviews: [
                idLabel,
                nameLabel,
                fullNameLabel,
                watchersLabel,
                forksCountLabel,
                scoreLabel
            ]
        )
        leftStackView.alignment = .leading
        
        let rightStackView = UIStackView(
            arrangedSubviews: [
                idValueLabel,
                nameValueLabel,
                fullNameValueLabel,
                watchersValueLabel,
                forksCountValueLabel,
                scoreValueLabel
            ]
        )
        rightStackView.alignment = .trailing
        
        [leftStackView, rightStackView].forEach {
            $0.axis = .vertical
            $0.spacing = 8
        }
        
        let mainStackView = UIStackView(arrangedSubviews: [leftStackView, rightStackView])
        mainStackView.axis = .horizontal
        mainStackView.distribution = .fillEqually
        
        view.addSubview(mainStackView)
        
        mainStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(18)
            $0.trailing.equalToSuperview().offset(-18)
            $0.top.equalToSuperview().offset(100)
        }
    }
}
