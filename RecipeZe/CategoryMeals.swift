//
//  CategoryMeals.swift
//  RecipeZe
//
//  Created by Yusmen Kadir on 23.09.21.
//

import SwiftUI
import SwiftyJSON

struct CategoryMeals: View {
    let category :String?
    init(mealCategory:String){
        self.category = mealCategory
        
    }
    
    @State var mealsByCategory = [MealsByCategory]()
    @State  var isShowingDetailView = false
    let layout = [
        GridItem(.flexible()),
    ]
    
    func fetchData(completion: @escaping ([MealsByCategory]) -> ()){
        let source = "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(category!)"
        let url = URL(string: source)!
        let session = URLSession(configuration: .default)
        session.dataTask(with: url){(data,_,err) in
            
            
            let json = try! JSON(data:data!)
            
            for i in json["meals"]{
                let strMeal = i.1["strMeal"].stringValue
                let strMealThumb = i.1["strMealThumb"].stringValue
                let idMeal =  i.1["idMeal"].stringValue
                
                
                DispatchQueue.main.async {
                    self.mealsByCategory.append(MealsByCategory(id: idMeal, strMeal: strMeal, strMealThumb: strMealThumb, idMeal: idMeal))
                }
            }
        }.resume()
        
    }
    
    
    var body: some View {
        
        VStack{
            Text("All \(category!) recipes").bold().padding().font(.system(size: 30))
            
            
            ScrollView{
                LazyVGrid(columns:layout,spacing:20){
                    ForEach(mealsByCategory,id: \.self){item in
                        ZStack {
                            NavigationLink(destination: MealDetails(mealId: item.idMeal)){
                                
                                URLImage(url: item.strMealThumb)
                                    .frame(width:350,height: 280)
                                    .cornerRadius(12)
                                    .overlay(RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.orange, lineWidth: 3))
                                    .shadow(radius: 5)
                                    .overlay(TintOverlay(mealName: item.strMeal).opacity(0.5))
                                
                            }
                        }
                        
                        
                        
                        
                    }
                }
            }
            
        }
        
        
        
        .onAppear{
            self.mealsByCategory = [MealsByCategory]()
            fetchData(){(mealCategories) in
                self.mealsByCategory = mealCategories
            }
        }
        
    }
}

struct CategoryMeals_Previews: PreviewProvider {
    static var previews: some View {
        CategoryMeals(mealCategory: "")
    }
}

