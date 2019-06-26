//
//  Category.swift
//  Todoey
//
//  Created by Christian Sailer on 25.06.19.
//  Copyright © 2019 Christian Sailer. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
