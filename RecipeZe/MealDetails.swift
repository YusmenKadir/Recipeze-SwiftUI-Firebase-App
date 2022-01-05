//
//  MealDetails.swift
//  RecipeZe
//
//  Created by Yusmen Kadir on 24.09.21.
//

import SwiftUI
import SwiftyJSON
import FirebaseFirestore
import ToastUI


struct MealDetails: View {
    var mealId: String?
    init(mealId:String){
        self.mealId = mealId
    }
    
    
    @State var mealByName = [MealByNameInfo]()
    @State var mealIngredients = [String:String]()
    @State  var presentingToast: Bool = false
    @State var presentingFinished: Bool = false
    private var db = Firestore.firestore()
    
    
    func addMealToFavs(){
        let copy = self.mealByName.first;
        let id: String? = copy?.idMeal
        let thumbImage:String? = copy?.strMealThumb
        let mealArea:String? = copy?.strArea
        let mealTags:String? = copy?.strTags
        let mealName:String? = copy?.strMeal
        let mealCategory:String? = copy?.strCategory
        
        
        
        do {
            _ = try db.collection("userFavorites").addDocument(data: ["idMeal":id, "strMeal":mealName, "strMealThumb":thumbImage, "strArea":mealArea,"strTags":mealTags,  "strCategory":mealCategory])
        }catch {
            print(error)
        }
        
        
        
    }
    
