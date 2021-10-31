//
//  MapView.swift
//  Silas Approved Stickers
//
//  Created by Robin Beer on 31.10.21.
//

import SwiftUI
import Foundation
import MapKit

struct Item: Identifiable {
  var id: UUID = .init()
  var latitude: Double
  var longitude: Double
  var coordinate: CLLocationCoordinate2D {
    return .init(latitude: latitude, longitude: longitude)
  }
}

struct MapView: View {
    
    @Binding var stickers: [AllStickersQuery.Data.Sticker]
    
    @ObservedObject private var viewModel = MapViewModel()
    
    var body: some View {
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: stickers) { sticker in
            MapAnnotation(coordinate: generateCoordinatesFromSticker(sticker)) {
                Image(systemName: "star.fill").foregroundColor(Color.pink)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .accentColor(Color.pink)
        .onAppear {
            viewModel.checkIfLocationServicesIsEnabled()
        }
    }
}

func generateCoordinatesFromSticker(_ sticker: AllStickersQuery.Data.Sticker) -> CLLocationCoordinate2D {
    print("generating from stikcer", sticker)
    return CLLocationCoordinate2D(latitude: sticker.location.lat, longitude: sticker.location.lng)
}


struct MapView_Previews: PreviewProvider {

    static var previews: some View {
        MapView(stickers: .constant([]))
    }
}
