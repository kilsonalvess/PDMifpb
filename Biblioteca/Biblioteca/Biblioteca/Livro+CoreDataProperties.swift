//
//  Livro+CoreDataProperties.swift
//  Biblioteca
//
//  Created by ifpb on 03/07/23.
//
//

import Foundation
import CoreData


extension Livro {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Livro> {
        return NSFetchRequest<Livro>(entityName: "Livro")
    }

    @NSManaged public var autor: String?
    @NSManaged public var nome: String?
    @NSManaged public var editora: String?
    @NSManaged public var status: String?
    @NSManaged public var emprestado: Bool

}

extension Livro : Identifiable {

}
