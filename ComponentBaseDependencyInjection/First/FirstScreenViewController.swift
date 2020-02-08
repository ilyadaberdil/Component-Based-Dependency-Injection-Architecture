//
//  ViewController.swift
//  ComponentBaseDependencyInjection
//
//  Created by Berdil İlyada Karacam on 8.02.2020.
//  Copyright © 2020 Berdil İlyada Karacam. All rights reserved.
//

import UIKit

protocol FirstScreenViewControllerRouterProtocol: AnyObject {
    func present(viewController: UIViewController)
}

protocol FirstScreenViewControllerPresenterProtocol: AnyObject {
    
}


final class FirstScreenViewController: UIViewController {
    
    var presenter: FirstScreenPresenterProtocol!
    var router: FirstScreenRouterProtocol!
    
    private var firstScreenParameter: FirstScreenParameter
    
    init(firstScreenParameter: FirstScreenParameter) {
        self.firstScreenParameter = firstScreenParameter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        presenter.getSomethingFromWebService()
        configureButton()
    }
    
    private func configureButton() {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        button.setTitle("Show Second", for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    @objc func buttonTapped() {
        // Also it can be call router directly
        // router.showSecondScreen()
        presenter.buttonTapped()
    }
}

extension FirstScreenViewController: FirstScreenViewControllerPresenterProtocol {
    
}

extension FirstScreenViewController: FirstScreenViewControllerRouterProtocol {
    func present(viewController: UIViewController) {
        self.present(viewController, animated: true, completion: nil)
    }
}
