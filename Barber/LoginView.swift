//
//  LoginView.swift
//  Barber
//
//  Created by Mironov Egor on 04.06.2024.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack {
            VStack (spacing: 15) {
                VStack (spacing: 2) {
                    ZStack(alignment: .leading) {
                        if email.isEmpty {
                            Text("Email")
                                .foregroundColor(.myGrey)
                                .font(.system(size: 17))
                        }
                        TextField("", text: $email)
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                    }
                    Rectangle()
                        .frame(width: 320, height: 1)
                        .foregroundColor(.myGrey)
                }
                .frame(width: 320, height: 30)
                
                VStack (spacing: 2) {
                    ZStack(alignment: .leading) {
                        if password.isEmpty {
                            Text("Password")
                                .foregroundColor(.myGrey)
                                .font(.system(size: 17))
                        }
                        SecureField("", text: $password)
                            .font(.system(size: 17))
                            .foregroundColor(.white)
                    }
                    Rectangle()
                        .frame(width: 320, height: 1)
                        .foregroundColor(.myGrey)
                }
                .frame(width: 320, height: 30)
            }
            VStack {
                Button {
                    
                } label: {
                    Text("Войти")
                        .font(.system(size: 18, weight: .bold))
                        .frame(width: 300, height: 50)
                        .background(Color.gold)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                Button {
                    
                } label: {
                    Text("Забыли пароль?")
                        .font(.system(size: 18, weight: .bold))
                        .frame(width: 300, height: 50)
                        .foregroundColor(.gold)
                        .cornerRadius(10)
                        .padding(.top, -10)
                }
            }
            .padding(.top, 20)
            Spacer()
        }
        .frame(height: 400)
    }
}

#Preview {
    LoginView()
}
