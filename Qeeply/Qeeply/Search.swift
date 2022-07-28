//
//  Search.swift
//  Qeeply
//
//  Created by Della Florine on 24/07/22.
//

import SwiftUI

struct Search: View {
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView{
            Text("Searching for \(searchText)")
                .searchable(text: $searchText)
        }
        
    }

}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
