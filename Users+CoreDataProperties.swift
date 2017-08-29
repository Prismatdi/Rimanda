//
//  Users+CoreDataProperties.swift
//  Rimanda
//
//  Created by leonardo mappa on 28/12/16.
//  Copyright © 2016 leonardo mappa. All rights reserved.
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users");
    }

    @NSManaged public var codice: Int32
    @NSManaged public var password: String?
    @NSManaged public var username: String?
    @NSManaged public var tecnico: Tecnici?

}
