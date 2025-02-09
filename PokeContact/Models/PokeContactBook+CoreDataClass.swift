//
//  PokeContactBook+CoreDataClass.swift
//  PokeContact
//
//  Created by 이명지 on 12/9/24.
//
//

import Foundation
import CoreData

@objc(PokeContactBook)
public class PokeContactBook: NSManagedObject {
    public static let className = "PokeContactBook"
    public enum Key {
        static let name = "name"
        static let phoneNumber = "phoneNumber"
        static let profileImage = "profileImage"
    }
}
