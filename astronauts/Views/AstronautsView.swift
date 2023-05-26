//
//  ContentView.swift
//  astronauts
//
//  Created by m.maignanamoorthy on 04.05.23.
//

import SwiftUI

struct AstronautsView: View {
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black]
       }
    
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
                                        .cornerRadius(20)
                                        .overlay(RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.white, lineWidth: 2))
                                    
                                    VStack(alignment: .leading) {
                                                    Text(astronaut.name).font(.title3)
                                                    Text("Age: \(astronaut.age) years").font(.body)
                                        HStack{
                                            Image(systemName: "mappin.and.ellipse").padding(5).foregroundColor(.orange)
                                            Text(astronaut.nationality).font(.body)
                                            
                                        }
                                        
                                            
                                    }.padding(25)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 7)
                                    
                                }
                            }
                   ).listRowBackground(Color.gray.opacity(0.2).padding(3))
                        .listRowInsets(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: -5))
                        .foregroundColor(Color.white)
                }
                .background(Image("milkyway").resizable().scaledToFill().frame(width: 250, height: 870).aspectRatio(contentMode: .fill).edgesIgnoringSafeArea(.all))
                .listStyle(.plain)
                .navigationBarTitle("Astronauts")
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
