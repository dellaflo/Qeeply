//
//  Level.swift
//  Qeeply
//
//  Created by Della Florine on 24/07/22.
//

import SwiftUI

struct Level: View {
    var body: some View {
        ZStack{
            Color("Background").ignoresSafeArea()
            VStack{
                VStack{
                    Text("Level 1")
                        .font(.title2.bold())
                        .padding(.bottom,1)
                    Text("My Collections: 5")
                }
                
                VStack{
                    HStack{
                        Text("Lvl. 0")
                        Spacer()
                        Text("Lvl. 1")
                    }
                    .padding([.trailing,.leading])
                    .padding([.top],8)
                    ProgressView(value: 0.5)
                        .frame(height: 12)
                        .scaleEffect(x: 1, y: 12, anchor: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        .padding(.horizontal)
                }
                HStack{
                    Text("Achievements")
                        .font(.title2.bold())
                        .padding([.trailing,.leading,.top])
                    Spacer()
                }
                
                levelCard(levelNumber: "1", levelDescription: "Collect 5 resources")
                levelCard(levelNumber: "2", levelDescription: "Collect 25 resources")
                levelCard(levelNumber: "3", levelDescription: "Collect 40 resources with notes")
                levelCard(levelNumber: "4", levelDescription: "Collect 75 resources with notes (min. 75 words)")
                levelCard(levelNumber: "5", levelDescription: "Collect 100 resources with notes (min. 100 words)")
                
                Spacer()
            }
        }
    }
}

struct levelCard: View{
    
    var levelNumber: String
    var levelDescription: String
    
    var body: some View{
        HStack{
            ZStack{
                Image("Star")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 75, height: 75)
                Text(levelNumber)
                    .foregroundColor(Color.white)
                    .fontWeight(.heavy)
            }
            .padding([.leading],8)
            
            VStack(alignment: .leading){
                Text("Level \(levelNumber)")
                    .fontWeight(.bold)
                    .foregroundColor(Color("AccentColor"))
                    
                Text(levelDescription)
            }
            Spacer()
        }
        .frame(height: 85)
        .background(Color.white)
        .cornerRadius(10)
        .padding([.leading,.trailing])
        .padding([.bottom],5)
    }
}

struct Level_Previews: PreviewProvider {
    static var previews: some View {
        Level()
    }
}
