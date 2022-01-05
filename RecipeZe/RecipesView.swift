//
//  RecipesView.swift
//  RecipeZe
//
//  Created by Yusmen Kadir on 26.09.21.
//

import SwiftUI
import SwiftyJSON


struct RecipesView: View {
    
    @State var mealOfTheDay = [RandomMealInfo]()
    @State var quickLinksMeals = [Categories]()
    @State var searchedMeals = [RandomMealInfo]()
    @State var recommendedMeals = [RandomMealInfo]()
    @State var searchTerm: String = ""
    @State private var showSearchResults = false
    
    
    
    func fetchRecommendedMeals(completion: @escaping ([RandomMealInfo]) -> ()){
        let source = "https://www.themealdb.com/api/json/v2/9973533/latest.php"
        
        
        let url = URL(string: source)!
        let session = URLSession(configuration: .default)
        session.dataTask(with: url){(data,_,err) in
            
            let json = try! JSON(data:data!)
            
            
            
            for i in json["meals"]{
                let idMeal = i.1["idMeal"].stringValue
                let strMeal = i.1["strMeal"].stringValue
                let strCategory = i.1["strCategory"].stringValue
                let strArea = i.1["strArea"].stringValue
                let strMealThumb = i.1["strMealThumb"].stringValue
                let strTags = i.1["strTags"].stringValue
                
                
                
                DispatchQueue.main.async {
                    self.recommendedMeals.append(RandomMealInfo(id: idMeal, idMeal: idMeal, strMeal: strMeal, strCategory: strCategory, strArea: strArea, strMealThumb: strMealThumb, strTags: strTags))
                }
                
                
            }
            
        }.resume()
    }
    
