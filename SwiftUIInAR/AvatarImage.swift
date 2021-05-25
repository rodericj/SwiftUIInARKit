//
//  AvatarImage.swift
//  SwiftUIInAR
//
//  Created by Roderic Campbell on 5/24/21.
//

import SwiftUI

enum Avatars: String {
    case ada
    case anna
    case jackson
}

struct AvatarImage: View {
    let name: String
    var body: some View {
        HStack(alignment: .center, spacing: 10, content: {
            Spacer()
            ZStack(alignment: .bottom, content: {
                Image(name)
                    .resizable()
                    .frame(
                        width: 100,
                        height: 100,
                        alignment: .center
                    )
                    .clipShape(Circle())
                    .shadow(radius: 10)
                Text(name)
                    .font(.callout)
                    .foregroundColor(.black)
                    .background(Color.white)
            })
        })
    }
}

struct AvatarImage_Previews: PreviewProvider {
    static var previews: some View {
        AvatarImage(name: "Ada")
    }
}
