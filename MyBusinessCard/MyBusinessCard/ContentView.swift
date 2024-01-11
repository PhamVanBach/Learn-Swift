//
//  ContentView.swift
//  MyBusinessCard
//
//  Created by Bach Pham on 12/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.09, green: 0.63, blue: 0.52)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("bachba")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150.0, height: 150.0)
                    .imageScale(.large)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 5)
                    )
                Text("Bach Pham")
                    .font(Font.custom("PixelifySans-Regular", size: 40))
                    .foregroundColor(.white)
                Text("iOS Developer")
                    .font(Font.custom("PixelifySans-Regular", size: 25))
                    .foregroundColor(.white)
                Divider()

                InfoView(iconName: "phone.fill", value: "+84 0389250384")
                InfoView(iconName: "envelope.fill", value: "bachpham8520@gmail.com")
            }
        }
    }
}

#Preview {
    ContentView()
}
