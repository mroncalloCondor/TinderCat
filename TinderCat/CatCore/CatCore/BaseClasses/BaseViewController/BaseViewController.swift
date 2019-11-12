//
//  BaseViewController.swift
//  CatCore
//
//  Created by Miguel Roncallo on 11/11/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation

open class BaseViewController<PresenterType>: UIViewController {
    public var presenter: PresenterType!
    
    public init(presenter: PresenterType) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
