//
//  MainCardsViewController.swift
//  MainCardsView
//
//  Created by Miguel Roncallo on 11/11/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import CatCore

final class MainCardsViewController: BaseViewController<MainCardsViewPresenterType>, MainCardsViewType {
    
    private var mainCardsUIView: MainCardsViewUIType {
        return self.view as! MainCardsViewUIType
    }
    
    override func viewDidLoad() {
        self.presenter.bind(view: self)
        super.viewDidLoad()
        self.setupView()
        self.presenter.loadData()
    }
    
    private func setupView() {
        self.view = MainCardsView()
        self.presenter.setCardsViewDelegates(cardsView: mainCardsUIView.getCardsView())
    }
    
    func didFinishLoadingData() {
        mainCardsUIView.reloadCardsView()
    }
}
