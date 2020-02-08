//
//  Builder.swift
//  ComponentBaseDependencyInjection
//
//  Created by Berdil İlyada Karacam on 8.02.2020.
//  Copyright © 2020 Berdil İlyada Karacam. All rights reserved.
//

import Foundation

// Dependencies from parent
protocol SecondScreenDependencies {
    var service: WebService { get }
    var secondScreenParameter: SecondScreenParameter { get }
}

// All Dependencies for SecondViewController
final class SecondScreenComponents  {
    let dependencies: SecondScreenDependencies
    
    init(dependencies: SecondScreenDependencies) {
        self.dependencies = dependencies
    }
    
    var service: WebService {
        dependencies.service
    }
    
    var secondScreenParameter: SecondScreenParameter {
        dependencies.secondScreenParameter
    }
    
    var formatter: SpecialFormatter {
        return SpecialFormatter()
    }
}

class SecondScreenBuilder {
    private var components: SecondScreenComponents
    
    init(dependencies: SecondScreenDependencies) {
        self.components = SecondScreenComponents(dependencies: dependencies)
    }
    
    func initViewController() -> SecondScreenViewController {
        let viewController: SecondScreenViewController = SecondScreenViewController(secondScreenParameter: components.secondScreenParameter)
        let router: SecondScreenRouter = SecondScreenRouter(view: viewController)
        let presenter: SecondScreenPresenter = SecondScreenPresenter(view: viewController,
                                                                     router: router,
                                                                     service: components.service,
                                                                     formatter: components.formatter)

        viewController.router = router
        viewController.presenter = presenter
        
        return viewController
    }
}

