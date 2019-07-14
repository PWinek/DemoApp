//
//  MainCoordinator.swift
//  DemoApp
//
//  Created by Amelia Płatek on 13/07/2019.
//  Copyright © 2019 paw. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    
    // MARK: Var
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    // MARK: Initialization
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainVC = ViewController()
        mainVC.handlePresentDetails = { item in
            self.presentDetailsViewController(item: item)
        }
        navigationController.pushViewController(mainVC, animated: false)
    }
    
    private func presentDetailsViewController(item: Item) {
        let detailsViewController = DetailsViewController()
        detailsViewController.item = item
        
        navigationController.pushViewController(detailsViewController, animated: false)
    }
}
