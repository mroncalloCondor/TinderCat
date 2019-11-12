//
//  MainCardsViewPresenter.swift
//  MainCardsView
//
//  Created by Miguel Roncallo on 11/11/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import CatCore
import RxSwift
import Koloda

final class MainCardsViewPresenter: BasePresenter<MainCardsViewType>, MainCardsViewPresenterType {
    
    private var page = 0
    private let limit = 50
    private var catList = CatList(catList: [])
    
    struct InputDependencies {
        weak var coordinator: MainCardsViewCoordinatorType?
        weak var getCatsListInteractor: SingleInteractor<CatList, CatsListParams>?
    }
    
    private let dependencies: InputDependencies
    
    init(dependencies: InputDependencies) {
        self.dependencies = dependencies
        super.init()
    }
    
    func loadData() {
        let params = CatsListParams(page: page, limit: limit)
        self.dependencies
            .getCatsListInteractor?
            .params(params)
            .onSuccess({ [weak self] (catList) in
                self?.catList = catList
                self?.view!.didFinishLoadingData()
            }).onError({ (error) in
                print(error.localizedDescription)
            }).execute()
    }
    
    func setCardsViewDelegates(cardsView: KolodaView) {
        cardsView.delegate = self
        cardsView.dataSource = self
    }
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return self.catList.catList.count
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let imageView = UIImageView()
        imageView.setImageWith(url: self.catList.catList[index].url)
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        return imageView
    }
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        switch direction{
        case .right:
            print("Liked picture")
        case .left:
            print("Didn't like picture")
        default: break
        }
    }
}
