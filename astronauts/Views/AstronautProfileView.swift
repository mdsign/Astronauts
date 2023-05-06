//
//  AstronautProfileView.swift
//  astronauts
//
//  Created by m.maignanamoorthy on 05.05.23.
//

import SwiftUI

struct AstronautProfileView: View {
    @StateObject private var viewModel = AstronautProfileViewModel()
    let astronaut: Astronaut
    
    var body: some View {
        VStack{
            Text(viewModel.astronautName).font(.title2).fontWeight(.heavy)
            AsyncImage(url: URL(string: viewModel.profileImage))
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 200)
        }
        
        .onAppear {
            viewModel.fetchAstroProfileData(id: astronaut.id)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AstronautProfileView(astronaut: Astronaut(
            id: 1,
            name: "Max Mustermann",
            age: 40,
            profile_image_thumbnail: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/astronaut_images/thomas_pesquet_thumbnail_20220911033657.jpeg"
        ))
    }
}
