//
//  UITableView+Extensions.swift
//  VIPTemplate
//
//  Created by Le Tuan on 18/3/20.
//  Copyright © 2020 Tuan Le. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    public func registerNib(cellName name: String) {
        register(UINib(nibName: name, bundle: nil), forCellReuseIdentifier: name)
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: String(describing: name), for: indexPath) as! T
    }
}
