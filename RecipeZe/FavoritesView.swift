//
//  FavoritesView.swift
//  RecipeZe
//
//  Created by Yusmen Kadir on 26.09.21.
//

import SwiftUI
import SwiftyJSON
import FirebaseFirestore

struct FavoritesView: View {
    @State var favMeals = [MealByNameInfo]()
    
    private var db = Firestore.firestore()
    @State var animated = false
    
    func deleteFavMeal(id:String) {
        db.collection("userFavorites").document(id).delete { error in
            if let error = error {
                print(error.localizedDescription)
            }
            
            DispatchQueue.main.async {
                self.favMeals.removeAll { item in
                    return item.id == id
                }
            }
            
            
        }
    }
    
    
    func fetchData(completion: @escaping ([MealByNameInfo]) -> ()) {
        
        db.collection("userFavorites").getDocuments{  snapshot, error  in
            if error == nil {
                
                if let snapshot  = snapshot {
                    snapshot.documents.map { meal in
                        let data = meal.data()
                        
                        let idMeal = data["idMeal"] as? String ?? ""
                        let strArea = data["strArea"] as? String ?? ""
                        let strCategory = data["strCategory"] as? String ?? ""
                        let dateModified = data["dateModified"] as? String ?? ""
                        let strCreativeCommonsConfirmed = data["strCreativeCommonsConfirmed"] as? String ?? ""
                        let strSource = data["strSource"] as? String ?? ""
                        let strMeal = data["strMeal"] as? String ?? ""
                        let strTags = data["strTags"] as? String ?? ""
                        let strYoutube = data["strYoutube"] as? String ?? ""
                        let strInstructions = data["strInstructions"] as? String ?? ""
                        let strDrinkAlternate = data["strDrinkAlternate"] as? String ?? ""
                        let strImageSource = data["strImageSource"] as? String ?? ""
                        let strIngredient1 = data["strIngredient1"] as? String ?? ""
                        let strIngredient2 = data["strIngredient2"] as? String ?? ""
                        let strIngredient3 = data["strIngredient3"] as? String ?? ""
                        let strIngredient4 = data["strIngredient4"] as? String ?? ""
                        let strIngredient5 = data["strIngredient5"] as? String ?? ""
                        let strIngredient6 = data["strIngredient6"] as? String ?? ""
                        let strIngredient7 = data["strIngredient7"] as? String ?? ""
                        let strIngredient8 = data["strIngredient8"] as? String ?? ""
                        let strIngredient9 = data["strIngredient9"] as? String ?? ""
                        let strIngredient10 = data["strIngredient10"] as? String ?? ""
                        let strIngredient11 = data["strIngredient11"] as? String ?? ""
                        let strIngredient12 = data["strIngredient12"] as? String ?? ""
                        let strIngredient13 = data["strIngredient13"] as? String ?? ""
                        let strIngredient14 = data["strIngredient14"] as? String ?? ""
                        let strIngredient15 = data["strIngredient15"] as? String ?? ""
                        let strIngredient16 = data["strIngredient16"] as? String ?? ""
                        let strIngredient17 = data["strIngredient17"] as? String ?? ""
                        let strIngredient18 = data["strIngredient18"] as? String ?? ""
                        let strIngredient19 = data["strIngredient19"] as? String ?? ""
                        let strIngredient20 = data["strIngredient20"] as? String ?? ""
                        let strMealThumb = data["strMealThumb"] as? String ?? ""
                        let strMeasure1 = data["strMeasure1"] as? String ?? ""
                        let strMeasure2 = data["strMeasure2"] as? String ?? ""
                        let strMeasure3 = data["strMeasure3"] as? String ?? ""
                        let strMeasure4 = data["strMeasure4"] as? String ?? ""
                        let strMeasure5 = data["strMeasure5"] as? String ?? ""
                        let strMeasure6 = data["strMeasure6"] as? String ?? ""
                        let strMeasure7 = data["strMeasure7"] as? String ?? ""
                        let strMeasure8 = data["strMeasure8"] as? String ?? ""
                        let strMeasure9 = data["strMeasure9"] as? String ?? ""
                        let strMeasure10 = data["strMeasure10"] as? String ?? ""
                        let strMeasure11 = data["strMeasure11"] as? String ?? ""
                        let strMeasure12 = data["strMeasure12"] as? String ?? ""
                        let strMeasure13 = data["strMeasure13"] as? String ?? ""
                        let strMeasure14 = data["strMeasure14"] as? String ?? ""
                        let strMeasure15 = data["strMeasure15"] as? String ?? ""
                        let strMeasure16 = data["strMeasure16"] as? String ?? ""
                        let strMeasure17 = data["strMeasure17"] as? String ?? ""
                        let strMeasure18 = data["strMeasure18"] as? String ?? ""
                        let strMeasure19 = data["strMeasure19"] as? String ?? ""
                        let strMeasure20 = data["strMeasure20"] as? String ?? ""
                        
                        
                        DispatchQueue.main.async {
                            self.favMeals.append(MealByNameInfo(id: meal.documentID, idMeal: idMeal, strMeal: strMeal, strDrinkAlternate: strDrinkAlternate, strCategory: strCategory, strArea: strArea, strInstructions: strInstructions, strMealThumb: strMealThumb, strTags: strTags, strYoutube: strYoutube, strIngredient1: strIngredient1, strIngredient2: strIngredient2, strIngredient3: strIngredient3, strIngredient4: strIngredient4, strIngredient5: strIngredient5, strIngredient6: strIngredient6, strIngredient7: strIngredient7, strIngredient8: strIngredient8, strIngredient9: strIngredient9, strIngredient10: strIngredient10, strIngredient11: strIngredient11, strIngredient12: strIngredient12, strIngredient13: strIngredient13, strIngredient14: strIngredient14, strIngredient15: strIngredient15, strIngredient16: strIngredient16, strIngredient17: strIngredient17, strIngredient18: strIngredient18, strIngredient19: strIngredient19, strIngredient20: strIngredient20, strMeasure1: strMeasure1, strMeasure2: strMeasure2, strMeasure3: strMeasure3, strMeasure4: strMeasure4, strMeasure5: strMeasure5, strMeasure6: strMeasure6, strMeasure7: strMeasure7, strMeasure8: strMeasure8, strMeasure9: strMeasure9, strMeasure10: strMeasure10, strMeasure11: strMeasure11, strMeasure12: strMeasure12, strMeasure13: strMeasure13, strMeasure14:strMeasure14 , strMeasure15: strMeasure15, strMeasure16: strMeasure16, strMeasure17: strMeasure17, strMeasure18: strMeasure18, strMeasure19: strMeasure19, strMeasure20: strMeasure20, strSource: strSource, strImageSource: strImageSource, strCreativeCommonsConfirmed: strCreativeCommonsConfirmed, dateModified: dateModified))
                        }
                    }
                }
                
            }else {
                print(error?.localizedDescription)
            }
        }
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
                
                if favMeals.count < 1 {
                    Image(systemName: "heart").foregroundColor(Color.orange)
                        .font(.system(size: 56.0, weight: .bold))
                    Text("There are no Favorite Meals!").bold().font(.system(.title3))
                    Spacer()
                } else {
                    ScrollView {
                        ForEach(favMeals, id: \.self) {element in
                            ZStack {
                                URLImage(url: element.strMealThumb!)
                                    .frame(width:350,height: 280)
                                    .cornerRadius(12)
                                    .overlay(RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.orange, lineWidth: 3))
                                    .shadow(radius: 5)
                                    .overlay(TintOverlay(mealName: element.strMeal).opacity(0.5))
                            }
                            
                            
                            
                            Button(action: {
                                deleteFavMeal(id: element.id!)
                            }) {
                                
                                
                                (Text(Image(systemName: "heart.fill")) + Text("Remove From Favorites")).bold().frame(width: 350, height: 50, alignment: .center)
                                
                            }
                            .background(Color.orange)
                            .foregroundColor(Color.white)
                            .cornerRadius(5)
                            .font(.title3)
                            
                        }
                        Spacer()
                    }
                }
                
            }
            
            .navigationTitle("Favorites")
            
            
            
        }
        
        .onAppear {
            self.favMeals = [MealByNameInfo]()
            fetchData(){(mealInfo) in
                self.favMeals = mealInfo
            }
        }
        
        
    }
}