    func fetchMealByNameInfo(completion: @escaping ([MealByNameInfo]) -> ()){
        let source = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(mealId!)"
        
        
        let url = URL(string: source)!
        let session = URLSession(configuration: .default)
        session.dataTask(with: url){(data,_,err) in
            
            let json = try! JSON(data:data!)
            
            
            for i in json["meals"]{
                let idMeal = i.1["idMeal"].stringValue
                let strMeal = i.1["strMeal"].stringValue
                let strDrinkAlternate = i.1["strDrinkAlternate"].stringValue
                let strCategory = i.1["strCategory"].stringValue
                let strArea = i.1["strArea"].stringValue
                let strInstructions = i.1["strInstructions"].stringValue
                let strMealThumb = i.1["strMealThumb"].stringValue
                let strTags = i.1["strTags"].stringValue
                let strYoutube = i.1["strYoutube"].stringValue
                let strIngredient1 = i.1["strIngredient1"].stringValue
                let strIngredient2 = i.1["strIngredient2"].stringValue
                let strIngredient3 = i.1["strIngredient3"].stringValue
                let strIngredient4 = i.1["strIngredient4"].stringValue
                let strIngredient5 = i.1["strIngredient5"].stringValue
                let strIngredient6 = i.1["strIngredient6"].stringValue
                let strIngredient7 = i.1["strIngredient7"].stringValue
                let strIngredient8 = i.1["strIngredient8"].stringValue
                let strIngredient9 = i.1["strIngredient9"].stringValue
                let strIngredient10 = i.1["strIngredient10"].stringValue
                let strIngredient11 = i.1["strIngredient11"].stringValue
                let strIngredient12 = i.1["strIngredient12"].stringValue
                let strIngredient13 = i.1["strIngredient13"].stringValue
                let strIngredient14 = i.1["strIngredient14"].stringValue
                let strIngredient15 = i.1["strIngredient15"].stringValue
                let strIngredient16 = i.1["strIngredient16"].stringValue
                let strIngredient17 = i.1["strIngredient17"].stringValue
                let strIngredient18 = i.1["strIngredient18"].stringValue
                let strIngredient19 = i.1["strIngredient19"].stringValue
                let strIngredient20 = i.1["strIngredient20"].stringValue
                let strMeasure1 = i.1["strMeasure1"].stringValue
                let strMeasure2 = i.1["strMeasure2"].stringValue
                let strMeasure3 = i.1["strMeasure3"].stringValue
                let strMeasure4 = i.1["strMeasure4"].stringValue
                let strMeasure5 = i.1["strMeasure5"].stringValue
                let strMeasure6 = i.1["strMeasure6"].stringValue
                let strMeasure7 = i.1["strMeasure7"].stringValue
                let strMeasure8 = i.1["strMeasure8"].stringValue
                let strMeasure9 = i.1["strMeasure9"].stringValue
                let strMeasure10 = i.1["strMeasure10"].stringValue
                let strMeasure11 = i.1["strMeasure11"].stringValue
                let strMeasure12 = i.1["strMeasure12"].stringValue
                let strMeasure13 = i.1["strMeasure13"].stringValue
                let strMeasure14 = i.1["strMeasure14"].stringValue
                let strMeasure15 = i.1["strMeasure15"].stringValue
                let strMeasure16 = i.1["strMeasure16"].stringValue
                let strMeasure17 = i.1["strMeasure17"].stringValue
                let strMeasure18 = i.1["strMeasure18"].stringValue
                let strMeasure19 = i.1["strMeasure19"].stringValue
                let strMeasure20 = i.1["strMeasure20"].stringValue
                let strSource = i.1["strSource"].stringValue
                let strImageSource = i.1["strImageSource"].stringValue
                let strCreativeCommonsConfirmed = i.1["strCreativeCommonsConfirmed"].stringValue
                let dateModified = i.1["dateModified"].stringValue
                
                
                self.mealIngredients["\(strIngredient1)"] = strMeasure1
                self.mealIngredients["\(strIngredient2)"] = strMeasure2
                self.mealIngredients["\(strIngredient3)"] = strMeasure3
                self.mealIngredients["\(strIngredient4)"] = strMeasure4
                self.mealIngredients["\(strIngredient5)"] = strMeasure5
                self.mealIngredients["\(strIngredient6)"] = strMeasure6
                self.mealIngredients["\(strIngredient7)"] = strMeasure7
                self.mealIngredients["\(strIngredient8)"] = strMeasure8
                self.mealIngredients["\(strIngredient9)"] = strMeasure9
                self.mealIngredients["\(strIngredient10)"] = strMeasure10
                self.mealIngredients["\(strIngredient11)"] = strMeasure11
                self.mealIngredients["\(strIngredient12)"] = strMeasure12
                self.mealIngredients["\(strIngredient13)"] = strMeasure13
                self.mealIngredients["\(strIngredient14)"] = strMeasure14
                self.mealIngredients["\(strIngredient15)"] = strMeasure15
                self.mealIngredients["\(strIngredient16)"] = strMeasure16
                self.mealIngredients["\(strIngredient17)"] = strMeasure17
                self.mealIngredients["\(strIngredient18)"] = strMeasure18
                self.mealIngredients["\(strIngredient19)"] = strMeasure19
                self.mealIngredients["\(strIngredient20)"] = strMeasure20
                
                
                DispatchQueue.main.async {
                    self.mealByName.append(MealByNameInfo(id:idMeal , idMeal: idMeal, strMeal: strMeal, strDrinkAlternate: strDrinkAlternate, strCategory: strCategory, strArea: strArea, strInstructions: strInstructions, strMealThumb: strMealThumb, strTags: strTags, strYoutube: strYoutube, strIngredient1: strIngredient1, strIngredient2: strIngredient2, strIngredient3: strIngredient3, strIngredient4: strIngredient4, strIngredient5: strIngredient5, strIngredient6: strIngredient6, strIngredient7: strIngredient7, strIngredient8: strIngredient8, strIngredient9: strIngredient9, strIngredient10: strIngredient10, strIngredient11: strIngredient11, strIngredient12: strIngredient12, strIngredient13: strIngredient13, strIngredient14: strIngredient14, strIngredient15: strIngredient15, strIngredient16: strIngredient16, strIngredient17: strIngredient17, strIngredient18: strIngredient18, strIngredient19: strIngredient19, strIngredient20: strIngredient20, strMeasure1: strMeasure1, strMeasure2: strMeasure2, strMeasure3: strMeasure3, strMeasure4: strMeasure4, strMeasure5: strMeasure5, strMeasure6: strMeasure6, strMeasure7: strMeasure7, strMeasure8: strMeasure8, strMeasure9: strMeasure9, strMeasure10: strMeasure10, strMeasure11: strMeasure11, strMeasure12: strMeasure12, strMeasure13: strMeasure13, strMeasure14: strMeasure14, strMeasure15: strMeasure15, strMeasure16: strMeasure16, strMeasure17: strMeasure17, strMeasure18: strMeasure18, strMeasure19: strMeasure19, strMeasure20: strMeasure20, strSource: strSource, strImageSource: strImageSource, strCreativeCommonsConfirmed: strCreativeCommonsConfirmed, dateModified: dateModified))
                }
            }
            
        }.resume()
        
        
        
    }
    
    
    
    
    var body: some View {
        
        VStack {
            ScrollView {
                
                
                ForEach(mealByName,id:\.self){item in
                    
                    ZStack {
                        URLImage(url: item.strMealThumb!)
                            .frame(width:350,height: 280)
                            .cornerRadius(12)
                            .overlay(RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.orange, lineWidth: 3))
                            .shadow(radius: 5)
                            .overlay(TintOverlay(mealName: item.strMeal).opacity(0.5))
                        
                        
                    }
                    VStack {
                        Capsule()
                            .fill(Color(red:0.851 , green: 0.918, blue: 0.827))
                            .frame(width:350,height:35)
                            .overlay(
                                Text("AREA: \(item.strArea!.uppercased())").foregroundColor(Color(red:0.220, green: 0.463, blue: 0.114)).padding(10).font(Font.body.weight(.heavy))
                            )
                        Capsule()
                            .fill(Color(red: 1, green: 0.9490196108818054, blue: 0.800000011920929))
                            .frame(width:350,height:35)
                            .overlay(
                                Text("CATEGORY: \(item.strCategory!.uppercased())").foregroundColor(Color(red: 0.75, green: 0.56, blue: 0)).padding(10)).font(Font.body.weight(.heavy))
                    }
                    
                    if (item.strTags ?? "").isEmpty  {
                        Capsule()
                            .fill(Color(red: 0.8509804010391235, green: 0.8235294222831726, blue: 0.9098039269447327))
                            .frame(width: 350, height: 35, alignment: .center)
                            .overlay(Text("TAGS: NONE").foregroundColor(Color(red: 0.21, green: 0.11, blue: 0.46)).padding(10)).font(Font.body.weight(.heavy))
                    }else {
                        Capsule().fill(Color(red: 0.8509804010391235, green: 0.8235294222831726, blue: 0.9098039269447327))
                            .frame(width: 350, height: 35, alignment: .center)
                            .overlay(Text("TAGS: "+(item.strTags!.uppercased())).foregroundColor(Color(red: 0.21, green: 0.11, blue: 0.46)).padding(10)).font(Font.body.weight(.heavy))
                        
                    }
                    
                    
                    
                    if !presentingFinished {
                        Button {
                            presentingToast = true
                            addMealToFavs()
                        } label: {
                            (Text(Image(systemName: "heart")) + Text("Add To Favorites")).font(.system(size: 20.0, weight: .bold)).frame(width: 325, height: 25, alignment: .center)
                                
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.accentColor)
                                .cornerRadius(8.0)
                        }
                        .toast(isPresented: $presentingToast) {
                            ToastView {
                                VStack {
                                    Text("\(item.strMeal) was added to your favorites list!")
                                        .padding(.bottom)
                                        .multilineTextAlignment(.center)
                                    
                                    
                                    Button {
                                        presentingToast = false
                                        presentingFinished = true
                                    } label: {
                                        Text("OK")
                                            .bold()
                                            .foregroundColor(.white)
                                            .padding(.horizontal)
                                            .padding(.vertical, 12.0)
                                            .background(Color.accentColor)
                                            .cornerRadius(8.0)
                                        
                                    }
                                }
                            }
                        }
                    }
                    
                    
                    
                    Text("Cooking Instructions").bold().frame(width: 350, height: 50, alignment: .topLeading).padding(10).font(.system(size: 24)).font(.title)
                    
                    Text(item.strInstructions!).padding(.leading,20).padding(.trailing,20).font(.system(size: 18)).font(.body).fixedSize(horizontal: false, vertical: true)
                    
                    VideoView(videoUrl: item.strYoutube!).frame(width: 350, height: 350, alignment: .center).cornerRadius(12).padding(5)
                    
                    Text("Ingredients").bold().frame(width: 350, height: 50, alignment: .topLeading).padding(10).font(.system(size: 24)).font(.title)
                    
                }
                
                ForEach(Array(mealIngredients),id:\.key){key,value in
                    
                    Capsule()
                        .fill(Color.orange)
                        .frame(width:300,height:35)
                        .overlay(Text("\(key) - \(value)").bold().foregroundColor(Color.white).padding(10).font(.body))
                }
                
            }
            
        }
        
        .onAppear {
            fetchMealByNameInfo(){(mealInfo) in
                self.mealByName = mealInfo
            }
            
            
            
            
        }
        
    }
    
    
    
    
}

struct MealDetails_Previews: PreviewProvider {
    static var previews: some View {
        MealDetails(mealId: "")
    }
}



