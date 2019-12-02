//
//  LogInPresenter+InOutData.swift
//  LogIn
//
//  Created by Miguel Roncallo on 12/2/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation

extension LogInPresenter {
    enum OutputModuleActionType {
        
    }
    
    // MARK: - initial module data
    struct ModuleInputData {
        
    }
    
    // MARK: - module input structure
    struct ModuleInput {
        let coordinator: LogInCoordinatorType
    }
    
    // MARK: - module output structure
    struct ModuleOutput {
        let moduleAction: OutputModuleActionType
    }
}
