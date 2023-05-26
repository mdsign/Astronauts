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
        VStack(alignment: .leading) {
            
            AsyncImage(url: URL(string: viewModel.profileImage), content: {
                image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 350, height: 350)
                    .cornerRadius(20)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 2))
                
            }, placeholder: {
                Image(systemName: "person")
                .resizable()
                .foregroundColor(.gray)
                .frame(width: 300, height: 300)
            })
            Text(viewModel.astronautName).font(.title2).fontWeight(.heavy)
                .foregroundColor(.white)
            Text(viewModel.bioData).font(.body).multilineTextAlignment(.leading)
                .foregroundColor(.white)
            VStack(alignment: .leading) {
                Text("Flights")
                    .font(.title3)
                    .fontWeight(.heavy)
                ForEach(viewModel.flights, id: \.self) {
                    flight in
                    HStack(spacing: 15) {
                        Image(systemName: "airplane")
                        Text(flight.name).font(.body)
                    }.padding(10)
                    
                }
            } .padding(20).foregroundColor(.white)
            Spacer()
        }
        .padding(20)
        .background(Image("milkyway").resizable().scaledToFill().frame(width: 250, height: 870).aspectRatio(contentMode: .fill).edgesIgnoringSafeArea(.all))
        .onAppear {
            viewModel.fetchAstroProfileData(id: astronaut.id)
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            AstronautProfileView(astronaut: Astronaut(
                id: 1,
                name: "Thomas Pesquet",
                age: 42,
                profile_image_thumbnail: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/astronaut_images/thomas_pesquet_thumbnail_20220911033657.jpeg"
            ))
        }
    }
}
