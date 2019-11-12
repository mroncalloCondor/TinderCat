//
//  MainCardsView.swift
//  MainCardsView
//
//  Created by Miguel Roncallo on 11/11/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import Koloda
import CatCore

final class MainCardsView: UIView, MainCardsViewUIType {
    
    private lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 20
        return stack
    }()
    
    private lazy var cardsView: KolodaView = {
        let view = KolodaView()
        return view
    }()
    
    private lazy var acceptButton: UIButton = {
        let button = UIButton()
        button.setTitle("Like", for: .normal)
        button.setTitleColor(.green, for: .normal)
        button.addTarget(self, action: #selector(self.swipeRight), for: .touchUpInside)
        return button
    }()
    
    private lazy var declineButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(self.swipeLeft), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50, enableInsets: false)
        return stack
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        self.backgroundColor = .white
        self.clipsToBounds = true
        
        buttonStack.addArrangedSubview(declineButton)
        buttonStack.addArrangedSubview(acceptButton)
        mainStack.addArrangedSubview(cardsView)
        mainStack.addArrangedSubview(buttonStack)
        self.addSubview(mainStack)
        mainStack.anchor(top: self.topAnchor,
                         left: self.leftAnchor,
                         bottom: self.bottomAnchor,
                         right: self.rightAnchor,
                         paddingTop: 100,
                         paddingLeft: 20,
                         paddingBottom: 50,
                         paddingRight: 20,
                         width: 0,
                         height: 0,
                         enableInsets: true)
    }
    
    func getCardsView() -> KolodaView {
        return self.cardsView
    }
    
    func reloadCardsView() {
        self.cardsView.reloadData()
    }
    
    @objc func swipeRight() {
        cardsView.swipe(.right)
    }
    
    @objc func swipeLeft() {
        cardsView.swipe(.left)
    }
}
