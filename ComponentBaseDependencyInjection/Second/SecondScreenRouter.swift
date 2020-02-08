//
//  Router.swift
//  ComponentBaseDependencyInjection
//
//  Created by Berdil İlyada Karacam on 8.02.2020.
//  Copyright © 2020 Berdil İlyada Karacam. All rights reserved.
//

import Foundation

protocol SecondScreenRouterProtocol: AnyObject {
}

final class SecondScreenRouter: SecondScreenRouterProtocol {
    
    private weak var view: SecondScreenViewControllerRouterProtocol!
    
    init(view: SecondScreenViewControllerRouterProtocol) {
        self.view = view
    }

}
