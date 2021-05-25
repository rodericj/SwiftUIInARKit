//
//  ARCardView.swift
//  SwiftUIInAR
//
//  Created by Roderic Campbell on 5/23/21.
//

import SwiftUI

struct AvatarImage1: View {
    let name: String
    var body: some View {
        HStack(alignment: .center, spacing: 10, content: {
            Spacer()
            HStack {
                Text(name)
                Image(name)
                    .resizable()
                    .frame(
                        width: 100,
                        height: 100,
                        alignment: .center
                    )
                    .clipShape(Circle())
                    .shadow(radius: 10)
            }
            
        })
    }
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

struct BlurView: UIViewRepresentable {

    let style: UIBlurEffect.Style

    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        return view
    }

    func updateUIView(_ uiView: UIView,
                      context: UIViewRepresentableContext<BlurView>) {

    }

}
struct ARCardView: View {
    var body: some View {
        VStack {
            AvatarImage(name: "Anna")
            AvatarImage(name: "Ada")
            AvatarImage(name: "Jackson")
        }
    }
}

struct ARCardView_Previews: PreviewProvider {
    static var previews: some View {
        ARCardView()
    }
}
