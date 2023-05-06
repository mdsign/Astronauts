//
//  ContentView.swift
//  astronauts
//
//  Created by m.maignanamoorthy on 04.05.23.
//

import SwiftUI

struct AstronautsView: View {
    @StateObject private var viewModel = AstronautsViewModel()
    var body: some View {
        NavigationView {
                List(viewModel.astraunauts, id: \.id) {astronaut in
                        NavigationLink(
                            destination: AstronautProfileView(astronaut: astronaut ),
                            label: {
                                HStack {
                                    AsyncImage(url: URL(string: astronaut.profile_image_thumbnail))
                                        .frame(width: 100, height: 100)
                                        .clipped().cornerRadius(20)
                                    VStack(alignment: .leading) {
                                        Text(astronaut.name).font(.title3)
                                        Text("Age: \(astronaut.age)").font(.body)
                                    }.padding(5)
                                    
                                }
                            }
                        )
                }
                .navigationTitle("Astronauts")
                .environment(\.defaultMinListRowHeight, 20)
                
        }
        .onAppear {
            viewModel.fetchAstroData()
        }
    }
}

struct AstronautView_Previews: PreviewProvider {
    static var previews: some View {
        AstronautsView()
    }
}
