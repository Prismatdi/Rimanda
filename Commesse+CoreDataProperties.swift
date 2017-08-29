//
//  Commesse+CoreDataProperties.swift
//  Rimanda
//
//  Created by leonardo mappa on 28/12/16.
//  Copyright © 2016 leonardo mappa. All rights reserved.
//

import Foundation
import CoreData


extension Commesse {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Commesse> {
        return NSFetchRequest<Commesse>(entityName: "Commesse");
    }

    @NSManaged public var anno: String?
    @NSManaged public var codicecli: String?
    @NSManaged public var descrizione: String?
    @NSManaged public var numero: String?
    @NSManaged public var cliente: Clienti?

}
