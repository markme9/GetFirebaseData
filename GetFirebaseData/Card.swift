//
//  Card.swift
//  GetFirebaseData
//
//  Created by mark me on 11/10/22.
//

import SwiftUI

struct Card: View {
    
    var card: Person
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(maxWidth: .infinity)
                .frame(height: 150)
                .foregroundColor(Color.purple.opacity(0.3))
            
                .overlay {
                    VStack(alignment: .leading) {
                        HStack {
                            Image("boy")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .frame(width: 60, height: 60)
                                .overlay(RoundedRectangle(cornerRadius: 60).strokeBorder(Color.white, style: StrokeStyle(lineWidth: 2)))
                                .offset(x:-5, y: -10)
                            Text(card.name)
                                .bold()
                                .font(.custom("PlayfairDisplay-Bold", size: 30))
                                .padding(.all, 5)
                                .offset(y: -15)
                            Spacer()
                        }
                        Text(card.user_name)
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(Color.purple)
                            .padding(.top, 10)
                            .offset(y: -20)
                    }
                    .padding(.leading)
                }
        }
        .padding([.leading, .trailing], 10)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(card: Person(name: "Emma", user_name: "@emma1234"))
    }
}
