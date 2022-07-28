//
//  ContentView.swift
//  Qeeply
//
//  Created by Della Florine on 24/07/22.
//

import SwiftUI

let categories = categoryList

struct ContentView: View {
    
    var body: some View {
        NavigationView{
            HomeView()
        }
    }
}

struct HomeView: View {
    @State var isPresentingModal = false
    
    @State private var isPresented: Bool = false
    @State private var text: String = ""
    
    @State private var categoryNames = categoryList
    
    var body: some View{
        ZStack{
            Color("Background").ignoresSafeArea()
            VStack{
                HStack{
                    NavigationLink {
                        Level()
                    } label: {
                        Image(systemName: "star")
                        Text("Level 1")
                    }
                    .padding()
                    .foregroundColor(.white)
                    .font(.body.bold())
                    .navigationBarTitleDisplayMode(.inline)
                    
                    Spacer()
                    
                    NavigationLink {
                        Search()
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                    .padding()
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold))
                    
                }
                    .background(Color("AccentColor"))
                    .padding(.bottom)
                
                VStack{
                    ZStack(alignment: .topLeading){
                        NavigationLink {
                            CategoryDetail(categoryTitle: "Read Later")
                        } label: {
                            ZStack{
                            Image("longCard1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(10)
                            HStack{
                                Text("Read Later")
                                    .font(.headline.bold())
                                    .foregroundColor(Color("AccentColor"))
                                    .padding([.leading],10)
                                
                                Spacer()
                                Text("0")
                                    .font(.title      .bold())
                                    .foregroundColor(Color("PrimaryBlack"))
                                }
                            .padding()
                            }
                        }
                    }
                    
                    ZStack(alignment: .topLeading){
                        
                        NavigationLink {
                            CategoryDetail(categoryTitle: "Start")
                        } label: {
                            ZStack{
                            Image("longCard2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(12)
                            HStack{
                                Text("Starred")
                                    .font(.headline.bold())
                                    .foregroundColor(Color("Yellow1"))
                                    .padding([.leading],10)
                                Spacer()
                                Text("0")
                                    .font(.title.bold())
                                    .foregroundColor(Color("PrimaryBlack"))
                                }
                            .padding()
                            }
                        }
                    }
                    
                    ZStack(alignment: .topLeading){
                        NavigationLink {
                            CategoryDetail(categoryTitle: "All")
                        } label: {
                            ZStack{
                            Image("longCard3")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(12)
                            
                            HStack{
                                Text("All")
                                    .font(.headline.bold())
                                    .foregroundColor(Color("Green1"))
                                    .padding([.leading],10)
                                Spacer()
                                Text("0")
                                    .font(.title.bold())
                                    .foregroundColor(Color("PrimaryBlack"))
                                }
                            .padding()
                            }
                        }
                    }
                   
                }
                .padding([.leading,.trailing])
                
                
                HStack{
                    Text("All Categories")
                        .padding()
                        .font(.title3.bold())
                        
                    Spacer()
                    Button {
                        self.isPresented = true
                        
                    } label: {
                        Text("+ New Category")
                    }
                    .padding()
                }
                
                Spacer()
                List {
                    ForEach(categoryNames, id: \.self){
                        categories in NavigationLink(destination: CategoryDetail(categoryTitle: categories)){
                            Text(categories)
                        }
                    }
                }
                .navigationTitle("Collections")
                .navigationBarHidden(true)
                .onAppear() {
                    UITableView.appearance().backgroundColor = UIColor.clear
                    UITableViewCell.appearance().backgroundColor = UIColor.clear
                    UITableView.appearance().contentInset.top = -35
                }
                
                VStack{
                Button {
                    isPresentingModal = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 55).bold())
                }
            }
            }
            .sheet(isPresented: $isPresentingModal) {
                AddResource(category: CategoryModel.blankCategory, titleModal: "Add Resource")
            }
            Alert(isShown: $isPresented, text: $text,onDone: {text in
                self.categoryNames.append(text)
            })
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(
                CategoryList(categories: [
                CategoryModel(id: 1, titleLink: "HIG Implementation", imageLink: "design1", category: "Design"),
                CategoryModel(id: 2, titleLink: "Usability Testing", imageLink: "design2", category: "Design"),
                CategoryModel(id: 3, titleLink: "Accessibility Testing", imageLink: "design3", category: "Design"),
                CategoryModel(id: 4, titleLink: "Style Guidelines", imageLink: "design4", category: "Design"),
                CategoryModel(id: 5, titleLink: "Typography", imageLink: "design5", category: "Design"),
                CategoryModel(id: 6, titleLink: "Tech", imageLink: "design5", category: "Technical"),
                CategoryModel(id: 7, titleLink: "Business", imageLink: "design5", category: "Business")
            ]))
    }
}