    func fetchMealByName(){
        if self.searchTerm.isEmpty {
            return
        }
        
        
        
        let source = "https://www.themealdb.com/api/json/v1/1/search.php?s=\(self.searchTerm)"
        
        let url = URL(string: source)!
        let session = URLSession(configuration: .default)
        session.dataTask(with: url){(data,_,err) in
            let json = try! JSON(data:data!)
            
            if json.count > 0 {
                self.showSearchResults = true
            }
            
            print(json)
            
            for i in json["meals"]{
                let idMeal = i.1["idMeal"].stringValue
                let strMeal = i.1["strMeal"].stringValue
                let strCategory = i.1["strCategory"].stringValue
                let strArea = i.1["strArea"].stringValue
                let strMealThumb = i.1["strMealThumb"].stringValue
                let strTags = i.1["strTags"].stringValue
                
                //clear before new search
                
                self.searchedMeals = [RandomMealInfo]()
                
                DispatchQueue.main.async {
                    self.searchedMeals.append(RandomMealInfo(id: idMeal, idMeal: idMeal, strMeal: strMeal, strCategory: strCategory, strArea: strArea, strMealThumb: strMealThumb, strTags: strTags))
                }
            }
        }.resume()
        
        
    }
    
    
    func fetchQuickLinksMeals(completion: @escaping ([Categories]) -> ()) {
        let source = "https://www.themealdb.com/api/json/v1/1/categories.php"
        
        let url = URL(string: source)!
        let session = URLSession(configuration: .default)
        session.dataTask(with: url){(data,_,err) in
            
            let json = try! JSON(data:data!)
            
            
            for i in json["categories"]{
                let strCategory = i.1["strCategory"].stringValue
                let strCategoryThumb = i.1["strCategoryThumb"].stringValue
                let idCategory = i.1["idCategory"].stringValue
                let strCategoryDescription = i.1["strCategoryDescription"].stringValue
                
                DispatchQueue.main.async {
                    self.quickLinksMeals.append(Categories(id: idCategory, idCategory: idCategory, strCategory: strCategory, strCategoryThumb: strCategoryThumb, strCategoryDescription: strCategoryDescription))
                }
            }
        }.resume()
    }
    
    
    func fetchMealOfDay(completion: @escaping ([RandomMealInfo]) -> ()){
        let source = "https://www.themealdb.com/api/json/v1/1/random.php"
        
        let url = URL(string: source)!
        let session = URLSession(configuration: .default)
        session.dataTask(with: url){(data,_,err) in
            
            let json = try! JSON(data:data!)
            
            
            for i in json["meals"]{
                let idMeal = i.1["idMeal"].stringValue
                let strMeal = i.1["strMeal"].stringValue
                let strCategory = i.1["strCategory"].stringValue
                let strArea = i.1["strArea"].stringValue
                let strMealThumb = i.1["strMealThumb"].stringValue
                let strTags = i.1["strTags"].stringValue
                
                DispatchQueue.main.async {
                    self.mealOfTheDay.append(RandomMealInfo(id: idMeal, idMeal: idMeal, strMeal: strMeal, strCategory: strCategory, strArea: strArea, strMealThumb: strMealThumb, strTags: strTags))
                }
            }
        }.resume()
    }
    
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                HStack(spacing: 15) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size:23,weight: .bold)).foregroundColor(Color.orange)
                    TextField("Search for recipe...", text: $searchTerm,  onCommit: fetchMealByName).foregroundColor(Color.black)
                }
                .padding(.vertical,10)
                .padding(.horizontal)
                .background(Color.primary.opacity(0.05))
                .cornerRadius(8)
                Spacer()
                
                
                if showSearchResults {
                    VStack {
                        HStack {
                            Image(systemName: "xmark.circle.fill").foregroundColor(Color.red)
                            Button("Clear Search Results"){
                                self.showSearchResults = false
                                self.searchTerm = ""
                                self.searchedMeals = [RandomMealInfo]()
                            }
                        }.padding()
                        
                        ScrollView() {
                            VStack(spacing: 10) {
                                ForEach(searchedMeals,id:\.self){searchedMeal in
                                    
                                    NavigationLink(destination:MealDetails(mealId: searchedMeal.idMeal!)){
                                        VStack {
                                            URLImage(url: searchedMeal.strMealThumb!)
                                                .frame(width:300,height:300)
                                                .cornerRadius(12)
                                                .overlay(RoundedRectangle(cornerRadius: 12)
                                                            .stroke(Color.orange, lineWidth: 3))
                                                .shadow(radius: 5)
                                                .overlay(TintOverlay(mealName: searchedMeal.strMeal!).opacity(0.5))
                                            
                                        }.padding()
                                    }
                                    
                                }
                            }
                        }
                        
                        Spacer()
                    }
                }else {
                    ScrollView {
                        
                        Text("Recipe of the day").bold().padding().font(.system(size: 30))
                        Spacer()
                        
                        
                        ForEach(mealOfTheDay,id:\.self){item in
                            ZStack {
                                NavigationLink(destination: MealDetails(mealId:item.idMeal!)) {
                                    URLImage(url: item.strMealThumb!)
                                        .frame(width:350,height: 280)
                                        .cornerRadius(12)
                                        .overlay(RoundedRectangle(cornerRadius: 12)
                                                    .stroke(Color.orange, lineWidth: 3))
                                        .shadow(radius: 5)
                                        .overlay(TintOverlay(mealName: item.strMeal!).opacity(0.5))
                                }
                                
                            }
                            
                            VStack {
                                Capsule()
                                    .fill(Color(red:0.851 , green: 0.918, blue: 0.827))
                                    .frame(width: 300, height:30, alignment: .topLeading)
                                    .overlay(
                                        Text("Area: \(item.strArea!.uppercased())").foregroundColor(Color(red:0.220, green: 0.463, blue: 0.114)).padding(10).font(Font.body.weight(.heavy))
                                    )
                                Capsule()
                                    .fill(Color(red: 1, green: 0.9490196108818054, blue: 0.800000011920929))
                                    .frame(width: 300, height:30, alignment: .topLeading)
                                    .overlay(
                                        Text("Category: \(item.strCategory!.uppercased())").foregroundColor(Color(red: 0.75, green: 0.56, blue: 0)).padding(10)).font(Font.body.weight(.heavy))
                            }
                            
                            
                        }
                        Text("Recommended recipes").bold().padding().font(.system(size: 30))
                        ScrollView(.horizontal) {
                            HStack(spacing: 10) {
                                ForEach(recommendedMeals,id:\.self){recommendedMeal in
                                    
                                    NavigationLink(destination:MealDetails(mealId: recommendedMeal.idMeal!)){
                                        VStack {
                                            URLImage(url: recommendedMeal.strMealThumb!)
                                                .frame(width:220,height: 200)
                                                .cornerRadius(12)
                                                .overlay(RoundedRectangle(cornerRadius: 12)
                                                            .stroke(Color.orange, lineWidth: 3))
                                                .shadow(radius: 5)
                                                .overlay(TintOverlay(mealName: recommendedMeal.strMeal!).opacity(0.5))
                                            
                                        }.padding()
                                    }
                                    
                                    
                                }
                            }
                        }
                        
                        HStack {
                            Text("Quick Links").bold().padding().font(.system(size: 25))
                            Spacer()
                            NavigationLink(destination:ExploreView()) {
                                HStack{
                                    Text("View all")
                                    Image(systemName: "chevron.forward")
                                    
                                }.padding()
                            }
                        }
                        
                        ScrollView(.horizontal) {
                            
                            
                            HStack(spacing: 16) {
                                ForEach(quickLinksMeals.prefix(7),id:\.self){quickLinkItem in
                                    
                                    
                                    
                                    NavigationLink(destination:CategoryMeals(mealCategory: quickLinkItem.strCategory)){
                                        VStack {
                                            URLImage(url: quickLinkItem.strCategoryThumb)
                                                .frame(width:155,height: 155)
                                                .scaleEffect(CGSize(width: 1, height: 1))
                                            Text("\(quickLinkItem.strCategory)").padding(.leading,5)
                                        }
                                    }
                                    
                                    
                                }
                            }
                        }.padding()
                    }
                }
                
                
                
                
            }
            
            
            
            .navigationTitle("Recipes")
            
            
        }
        .onAppear {
            self.mealOfTheDay = [RandomMealInfo]()
            self.recommendedMeals = [RandomMealInfo]()
            fetchMealOfDay(){(mealInfo) in
                self.mealOfTheDay = mealInfo
            }
            fetchQuickLinksMeals(){(categoryInfo) in
                self.quickLinksMeals = categoryInfo
            }
            
            fetchRecommendedMeals(){(mealInfo) in
                self.recommendedMeals = mealInfo
            }
        }
    }
}



