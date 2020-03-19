//
//  String+Extensions.swift
//  VIPTemplate
//
//  Created by Le Tuan on 18/3/20.
//  Copyright © 2020 Tuan Le. All rights reserved.
//

import Foundation


extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
