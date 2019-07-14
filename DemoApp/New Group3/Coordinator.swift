//
//  Coordinator.swift
//  DemoApp
//
//  Created by Amelia Płatek on 13/07/2019.
//  Copyright © 2019 paw. All rights reserved.
//

import UIKit

protocol Coordinator {
    
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
