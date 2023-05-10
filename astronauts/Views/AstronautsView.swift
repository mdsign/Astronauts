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
                                        .frame(width: 120, height: 120)
                                        .cornerRadius(20)
                                        .overlay(RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.white, lineWidth: 5))
                                    
                                    VStack(alignment: .leading) {
                                                    Text(astronaut.name).font(.title3)
                                                    Text("Age: \(astronaut.age) years").font(.body)
                                        Spacer()
                                            
                                                }.padding(25)
                                    
                                }
                            }
                        )
                }
                .listStyle(.plain)
                .navigationTitle("Astronauts")
                .environment(\.defaultMinListRowHeight, 50)
                
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
