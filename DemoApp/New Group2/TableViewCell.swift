//
//  TableViewCell.swift
//  DemoApp
//
//  Created by Amelia Płatek on 13/07/2019.
//  Copyright © 2019 paw. All rights reserved.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
    var mainLabelTitle: String? {
        get {
            return mainLabel.text
        }
        set {
            mainLabel.text = newValue
        }
    }

    private var mainLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "TableViewCell")
        
        buildUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TableViewCell {
    
    func buildUI() {
        
        let frameView = UIView()
        frameView.layer.borderColor = UIColor.lightGray.cgColor
        frameView.layer.borderWidth = 1
        frameView.backgroundColor = .clear
        contentView.addSubview(frameView)
        
        let mainView = UIView()
        mainView.backgroundColor = UIColor.lightGray
        mainView.layer.cornerRadius = 12
        mainView.layer.shadowColor = UIColor.lightGray.cgColor
        mainView.layer.shadowRadius = 3
        mainView.layer.shadowOpacity = 0.6
        mainView.layer.shadowOffset = CGSize(width: 3, height: 2)
        
        contentView.addSubview(mainView)
        
        mainLabel = UILabel()
        mainView.addSubview(mainLabel)
        
        frameView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.left.equalToSuperview().offset(-1)
            $0.right.equalToSuperview().offset(1)
        }
        
        mainView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalToSuperview().offset(8)
            $0.bottom.equalToSuperview().offset(-8)
            $0.height.equalTo(24)
        }
        
        mainLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
}
