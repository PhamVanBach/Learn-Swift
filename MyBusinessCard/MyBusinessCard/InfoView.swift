//
//  SwiftUIView.swift
//  MyBusinessCard
//
//  Created by Bach Pham on 12/10/2023.
//

import SwiftUI

struct InfoView: View {
    var iconName: String
    var value: String
    var body: some View {
        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            .fill(Color.white)
            .frame(height: 50)
            .overlay(HStack {
                Image(systemName: iconName)
                    .foregroundColor(.green)
                Text(value)
            })
            .padding(.all)
    }
}

#Preview {
    InfoView(iconName: "phone.fill", value: "+84 0389250384")
        .previewLayout(.sizeThatFits)
}
