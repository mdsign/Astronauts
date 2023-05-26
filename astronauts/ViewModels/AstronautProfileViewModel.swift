//
//  AstronautProfileViewModel.swift
//  astronauts
//
//  Created by m.maignanamoorthy on 04.05.23.
//

import Foundation

class AstronautProfileViewModel: ObservableObject {
    @Published var astronautName: String = ""
    @Published var profileImage: String = ""
    @Published var bioData: String = ""
    @Published var flights: [Flight] = []
    
    private var apiEndpoint = "https://ll.thespacedevs.com/2.2.0/astronaut/"
    
    func fetchAstroProfileData(id: Int) {
        
        let urlString = apiEndpoint + String("\(id)")
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let decoder = JSONDecoder()
                let astronaut = try decoder.decode(AstronautProfile.self, from: data)
                DispatchQueue.main.async {
                    self.astronautName = astronaut.name
                    self.profileImage = astronaut.profile_image
                    self.bioData = astronaut.bio
                    self.flights = astronaut.flights
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
