//
//  TodoListItem+CoreDataProperties.swift
//  TodoListItem
//
//  Created by Eric Zhang on 8/10/21.
//
//

import Foundation
import CoreData


extension TodoListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoListItem> {
        return NSFetchRequest<TodoListItem>(entityName: "TodoListItem")
    }

    @NSManaged public var createDate: String?
    @NSManaged public var name: String?
    @NSManaged public var notes: String?
    @NSManaged public var isFavoritie: Bool

}

extension TodoListItem : Identifiable {

}
