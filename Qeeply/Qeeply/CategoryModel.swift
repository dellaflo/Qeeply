//
//  CategoryModel.swift
//  Qeeply
//
//  Created by Della Florine on 28/07/22.
//

import Foundation

//Model Data
class CategoryModel : Identifiable, ObservableObject {
    let id: Int
    @Published var titleLink: String
    @Published var imageLink: String
    @Published var category: String
    
    static let blankCategory = CategoryModel(id: -1, titleLink: "", imageLink: "", category: "")
    
    init(id: Int, titleLink: String, imageLink: String, category: String){
        self.id = id
        self.titleLink = titleLink
        self.imageLink = imageLink
        self.category = category
    }
}

class CategoryList: ObservableObject
{
    @Published var categories: [CategoryModel]
    
    init(categories: [CategoryModel])
    {
        self.categories = categories
    }
}
