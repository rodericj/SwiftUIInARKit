//
//  ARCardView.swift
//  SwiftUIInAR
//
//  Created by Roderic Campbell on 5/23/21.
//

import SwiftUI
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
            AvatarImage(name: Avatars.anna.rawValue.capitalized)
            AvatarImage(name: Avatars.ada.rawValue.capitalized)
            AvatarImage(name: Avatars.jackson.rawValue.capitalized)
        }
    }
}

struct ARCardView_Previews: PreviewProvider {
    static var previews: some View {
        ARCardView()
    }
}
