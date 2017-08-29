//
//  Tecnici+CoreDataProperties.swift
//  Rimanda
//
//  Created by leonardo mappa on 28/12/16.
//  Copyright © 2016 leonardo mappa. All rights reserved.
//

import Foundation
import CoreData


extension Tecnici {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tecnici> {
        return NSFetchRequest<Tecnici>(entityName: "Tecnici");
    }

    @NSManaged public var codice: Int32
    @NSManaged public var descrizione: String?
    @NSManaged public var mail: String?
    @NSManaged public var tipointervento: String?
    @NSManaged public var user: NSSet?

}

