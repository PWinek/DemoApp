//
//  ViewController.swift
//  DemoApp
//
//  Created by Amelia Płatek on 11/07/2019.
//  Copyright © 2019 paw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataFetcher.shared.getResolts(query: "tetris", page: 1) { (resoults, error) in
            print(resoults)
            print(error)
        }
    }
}


