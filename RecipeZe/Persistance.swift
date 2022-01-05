////
////  Persistance.swift
////  RecipeZe
////
////  Created by User on 27.09.21.
////
//
//import Foundation
//import CoreData
//
////create struct for accesing the NSPersistentContainer
//
//class CoreDataManager {
//    let persistentContainer: NSPersistentContainer
//
//
//    init(){
//        persistentContainer = NSPersistentContainer(name: "RecipeZeCoreData")
//        persistentContainer.loadPersistentStores { (description,error) in
//            if let error = error {
//                fatalError("Core Data Store Failed \(error.localizedDescription)")
//            }
//        }
//    }
//
//    func getAllFavs() -> [Meal] {
//        let fetchRequest: NSFetchRequest<Meal> = Meal.fetchRequest()
//
//        do {
//          return   persistentContainer.viewContext.fetch(fetchRequest)
//        } catch {
//            return []
//        }
//
//    }
//
//
//    func saveToFavs(mealId: String ) {
//
//        let favorite = Meal(context: persistentContainer.viewContext)
//        favorite.idMeal = mealId
//
//        do {
//          try  persistentContainer.viewContext.save()
//        }catch {
//            print("Failed to save to favorites \(error)")
//        }
//    }
//}
