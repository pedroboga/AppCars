//
//  DetailButton.swift
//  AppCars
//
//  Created by Pedro Boga on 30/10/22.
//

import SwiftUI

enum ButtonType {
    case video
    case location
}

struct DetailButton: View {
    let buttonType: ButtonType
    var body: some View {
        HStack {
            if buttonType == .video {
                Image(systemName: "video")
                Text("Vídeo")
            } else if buttonType == .location {
                Image(systemName: "location.magnifyingglass")
                Text("Onde encontrar")
            }
        }
        .font(.title3)
        .fontWeight(.semibold)
        .frame(width: 260, height: 50)
        .foregroundColor(.white)
        .background(Color("appPrimary"))
        .cornerRadius(10)
    }
}

struct DetailButton_Previews: PreviewProvider {
    static var previews: some View {
        DetailButton(buttonType: .location)
    }
}
