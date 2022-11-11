//
//  ContentView.swift
//  GetFirebaseData
//
//  Created by mark me on 11/10/22.
//

import SwiftUI
import Firebase
import FirebaseStorage

struct ContentView: View {
    
    @StateObject var vm = ViewModel()
    @State var isPresented: Bool = false
    
    init() {
        let navigation = UINavigationBar.appearance()
        navigation.largeTitleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont(name: "PlayfairDisplay-Bold", size: 40) as Any]
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(vm.data) { item in
                    VStack(alignment: .leading) {
                        Card(card: item)
                    }
                }
                .onAppear {
                    vm.getData()
                }
            }
            .navigationTitle(Text("People's username"))
            .navigationBarItems(trailing: Button(action: {
                
                isPresented.toggle()
                
            }, label: {
                Image(systemName: "plus")
                    .imageScale(.medium)
                    .font(.headline)
                    .frame(width: 30, height: 30)
                    .background(Color(UIColor.magenta))
                    .foregroundColor(Color.white)
                    .clipShape(Circle())
                    .shadow(radius: 5)
            }))
            .fullScreenCover(isPresented: $isPresented) {
                DetailView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
