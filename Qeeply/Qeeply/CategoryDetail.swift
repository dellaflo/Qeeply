//
//  CategoryDetail.swift
//  Qeeply
//
//  Created by Della Florine on 26/07/22.
//

import SwiftUI

struct CategoryDetail: View {
    
    let categoryTitle: String
    
    @EnvironmentObject var categories: CategoryList
    @State var isPresentingModal = false
    
    @State private var isPresented: Bool = false
    @State private var text: String = ""
    
    var body: some View {
        ZStack{
            Color("Background").ignoresSafeArea()
            VStack{
                HStack{
                Text("\(categoryTitle)")
                    .font(.largeTitle.bold())
                    .padding()
                Spacer()
                Button {
                    isPresented = true
                } label: {
                    Image(systemName: "ellipsis.circle")
                        .font(.title3)
                }
                .padding()
                }
                
                ForEach(categories.categories.filter{$0.category == categoryTitle}) { row in
                    VStack{
                        linkDetail(data: row)
                    }
                   
                }
                Spacer()
                Button {
                    isPresentingModal = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 55).bold())
                }
                .sheet(isPresented: $isPresentingModal) {
                    AddResource(category: CategoryModel.blankCategory, titleModal: "Add Resource")
                }
            }
            Alert(isShown: $isPresented, text: $text)
        }
    }
}

struct linkDetail: View{
    
    @ObservedObject var data: CategoryModel
    @State var isPresentingModal = false
    
    var body: some View{
        HStack{
            Button {
                isPresentingModal = true
            } label: {
                HStack{
                    Image(self.data.imageLink)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(6)
                    Text(self.data.titleLink)
                        .padding([.leading],5)
                        .foregroundColor(.black)
                    Spacer()
                }
            }
            .frame(height: 55)
            .frame(maxWidth:.infinity)
            
            Spacer()
            
            Button {
                print("yo")
            } label: {
                ZStack{
                    Color("Red2")
                        .clipShape(Circle())
                    Image(systemName: "link")
                }
            }
            .frame(width: 37, height: 37)
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(10)
        .padding([.leading,.trailing])
        
        .sheet(isPresented: $isPresentingModal) {
            AddResource(category: data, titleModal: "Edit Resource")
        }
    }
}

struct CategoryDetail_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetail(categoryTitle: "Design")
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
