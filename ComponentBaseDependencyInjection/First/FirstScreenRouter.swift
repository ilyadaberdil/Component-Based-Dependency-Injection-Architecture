//
//  Router.swift
//  ComponentBaseDependencyInjection
//
//  Created by Berdil İlyada Karacam on 8.02.2020.
//  Copyright © 2020 Berdil İlyada Karacam. All rights reserved.
//

import Foundation

protocol FirstScreenRouterProtocol: AnyObject {
    func showSecondScreen()
}

final class FirstScreenRouter: FirstScreenRouterProtocol {
    
    private weak var view: FirstScreenViewControllerRouterProtocol!
    private var dependencies: SecondScreenDependencies
    
    init(view: FirstScreenViewControllerRouterProtocol, dependencies: SecondScreenDependencies) {
        self.view = view
        self.dependencies = dependencies
    }
    
    func showSecondScreen() {
        let viewController = SecondScreenBuilder(dependencies: dependencies).initViewController()
        view.present(viewController: viewController)
    }
}

