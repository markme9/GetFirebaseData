//
//  FirebaseManager.swift
//  GetFirebaseData
//
//  Created by mark me on 11/10/22.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage


struct Person: Identifiable {
    var id = UUID()
    var name: String
    var user_name: String
    
}

class ViewModel: ObservableObject {
    @Published var data: [Person] = []
    
    let db = Firestore.firestore()
    
    func getData() {
        db.collection("post").addSnapshotListener { qureySnapshot, error in
            guard let documents = qureySnapshot?.documents else {
                print("No data returned")
                return
            }
            self.data = documents.map({ (qureySnapshot) -> Person in
                let data = qureySnapshot.data()
                let name = data["name"] as? String ?? ""
                let user_name = data["user_name"] as? String ?? ""
                return Person(name: name, user_name: user_name)
            })
        }
    }
    
    func addData(name: String, user_name: String) {
        guard (try? db.collection("post").addDocument(data: ["name": name, "user_name": user_name])) != nil else {
            return
        }
    }
}
