//
//  ViewController.swift
//  ComponentBaseDependencyInjection
//
//  Created by Berdil İlyada Karacam on 8.02.2020.
//  Copyright © 2020 Berdil İlyada Karacam. All rights reserved.
//

import UIKit

protocol SecondScreenViewControllerRouterProtocol: AnyObject {
    func present(viewController: UIViewController)
}

protocol SecondScreenViewControllerPresenterProtocol: AnyObject {
    
}


final class SecondScreenViewController: UIViewController {
    
    var presenter: SecondScreenPresenterProtocol!
    var router: SecondScreenRouterProtocol!
    
    private var secondScreenParameter: SecondScreenParameter
    
    init(secondScreenParameter: SecondScreenParameter) {
        self.secondScreenParameter = secondScreenParameter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray
        presenter.getSomethingFromWebService()
    }
}

extension SecondScreenViewController: SecondScreenViewControllerPresenterProtocol {
    
}

extension SecondScreenViewController: SecondScreenViewControllerRouterProtocol {
    func present(viewController: UIViewController) {
        self.present(viewController, animated: true, completion: nil)
    }
}
