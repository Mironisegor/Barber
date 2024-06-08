//
//  FirebaseManager.swift
//  Barber
//
//  Created by Gleb  on 08.06.2024.
//

import Foundation
import Firebase


class FirebaseManager {
    func registNewUser(user: userData) {
        Auth.auth().createUser(withEmail: user.email, password: user.password) {result, err in
            guard err == nil else {
                print(err!.localizedDescription)
                return
            }
            result?.user.sendEmailVerification()
            if let uid = result?.user.uid {
                Firestore.firestore()
                    .collection("users")
                    .document(uid)
                    .setData([
                        "name": user.name,
                        "surname": user.surname,
                        "email": user.email,
                        "phoneNumber": user.phoneNumber,
                        "password": user.password,
                        "date": Date()
                    ], merge: true) { err in
                        print("Saved")
                    }
            }
            print(result!.user.uid)
            print(result?.user.phoneNumber)
        }
    }
}

struct userData {
    var name: String
    var surname: String
    var email: String
    var phoneNumber: String
    var password: String
}
