//
//  Alert.swift
//  Qeeply
//
//  Created by Della Florine on 26/07/22.
//

import SwiftUI

struct Alert: View {
    @Binding var isShown: Bool
    @Binding var text: String
    
    @State var addCategory: String = ""
    
    var onDone: (String) -> Void = { _ in }
    var onCancel: () -> Void = { }
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.3).ignoresSafeArea()
            VStack{
            HStack{
                Spacer()
                Button {
                    isShown = false
                    self.onCancel()
                    
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 20, weight: .bold))
                }
                .padding()
            }
                
            Text("Category Name")
                .fontWeight(.semibold)
                
            TextField("Category name here...", text: $addCategory)
                .padding()
                .background(Color("Background"))
                .cornerRadius(10)
                .padding([.trailing,.leading])
                .padding([.bottom],15)
                .multilineTextAlignment(.center)
                
            Button {
                isShown = false
                self.onDone(self.text)
                
            } label: {
                Text("Save")
                    .frame(width: 160)
                    .foregroundColor(.white)
                    .font(.system(size: 17, weight: .bold))
                    .padding()
                    .background(Color("AccentColor"))
                    .clipShape(Capsule())
                }
            .padding([.bottom],30)
            }
            .frame(width: 320)
            .background(Color.white)
            .cornerRadius(12)
        }
        .offset(y: isShown ? 0: UIScreen.main.bounds.height)
    }
}

struct Alert_Previews: PreviewProvider {
    static var previews: some View {
        Alert(isShown: .constant(true), text: .constant(""))
    }
}
