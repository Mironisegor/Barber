//
//  LoginView.swift
//  Barber
//
//  Created by Mironov Egor on 04.06.2024.
//

import SwiftUI

struct RegistrationView: View {
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var name = ""
    @State var surname = ""
    @State var phoneNumber = ""
    @State var buttonForBarberCheck: Bool = true
    @State var textForBarberCheck: Bool = true
    @State var isShowingPassword: Bool = false
    let fbmanager = FirebaseManager()
    var body: some View {
        VStack (spacing: 15) {
            HStack {
                FieldForText1(check: $name, text: "Имя")
                Spacer()
                FieldForText1(check: $surname, text: "Фамилия")
            }
            .frame(width: 320, height: 30)
            FieldForText2(check: $email, text: "Email")
            FieldForText2(check: $phoneNumber, text: "Номер телефона")
            FieldForPassword(password: $password, text: "Пароль", isShowingPassword: $isShowingPassword)
            FieldForPassword(password: $confirmPassword, text: "Подтвердите пароль", isShowingPassword: $isShowingPassword)
            HStack  {
                Text("Вы барбер?")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                HStack {
                    ToggleButton(check1: $buttonForBarberCheck, check2: $textForBarberCheck, text: "ДА")
                    ToggleButton(check1: $buttonForBarberCheck, check2: $textForBarberCheck, text: "НЕТ")
                    Spacer()
                }
            }
            Button {
                fbmanager.registNewUser(user: userData(name: name, surname: surname, email: email, phoneNumber: phoneNumber, password: password))
            } label: {
                Text("Зарегистрироваться")
                    .font(.system(size: 18, weight: .bold))
                    .frame(width: 310, height: 50)
                    .background(Color.gold)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .frame(width: 320, height: 400)
    }
}

#Preview {
    RegistrationView()
}

struct FieldForText1: View {
    @Binding var check: String
    @State var text: String
    var body: some View {
        VStack (spacing: 2) {
            ZStack(alignment: .leading) {
                if check.isEmpty {
                    Text(text)
                        .foregroundColor(.myGrey)
                        .font(.system(size: 17))
                }
                TextField("", text: $check)
                    .font(.system(size: 15))
                    .foregroundColor(.white)
            }
            Rectangle()
                .frame(width: 145, height: 1)
                .foregroundColor(.myGrey)
        }
        .frame(width: 145, height: 30)
    }
}

struct FieldForPassword: View {
    @Binding var password: String
    @State var text: String
    @Binding var isShowingPassword: Bool
    var body: some View {
        VStack (spacing: 2) {
            ZStack(alignment: .leading) {
                if password.isEmpty {
                    Text(text)
                        .foregroundColor(.myGrey)
                        .font(.system(size: 17))
                }
                if !isShowingPassword {
                    HStack {
                        SecureField("", text: $password)
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                        Button {
                            isShowingPassword.toggle()
                        } label: {
                            Image(systemName: "eye")
                                .foregroundColor(.myGrey)
                        }
                    }
                }
                else {
                    HStack {
                        TextField("", text: $password)
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                        Button {
                            isShowingPassword.toggle()
                        } label: {
                            Image(systemName: "eye.slash.fill")
                                .foregroundColor(.myGrey)
                        }
                    }
                }
            }
            Rectangle()
                .frame(width: 320, height: 1)
                .foregroundColor(.myGrey)
        }
        .frame(width: 320, height: 30)
    }
}

struct FieldForText2: View {
    @Binding var check: String
    @State var text: String
    var body: some View {
        VStack (spacing: 2) {
            ZStack(alignment: .leading) {
                if check.isEmpty {
                    Text(text)
                        .foregroundColor(.myGrey)
                        .font(.system(size: 17))
                }
                TextField("", text: $check)
                    .font(.system(size: 15))
                    .foregroundColor(.white)
            }
            Rectangle()
                .frame(width: 320, height: 1)
                .foregroundColor(.myGrey)
        }
        .frame(width: 320, height: 30)
    }
}

struct ToggleButton: View {
    @Binding var check1: Bool
    @Binding var check2: Bool
    @State var text: String
    var body: some View {
        if text == "ДА" {
            Button {
                check1.toggle()
                check2.toggle()
            } label: {
                ZStack {
                    Rectangle()
                        .frame(width: 40, height: 20)
                        .cornerRadius(30)
                        .foregroundColor(check1 ? .gold : .clear)
                    Text(text)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(check2 ?  .black : .white)
                }
            }
        }
        else {
            Button {
                check1.toggle()
                check2.toggle()
            } label: {
                ZStack {
                    Rectangle()
                        .frame(width: 40, height: 20)
                        .cornerRadius(30)
                        .foregroundColor(!check1 ? .gold : .clear)
                    Text(text)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(!check2 ?  .black : .white)
                }
            }
        }
    }
}
