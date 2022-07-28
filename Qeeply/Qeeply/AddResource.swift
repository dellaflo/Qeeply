//
//  AddResource.swift
//  Qeeply
//
//  Created by Della Florine on 24/07/22.
//

import SwiftUI


struct AddResource: View {
    @ObservedObject var category: CategoryModel
    
    var titleModal: String
    
    var body: some View {
        NavigationView{
            AddResourcePage(category: category, titleResource: titleModal)
        }
    }
}

struct AddResourcePage: View {
    @EnvironmentObject var categories: CategoryList
    @ObservedObject var category: CategoryModel
    
    @Environment(\.dismiss) var dismiss
    @State var title: String = ""
    @State var link: String = ""
    @State var notes: String = ""
    @State var readLater = false
    @State var starred = false
    
    var titleResource: String
    
    var body: some View{
        ZStack{
            Color("Background").ignoresSafeArea()
            VStack{
                HStack{
                    Button {
                       dismiss()
                    } label: {
                        Text("Cancel")
                            .font(.body)
                            .padding()
                    }
                    Spacer()
                    Text(titleResource)
                        .fontWeight(.semibold)
                    Spacer()
                    Button {
                        if titleResource == "Add Resource"
                        {
                            var id = UserDefaults.standard.integer(forKey: "lastId")
                            if id == 0
                            {
                                id = 7
                            }
                            id += 1
                            UserDefaults.standard.set(id, forKey: "lastId")
                            
                            let category = CategoryModel(id: id, titleLink: title, imageLink: link, category: "Unsorted")
                            categories.categories.append(category)
                        }
                        else
                        {
                            category.titleLink = title
                        }
                       dismiss()
                        
                    } label: {
                        Text("Done")
                            .font(.body)
                            .padding()
                    }
                }
                .padding([.top],5)
               
                
                HStack{
                    Spacer()
                    Text("20 July 2022")
                        .padding([.trailing])
                        .padding(.top,5)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                VStack(alignment: .leading){
                    Text("Title")
                        .padding([.trailing,.leading])
                        .font(.headline.bold())
                    TextField("Title here...", text: $title)
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                        .padding([.trailing,.leading])
                        .padding([.bottom],15)

                }
                
                VStack(alignment: .leading){
                    Text("Link")
                        .padding([.trailing,.leading])
                        .font(.headline.bold())
                    TextField("Link here...", text: $link)
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                        .padding([.trailing,.leading])
                        .padding([.bottom],15)
                }
                
                VStack(alignment: .leading){
                    Text("Notes")
                        .padding([.trailing,.leading])
                        .font(.headline.bold())
                    TextField("Write notes here...", text: $notes)
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                        .padding([.trailing,.leading])
                        .padding([.bottom],20)
                }
                
                Form{
                    NavigationLink(destination:categoryPick()){
                        HStack{
                            Image(systemName: "list.bullet")
                                .font(.system(size: 17).bold())
                                .foregroundColor(Color("AccentColor"))
                            Text("Category")
                        }
                    }
                    .navigationTitle("Collections")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)
                    
                    HStack{
                        Image(systemName: "bookmark")
                            .font(.system(size: 17).bold())
                            .foregroundColor(Color("AccentColor"))
                        Toggle ("Read Later", isOn: $readLater)
                            .tint(Color("AccentColor"))
                    }
                    
                    HStack{
                    Image(systemName: "star")
                        .font(.system(size: 17).bold())
                        .foregroundColor(Color("AccentColor"))
                    Toggle ("Starred", isOn: $starred)
                        .tint(Color("AccentColor"))
                    }
                }
                .onAppear() {
                    UITableView.appearance().backgroundColor = UIColor.clear
                    UITableViewCell.appearance().backgroundColor = UIColor.clear
                    UITableView.appearance().contentInset.top = -35
                }
                
                Spacer()
                
                
                
                if titleResource != "Add Resource"{
                    Button {
                        for i in 0..<categories.categories.count
                        {
                            if categories.categories[i].id == category.id
                            {
                                categories.categories.remove(at: i)
                                return
                            }
                        }
                        dismiss()
                    } label: {
                        Text("Delete Resources")
                            .fontWeight(.semibold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(Color("AccentColor"))
                            .clipShape(Capsule())
                    }
                    .padding([.leading,.trailing],25)
                }
            }
        }
        .onAppear
        {
            title = category.titleLink
        }
    }
}

struct categoryPick: View{
    
    let categories = categoryList
    
    var body: some View{
        ZStack{
            Color("Background").ignoresSafeArea()
            VStack{
                List {
                    ForEach(categories, id: \.self){
                        Text($0)
                    }
                }
            }
            .padding(.top)
        }
    }
}

struct AddResource_Previews: PreviewProvider {
    static var previews: some View {
        AddResource(category: CategoryModel(id: 1, titleLink: "HIG Implementation", imageLink: "design1", category: "Design"), titleModal: "Add Resource")
    }
}
