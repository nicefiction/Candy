//
// MARK: ContentView.swift
/**
 `SOURCE` :
 https://www.hackingwithswift.com/books/ios-swiftui/one-to-many-relationships-with-core-data-swiftui-and-fetchrequest
 
 Core Data allows us to link entities together using relationships ,
 and when we use `@FetchRequest`
 Core Data sends all that data back to us for use .
 However , this is one area where Core Data shows its age a little :
 to get relationships to work well
 we need to make a custom `NSManagedObject subclass`
 that providers wrappers that are more friendly to SwiftUI .
 */
/**
 `SOURCE` :
 https://www.hackingwithswift.com/forums/swiftui/is-this-correct-way-to-use-coredata-with-the-swiftui-2-0-atmain-app-protocol/2521/4404
 
 To have the candies display with their respective country without repeating the country section headers .
 OLIVIER : Also look at the Wizard project , DAY 57.5 ,
 https://www.hackingwithswift.com/books/ios-swiftui/ensuring-core-data-objects-are-unique-using-constraints.
 */

import SwiftUI
import CoreData



struct ContentView: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(entity : Country.entity() ,
                  sortDescriptors : []) var countries: FetchedResults<Country>
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES

    var body: some View {
        
        VStack {
            List {
                ForEach(countries , id : \.self) { (country: Country) in
                    Section(header : Text(country.wrappedFullName)) {
                        ForEach(country.candyArray , id : \.self) { (candy: Candy) in
                            Text(candy.wrappedName)
                        }
                    }
                }
            }
            Button("Create Candies") {
                let twix = Candy(context : managedObjectContext)
                twix.name = "Twix"
                twix.origin = Country(context : managedObjectContext)
                twix.origin?.shortName = "UK"
                twix.origin?.fullName = "United Kingdom"
                
                let mars = Candy(context : managedObjectContext)
                mars.name = "Mars"
                mars.origin = Country(context : managedObjectContext)
                mars.origin?.shortName = "UK"
                mars.origin?.fullName = "United Kingdom"
                
                let kitKat = Candy(context : managedObjectContext)
                kitKat.name = "KitKat"
                kitKat.origin = Country(context : managedObjectContext)
                kitKat.origin?.shortName = "UK"
                kitKat.origin?.fullName = "United Kingdom"
                
                let toblerone = Candy(context : managedObjectContext)
                toblerone.name = "Toblerone"
                toblerone.origin = Country(context : managedObjectContext)
                toblerone.origin?.shortName = "CH"
                toblerone.origin?.fullName = "Switzerland"
                
                try? managedObjectContext.save()
            }
        }
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView()
    }
}
