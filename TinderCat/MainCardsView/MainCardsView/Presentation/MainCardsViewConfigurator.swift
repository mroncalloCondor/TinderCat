//
//  MainCardsViewConfigurator.swift
//  MainCardsView
//
//  Created by Miguel Roncallo on 11/11/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import CatCore
import Services


public final class MainCardsViewConfigurator {
    static private var catCardsRepository: CatCardsRepository?
    static private var getCatsListInteractor: SingleInteractor<CatList, CatsListParams>?
    
    class func configure(moduleInput: MainCardsViewPresenter.ModuleInput) -> UIViewController{
        let dependencies = self.createDependencies(coordinator: moduleInput.coordinator)
        let presenter = MainCardsViewPresenter(dependencies: dependencies)
        let viewController = MainCardsViewController(presenter: presenter)
        return viewController
    }
    
    private class func createDependencies(coordinator: MainCardsViewCoordinatorType) -> MainCardsViewPresenter.InputDependencies {
        self.catCardsRepository = CatCardsRepository(apiClient: APIClient())
        getCatsListInteractor = GetCatsListInteractor(catsDataRepository: catCardsRepository!)
        let dependencies = MainCardsViewPresenter.InputDependencies(coordinator: coordinator,
            getCatsListInteractor: getCatsListInteractor!)
        
        return dependencies
    }
    
    static func module(moduleInput: MainCardsViewPresenter.ModuleInput) -> (UIViewController)? {
        let output = MainCardsViewConfigurator.configure(moduleInput: moduleInput)
        return output
    }
    
}
