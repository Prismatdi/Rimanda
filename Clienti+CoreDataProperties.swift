//
//  Clienti+CoreDataProperties.swift
//  Rimanda
//
//  Created by leonardo mappa on 28/12/16.
//  Copyright © 2016 leonardo mappa. All rights reserved.
//

import Foundation
import CoreData


extension Clienti {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Clienti> {
        return NSFetchRequest<Clienti>(entityName: "Clienti");
    }

    @NSManaged public var codice: String?
    @NSManaged public var email: String?
    @NSManaged public var indirizzo: String?
    @NSManaged public var latitudine: Double
    @NSManaged public var longitudine: Double
    @NSManaged public var ragionesociale: String?
    @NSManaged public var commesse: NSSet?

}

