//
//  Client+CoreDataProperties.swift
//  DesafioCRUD
//
//  Created by user220212 on 5/3/22.
//
//

import Foundation
import CoreData


extension Client {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Client> {
        return NSFetchRequest<Client>(entityName: "Client")
    }

    @NSManaged public var name: String?
    @NSManaged public var cpf: String?
    @NSManaged public var email: String?
    @NSManaged public var birthDate: Date?
    @NSManaged public var confirmPassword: String?
    @NSManaged public var income: String?
    @NSManaged public var password: String?
    @NSManaged public var equity: String?
    @NSManaged public var account: Int64
    @NSManaged public var agency: String?
}

extension Client : Identifiable {

}
