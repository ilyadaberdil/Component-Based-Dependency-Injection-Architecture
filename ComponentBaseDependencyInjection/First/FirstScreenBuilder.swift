//
//  Builder.swift
//  ComponentBaseDependencyInjection
//
//  Created by Berdil İlyada Karacam on 8.02.2020.
//  Copyright © 2020 Berdil İlyada Karacam. All rights reserved.
//

import Foundation

protocol FirstScreenDependencies {
    var service: WebService { get }
    var firstScreenParameter: FirstScreenParameter { get }
}

// it must conform all viewcontrollers dependency protocols which will be present after FirstViewController
private final class FirstScreenComponents: SecondScreenDependencies {
    let dependencies: FirstScreenDependencies

    init(dependencies: FirstScreenDependencies) {
        self.dependencies = dependencies
    }
    
    var service: WebService {
        dependencies.service
    }
    
    var firstScreenParameter: FirstScreenParameter {
        dependencies.firstScreenParameter
    }
    
    var secondScreenParameter: SecondScreenParameter {
        return SecondScreenParameter()
    }
}

final class FirstScreenBuilder {
    
    private var components: FirstScreenComponents
    
    init(dependencies: FirstScreenDependencies) {
        self.components = FirstScreenComponents(dependencies: dependencies)
    }
    
    func initViewController() -> FirstScreenViewController {
        let viewController: FirstScreenViewController = FirstScreenViewController(firstScreenParameter: components.firstScreenParameter)
        let router: FirstScreenRouter = FirstScreenRouter(view: viewController, dependencies: components)
        let presenter: FirstScreenPresenter = FirstScreenPresenter(view: viewController, router: router, service: components.service)

        viewController.router = router
        viewController.presenter = presenter
        
        return viewController
    }
}

