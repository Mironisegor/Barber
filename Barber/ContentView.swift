//
//  ContentView.swift
//  Barber
//
//  Created by Egor Mironov  on 04.06.2024.
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
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Text("barber")
                    .font(.custom("MrDafoe-Regular", size: 70))
                    .foregroundColor(.white)
                    .padding(.top, 60)
                Spacer()
                VStack {
                    ZStack {
                        Image("haircut")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Rectangle()
                            .frame(height: 30)
                            .foregroundColor(.black)
                            .padding(.bottom, 383)
                            .blur(radius: 10)
                    }
                }
                .frame(height: 390)
            }
            VStack (spacing: 20) {
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
                }
            }
            .padding(.top, 150)
            .frame(width: 310)
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
