//
//  MainCardsViewPresenter+InOutData.swift
//  MainCardsView
//
//  Created by Miguel Roncallo on 11/11/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation

extension MainCardsViewPresenter {
    enum OutputModuleActionType {
        
    }
    
    // MARK: - initial module data
    struct ModuleInputData {
        
    }
    
    // MARK: - module input structure
    struct ModuleInput {
        let coordinator: MainCardsViewCoordinatorType
    }
    
    // MARK: - module output structure
    struct ModuleOutput {
        let moduleAction: OutputModuleActionType
    }
}
