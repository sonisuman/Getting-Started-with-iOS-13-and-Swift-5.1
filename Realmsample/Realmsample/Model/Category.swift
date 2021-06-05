//
//  Category.swift
//  Realmsample
//
//  Created by Soni Suman on 06/06/21.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var colour: String = ""
    let items = List<Item>()
}
