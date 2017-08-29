//
//  LocalController.swift
//  AppRimborsi
//
//  Created by leonardo mappa on 18/01/16.
//  Copyright © 2016 leonardo mappa. All rights reserved.
//
import Foundation
import UIKit
import CoreData

class LocalController {
    static let localController = LocalController()
    let appDel:AppDelegate = (UIApplication.shared.delegate as! AppDelegate)
	private var context: NSManagedObjectContext
	
    var model: NSManagedObjectModel!
	
	private init() {
		let application = UIApplication.shared.delegate as! AppDelegate // recupero l'istanza dell'AppDelegate dell'applicazione
		self.context = application.persistentContainer.viewContext // recupero il ManagedObjectContext dalla proprietà persistantContainer presente nell'App Delegate
	}
	
	
	// MARK: - metodi Inserimento Vuoto
	
	func getClienteVuoto() -> Clienti{
		let entDest = NSEntityDescription.entity(forEntityName: "Clienti", in: self.context)
		return Clienti(entity: entDest!, insertInto: self.context)
	}
	func getInterventoVuoto() -> Interventi{
		let entDest = NSEntityDescription.entity(forEntityName: "Interventi", in: self.context)
		return Interventi(entity: entDest!, insertInto: self.context)
	}
	func getCommessaVuoto() -> Commesse{
		let entDest = NSEntityDescription.entity(forEntityName: "Commesse", in: self.context)
		return Commesse(entity: entDest!, insertInto: self.context)
	}
	func getUserVuoto() -> Users{
		let entDest = NSEntityDescription.entity(forEntityName: "Users", in: self.context)
		return Users(entity: entDest!, insertInto: self.context)
	}
	func getTecnicoVuoto() -> Tecnici{
		let entDest = NSEntityDescription.entity(forEntityName: "Tecnici", in: self.context)
		return Tecnici(entity: entDest!, insertInto: self.context)
	}
	
	private func loadClientiFromFetchRequest(request: NSFetchRequest<Clienti>) -> [Clienti] {
		var array = [Clienti]()
		do {
			array = try self.context.fetch(request)
			
			guard array.count > 0 else {print("[CDC] Non ci sono elementi da leggere "); return []}
			
			
		} catch let errore {
			print("[] Problema esecuzione FetchRequest")
			print("  Stampo l'errore: \n \(errore) \n")
		}
		
		return array
	}

	
	
	
	
    //	// MARK: - metodi Automezzi
//	func clearAutomezzi(){
//		var request: NSFetchRequest<Automezzi>
//		if #available(iOS 10.0, *) {
//			request = Automezzi.fetchRequest() as! NSFetchRequest<Automezzi>
//		}else{
//			request = NSFetchRequest(entityName: "Automezzi")
//		}
//
//		request.returnsObjectsAsFaults = false
//		request.includesPropertyValues = false
//		do{
//			let results = try getContext().fetch(request)
//			if results.count > 0{
//				for dsp in results{
//					let myDsp = dsp 
//					getContext().delete(myDsp)
//				}
//				do{
//					try getContext().save()
//				}
//				catch{
//					NotificationCenter.default.post(name: Notification.Name(rawValue: Notifications.getClearError), object: ["message":"Errore in fase di salvataggio di cancellazione Automezzi"])
//				}
//			}
//		}
//		catch{
//			NotificationCenter.default.post(name: Notification.Name(rawValue: Notifications.getClearError), object: ["message":"Non esistono Automezzi"])
//		}
//	}
	
	
	// MARK: - metodi Causali
	//    func findCausaleConId(_ idCausale: NSNumber) throws -> Causali{
//        let fetch: NSFetchRequest = model.fetchRequestFromTemplate(withName: "CausaleConId", substitutionVariables: ["idCau": idCausale])!
//        let obj = try context.fetch(fetch)
//        let result = obj[0] as! Causali
//        return result
//    }
//    func findDettaglio(_ idDettaglio: NSNumber) throws -> CausaliDettaglio{
//        let fetch: NSFetchRequest = model.fetchRequestFromTemplate(withName: "DettaglioCausaleConId", substitutionVariables: ["idDett": idDettaglio])!
//        let obj = try context.fetch(fetch)
//        let result = obj[0] as! CausaliDettaglio
//        return result
//    }
	
//	func getCausaleVuoto() -> Causali{
//		let entDest = NSEntityDescription.entity(forEntityName: "Causali", in: getContext())
//		return Causali(entity: entDest!, insertInto: getContext())
//	}
	

	
	
}
