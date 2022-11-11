//
//  DetailView.swift
//  GetFirebaseData
//
//  Created by mark me on 11/10/22.
//

import SwiftUI
import Combine

struct DetailView: View {
    
    @StateObject var addData = ViewModel()
    @State var name: String = ""
    @State var username: String = ""
    
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Text("User Details")
                        .font(.largeTitle.bold())
                        .offset(x: 22)
                    Image("icon")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .padding(.leading, 25)
                        .offset(y: -10)
                }
                TextField("Enter name here", text: $name)
                    .padding()
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.purple.opacity(0.3))
                    .cornerRadius(30)
                    .padding([.leading, .trailing], 15)
                
                
                    .onReceive(Just(name)) { value in
                        name = String(value.prefix(15))
                    }
                
                TextField("Enter username here", text: $username)
                    .padding()
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.mint.opacity(0.3))
                    .cornerRadius(30)
                    .padding(.top, 5)
                    .padding([.leading, .trailing], 15)
                
                    .onReceive(Just(username)) { value in
                        username = String(value.prefix(30))
                    }
                
                Button {
                    
                    self.addData.addData(name: name, user_name: username)
                    
                    presentationMode.wrappedValue.dismiss()
                    
                } label: {
                    Text("Save Data")
                    
                        .font(.title.bold())
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.mint.opacity(0.7))
                        .foregroundColor(Color.white)
                        .cornerRadius(30)
                        .padding(.top)
                        .padding([.leading, .trailing], 15)
                    
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            withAnimation {
                                presentationMode.wrappedValue.dismiss()
                            }
                        } label: {
                            Image(systemName: "xmark")
                                .imageScale(.medium)
                                .font(.headline)
                                .frame(width: 30, height: 30)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .shadow(radius: 5)
                        }
                        
                    }
                }
                
            }
            
            .frame(maxWidth: .infinity)
            .frame(height: 350)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 5)
            .padding([.leading, .trailing], 15)
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
