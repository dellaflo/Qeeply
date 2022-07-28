//
//  QeeplyApp.swift
//  Qeeply
//
//  Created by Della Florine on 24/07/22.
//

import SwiftUI

@main
struct QeeplyApp: App {
    @StateObject var categories = CategoryList(categories: [
        CategoryModel(id: 1, titleLink: "HIG Implementation", imageLink: "design1", category: "Design"),
        CategoryModel(id: 2, titleLink: "Usability Testing", imageLink: "design2", category: "Design"),
        CategoryModel(id: 3, titleLink: "Accessibility Testing", imageLink: "design3", category: "Design"),
        CategoryModel(id: 4, titleLink: "Style Guidelines", imageLink: "design4", category: "Design"),
        CategoryModel(id: 5, titleLink: "Typography", imageLink: "design5", category: "Design"),
        CategoryModel(id: 6, titleLink: "Tech", imageLink: "design5", category: "Technical"),
        CategoryModel(id: 7, titleLink: "Business", imageLink: "design5", category: "Business")
    ])
    
    var body: some Scene {
        WindowGroup {
            SplashScreen()
                .environmentObject(categories)
        }
    }
}
