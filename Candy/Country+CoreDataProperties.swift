// MARK: Country+CoreDataProperties.swift

import Foundation
import CoreData



extension Country {

    @nonobjc public class func fetchRequest()
    -> NSFetchRequest<Country> {
        
        return NSFetchRequest<Country>(entityName : "Country")
    }

    @NSManaged public var fullName: String?
    @NSManaged public var shortName: String?
    @NSManaged public var candy: NSSet?
    /**
     `NOTE` :
     The `Country` class has a candy property that is an `NSSet`.
     This is the older , Objective-C data type
     that is equivalent to Swift’s `Set`,
     but we can’t use it with SwiftUI’s `ForEach`.
     To fix this
     we need to modify the files Xcode generated for us ,
     adding convenience wrappers that make SwiftUI work well .
     ☘️
     */
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    public var wrappedFullName: String {
        
        return fullName ?? "N/A"
    }
    
    
    public var wrappedShortName: String {
        
        return shortName ?? "N/A"
    }
    
    /*
     public var candyArray: [Candy] {
         let set = candy as? Set<Candy> ?? []
         return set.sorted {
             $0.wrappedName < $1.wrappedName
         }
     }
     */
    public var candyArray: [Candy] {
        /**
         ☘️
         `1` Convert it from an `NSSet` to a `Set<Candy>`
         — a Swift-native type where we know the types of its contents :
         */
        let candySet = candy as? Set<Candy> ?? []
        /**
         ☘️☘️
         `2` Convert that `Set<Candy>` into an array ,
         so that `ForEach` can read individual values from there .
         `3` Sort that array , so the candy bars come in a sensible order .
         */
        return candySet.sorted { (candy1: Candy , candy2: Candy) in
            candy1.wrappedName < candy2.wrappedName
        }
    }
}



// MARK: Generated accessors for candy
extension Country {

    @objc(addCandyObject:)
    @NSManaged public func addToCandy(_ value: Candy)

    @objc(removeCandyObject:)
    @NSManaged public func removeFromCandy(_ value: Candy)

    @objc(addCandy:)
    @NSManaged public func addToCandy(_ values: NSSet)

    @objc(removeCandy:)
    @NSManaged public func removeFromCandy(_ values: NSSet)

}



extension Country : Identifiable {}
