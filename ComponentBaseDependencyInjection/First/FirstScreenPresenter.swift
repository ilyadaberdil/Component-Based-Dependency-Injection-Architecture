//
//  Presenter.swift
//  ComponentBaseDependencyInjection
//
//  Created by Berdil İlyada Karacam on 8.02.2020.
//  Copyright © 2020 Berdil İlyada Karacam. All rights reserved.
//

import Foundation

protocol FirstScreenPresenterProtocol: AnyObject {
    func getSomethingFromWebService()
    func buttonTapped()
}

final class FirstScreenPresenter: FirstScreenPresenterProtocol {

    private var service: WebService
    private weak var view: FirstScreenViewControllerPresenterProtocol!
    private weak var router: FirstScreenRouterProtocol!

    init(view: FirstScreenViewControllerPresenterProtocol, router: FirstScreenRouterProtocol, service: WebService) {
        self.view = view
        self.router = router
        self.service = service
    }
    
    func getSomethingFromWebService() {
        print("something happened")
    }

    func buttonTapped() {
        router.showSecondScreen()
    }
}
