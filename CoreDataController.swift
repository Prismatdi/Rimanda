//
//  CoreDataController.swift
//  Introduzione Core Data
//
//  Created by Giuseppe Sapienza on 27/02/16.
//  Copyright © 2016 xCoding.it. All rights reserved.
//

import Foundation
import CoreData
import UIKit

/*
    La classe CoreDataController è stata creata con l'unico scopo di velocizzare l'interazione con le funzioni del Core Data.
    Qui dentro troverai le funzioni necessarie al salvataggio, eliminazione ecc degli elementi salvati in memoria.
*/

class CoreDataController {
    static let shared = CoreDataController() // proprietà per ottenere la classe in modalità Singleton
    
    private var context: NSManagedObjectContext // riferimento al contenitore degli oggetti (ManagedObject) salvati in memoria
    
    private init() {
        let application = UIApplication.shared.delegate as! AppDelegate // recupero l'istanza dell'AppDelegate dell'applicazione
        self.context = application.persistentContainer.viewContext // recupero il ManagedObjectContext dalla proprietà persistantContainer presente nell'App Delegate
    }
    
    /*
        Funzione per l'inserimento in memoria di un nuovo libro
     */
    func addLibro(nome: String, autore: String, num_pagine: Int) {
        /*
            Per creare un oggetto da inserire in memoria è necessario creare un riferimento all'Entity (NSEntityDescription) da cui si copierà la struttura di base
         */
        let entity = NSEntityDescription.entity(forEntityName: "Libro", in: self.context)
        
        /*
            creiamo un nuovo oggetto NSManagedObject dello stesso tipo descritto dalla NSEntityDescription
            che andrà inserito nel context dell'applicazione
         */
        let newLibro = Libro(entity: entity!, insertInto: self.context)
        newLibro.nome = nome
        newLibro.autore = autore
        newLibro.num_pagine = Int16(num_pagine)
        
        do {
            try self.context.save() // la funzione save() rende persistente il nuovo oggetto (newLibro) in memoria
        } catch let errore {
            print("[CDC] Problema salvataggio Libro: \(newLibro.nome!) in memoria")
            print("  Stampo l'errore: \n \(errore) \n")
        }
        
        print("[CDC] Libro \(newLibro.nome!) salvato in memoria correttamente")
    }
    
    /*
        La funzione carica e stampa in console tutti i libri presenti nella memoria
     */
    func loadAllBooks() {
        print("[CDC] Recupero tutti i libri dal context ")
        
        let request: NSFetchRequest<Libro> = NSFetchRequest(entityName: "Libro") // l'oggetto rappresenta una richiesta da inviare al context per la ricerca di oggetti di tipo entityName (nome dell'entity da cercare)
        request.returnsObjectsAsFaults = false
        
        let books = self.loadBooksFromFetchRequest(request: request)
        
    }
    
    
    func loadBooksFromAuthor(author: String) {
        print("[CDC] Recupero tutti i libri dal context ")
        
        let request: NSFetchRequest<Libro> = NSFetchRequest(entityName: "Libro")
        request.returnsObjectsAsFaults = false
        
        let predicate = NSPredicate(format: "autore = %@", author) // L'oggetto predicate permette di aggiungere dei filtri sulla NSFetchRequest
        request.predicate = predicate
        
        let books = self.loadBooksFromFetchRequest(request: request)
    }
    
    /* 
      La funzione restituisce un array di libri dopo aver eseguito la request
    */
    private func loadBooksFromFetchRequest(request: NSFetchRequest<Libro>) -> [Libro] {
        var array = [Libro]()
        do {
            array = try self.context.fetch(request)
            
            guard array.count > 0 else {print("[CDC] Non ci sono elementi da leggere "); return []}
            
            for x in array {
                print("[CDC] Libro \(x.nome!) - Autore \(x.autore!)")
            }
            
        } catch let errore {
            print("[CDC] Problema esecuzione FetchRequest")
            print("  Stampo l'errore: \n \(errore) \n")
        }
        
        return array
    }
    
    /*
     La funzione recupera il libro che ha lo stesso nome del parametro "name" (qualora esistesse)
     */
    func loadBookFromName(name: String) -> Libro {
        let request: NSFetchRequest<Libro> = NSFetchRequest(entityName: "Libro")
        request.returnsObjectsAsFaults = false
        
        let predicate = NSPredicate(format: "nome = %@", name)
        request.predicate = predicate
        
        let books = self.loadBooksFromFetchRequest(request: request)
        return books[0]
    }
    
    /*
        La funzione cancella dalla memoria il libro che ha per nome il paramentro "name"
     */
    func deleteBook(name: String) {
        let book = self.loadBookFromName(name: name)
        self.context.delete(book)
        
        do {
            try self.context.save()
        } catch let errore {
            print("[CDC] Problema eliminazione libro ")
            print("  Stampo l'errore: \n \(errore) \n")
        }
    }
    
}
