//
//  ContentView.swift
//  Barber
//
//  Created by Gleb  on 04.06.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTabIndex = 0
    
    let names = [
        "ВОЙТИ",
        "РЕГИСТРАЦИЯ"
    ]
    
    var body: some View {
        ZStack {
            Color.accentColor
                            .edgesIgnoringSafeArea(.all)
            Text("barber")
                .font(.custom("MrDafoe-Regular", size: 80))
                .foregroundColor(.white)
                .padding(.top, -350)
            ZStack {
                Image("haircut")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Rectangle()
                    .frame(height: 30)
                    .foregroundColor(.green)
                    .blur(radius: 1)
                    .blur(radius: 15)
            }
            .padding(.bottom, -400)
            /*
            HStack(spacing: 60) {
                ForEach(0..<2, id: \.self, content: { number in
                    Button(action: {
                        self.selectedTabIndex = number
                    }, label: {
                        VStack(spacing: 8) {
                            Text(names[number])
                                .font(.system(size: 13, weight: .bold))
                                .foregroundColor(selectedTabIndex == number ? .gold : .myGrey)
                            Rectangle()
                                .frame(width: 130, height: 1)
                                .foregroundColor(.gold)
                        }
                    })
                })
            }
            ZStack {
                switch selectedTabIndex {
                case 0:
                    LoginView()
                default:
                    RegistrationView()
                }
            }*/
        }
    }
}

#Preview {
    ContentView()
}
