//
//  Candy+CoreDataProperties.swift
//  Candy
//
//  Created by Olivier Van hamme on 10/05/2021.
//
//

import Foundation
import CoreData



extension Candy {

    @nonobjc public class func fetchRequest()
    -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName : "Candy")
    }

    
    @NSManaged public var name: String?
    @NSManaged public var origin: Country?
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    public var wrappedName: String {
        
        return name ?? "N/A"
    }
}



extension Candy : Identifiable {}
