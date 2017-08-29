//
//  Interventi+CoreDataProperties.swift
//  Rimanda
//
//  Created by leonardo mappa on 28/12/16.
//  Copyright © 2016 leonardo mappa. All rights reserved.
//

import Foundation
import CoreData


extension Interventi {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Interventi> {
        return NSFetchRequest<Interventi>(entityName: "Interventi");
    }

    @NSManaged public var annoCommessa: String?
    @NSManaged public var annoTel: String?
    @NSManaged public var cancellato: Bool
    @NSManaged public var chiFase: Int32
    @NSManaged public var chiMo: Int32
    @NSManaged public var codiceCliente: String?
    @NSManaged public var codiceTecnico: Int32
    @NSManaged public var dataFt: String?
    @NSManaged public var dataImmissione: String?
    @NSManaged public var dataIntervento: String?
    @NSManaged public var descIntervento: String?
    @NSManaged public var dirChi: Int32
    @NSManaged public var fatturato: Int32
    @NSManaged public var id: Int32
    @NSManaged public var impDir: Double
    @NSManaged public var importoOra: Double
    @NSManaged public var impPro: Double
    @NSManaged public var km: Double
    @NSManaged public var mandato: Int32
    @NSManaged public var monteOre: Int32
    @NSManaged public var numeroCommessa: String?
    @NSManaged public var numeroFt: String?
    @NSManaged public var numeroImmissione: Int32
    @NSManaged public var numeroIntervento: String?
    @NSManaged public var numeroTel: Double
    @NSManaged public var numFase: Double
    @NSManaged public var numImp: Double
    @NSManaged public var numMo: Double
    @NSManaged public var oreFatturate: Double
    @NSManaged public var oreIntervento: Double
    @NSManaged public var prepagato: Int32
    @NSManaged public var progetto: Int32
    @NSManaged public var rinviare: Int32
    @NSManaged public var sincronizzato: Bool
    @NSManaged public var tipoFt: String?
    @NSManaged public var tipoIntervento: String?
    @NSManaged public var ufficio: Int32

}
