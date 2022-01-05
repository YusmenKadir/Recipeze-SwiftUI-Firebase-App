//
//  ExploreView.swift
//  RecipeZe
//
//  Created by Yusmen Kadir on 26.09.21.
//

import SwiftUI
import SwiftyJSON


struct ExploreView: View {
    @State var categories = [Categories]()
    
    let layout =  [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    func fetchData(completion: @escaping ([Categories]) -> ()) {
        
        let source  = "https://www.themealdb.com/api/json/v1/1/categories.php"
        let url  = URL(string: source)!
        let session = URLSession(configuration: .default)
        session.dataTask(with: url){(data, _, err) in
            
            
            
            let json = try! JSON(data: data!)
            for i in json["categories"]{
                let idCategory = i.1["idCategory"].stringValue
                let strCategory = i.1["strCategory"].stringValue
                let strCategoryThumb = i.1["strCategoryThumb"].stringValue
                let strCategoryDescription = i.1["strCategory"].stringValue
                
                DispatchQueue.main.async {
                    self.categories.append(Categories(id: "\(idCategory),\(strCategory)",idCategory: idCategory, strCategory: strCategory, strCategoryThumb: strCategoryThumb, strCategoryDescription: strCategoryDescription))
                }
            }
            
        }.resume()
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                Text("World Cuisines").bold().padding().font(.system(size: 30))
                Spacer()
                ScrollView {
                    LazyVGrid(columns: layout, spacing:20) {
                        ForEach(categories, id: \.self) { item in
                            NavigationLink(destination: CategoryMeals(mealCategory:item.strCategory)) {
                                
                                
                                VStack {
                                    URLImage(url: item.strCategoryThumb)
                                        .frame(width:167,height: 127)
                                    Text("\(item.strCategory)")
                                        .foregroundColor(.black).bold()
                                }
                            }
                            
                            
                            
                        }
                    }
                    
                    .padding(.horizontal)
                }
            }
            
            
            
            
            .navigationTitle("Explore")
        }
        .onAppear{
            self.categories = [Categories]()
            fetchData(){(categories) in
                self.categories = categories
            }
            
        }
    }
    
}

