//
//  BasePresenter.swift
//  CatCore
//
//  Created by Miguel Roncallo on 11/11/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation

public protocol BasePresenterType {
    associatedtype View
    var view: View? { get set }
    
    func bind<BindableView: UIViewController>(view: BindableView)
    func unbind()
}

open class BasePresenter<ViewType>: BasePresenterType {
    
    public typealias View = ViewType
    
    public var view: View?
    
    public init() {
    }
    
    public func bind<BindableView>(view: BindableView)
        where BindableView: UIViewController {
            self.view = view as? ViewType
    }
    
    public func unbind() {
        self.view = nil
    }
    
    deinit {
        self.unbind()
    }
}
