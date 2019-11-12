//
//  MainCardsViewContract.swift
//  MainCardsView
//
//  Created by Miguel Roncallo on 11/11/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import CatCore
import Koloda

protocol MainCardsViewType {
    func didFinishLoadingData()
}

protocol MainCardsViewPresenterType: BasePresenterType, KolodaViewDelegate, KolodaViewDataSource {
    func loadData()
    func setCardsViewDelegates(cardsView: KolodaView)
}

protocol MainCardsViewUIType {
    func getCardsView() -> KolodaView
    func reloadCardsView()
}
