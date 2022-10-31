//
//  CarDetailView.swift
//  AppCars
//
//  Created by Pedro Boga on 30/10/22.
//

import SwiftUI
import AVKit

struct CarDetailView: View {
    @EnvironmentObject var favorites: FavoritesViewModel
    let car: Car
    @Binding var isShowingDetail: Bool
    @Binding var isFavorite: Bool
    @State private var showSheet: Bool = false
    
    var body: some View {
        VStack {
            CarRemoteImage(urlString: car.urlFoto ?? "")
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack {
                Text(car.nome ?? "")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(car.descricao ?? "")
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
            }
            Spacer()
            Button {
                showSheet.toggle()
            } label: {
                DetailButton(buttonType: .video)
            }
            .sheet(isPresented: $showSheet, content: {
                VideoPlayer(player: AVPlayer(url: URL(string: car.urlVideo ?? "")!))
                    .frame(width: 400, height: 300, alignment: .center)
                    //.presentationDetents([.height(350)])
            })
            Button {
                let mapsURL =  URL(string: "maps://?saddr=&daddr=\(car.latitude ?? "0"),\(car.longitude ?? "0")")
                //print(mapsURL)
                if UIApplication.shared.canOpenURL(mapsURL!) {
                    UIApplication.shared.open(mapsURL!, options: [:], completionHandler: nil)
                }
            } label: {
                DetailButton(buttonType: .location)
            }
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(
            HStack {
//                Button(action: {
//                    isFavorite.toggle()
//                    isFavorite ? favorites.addItem(car: car) : favorites.removeItem(car: car)
//            }, label: {
//                Image(systemName: isFavorite ? "heart.fill": "heart")
//        })
                Image(systemName: isFavorite ? "heart.fill": "heart")
                    .gesture(
                    TapGesture()
                        .onEnded({ _ in
                            isFavorite.toggle()
                            isFavorite ? favorites.addItem(car: car) : favorites.removeItem(car: car)
                        }))
                Button(action: {
                isShowingDetail = false
            }, label: {
                DismissButton()
        })
            }, alignment: .topTrailing
        )
    }
}

struct CarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CarDetailView(car: MockData.sampleCar, isShowingDetail: .constant(false), isFavorite: .constant(false))
    }
}
