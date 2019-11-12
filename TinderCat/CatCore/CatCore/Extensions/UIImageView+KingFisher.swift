//
//  UIImageView+KingFisher.swift
//  CatCore
//
//  Created by Miguel Roncallo on 11/11/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    public func setImageWith(url: String) {
        let url = URL(string: url)
        self.kf.setImage(with: url)
    }
}
