//
//  DetailButton.swift
//  AppCars
//
//  Created by Pedro Boga on 30/10/22.
//

import SwiftUI

struct DetailButton: View {
    let textButton: String
    var body: some View {
        Text(textButton)
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
        DetailButton(textButton: "Teste")
    }
}
