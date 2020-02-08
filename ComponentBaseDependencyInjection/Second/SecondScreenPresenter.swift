//
//  Presenter.swift
//  ComponentBaseDependencyInjection
//
//  Created by Berdil İlyada Karacam on 8.02.2020.
//  Copyright © 2020 Berdil İlyada Karacam. All rights reserved.
//

import Foundation

protocol SecondScreenPresenterProtocol: AnyObject {
    func getSomethingFromWebService()
}

final class SecondScreenPresenter: SecondScreenPresenterProtocol {
    private weak var view: SecondScreenViewControllerPresenterProtocol!
    private weak var router: SecondScreenRouterProtocol!
    private var service: WebService
    private var formatter: SpecialFormatter
    
    init(view: SecondScreenViewControllerPresenterProtocol, router: SecondScreenRouterProtocol, service: WebService, formatter: SpecialFormatter) {
        self.view = view
        self.router = router
        self.service = service
        self.formatter = formatter
    }
    
    func getSomethingFromWebService() {
        print("something happened - 2 ")
    }
}
