//
//  AstronautProfileViewModel.swift
//  astronauts
//
//  Created by m.maignanamoorthy on 04.05.23.
//

import Foundation

class AstronautsViewModel: ObservableObject {
    @Published var astraunauts: [Astronaut] = []
    
    func fetchAstroData() {
        guard let url = URL(string: "https://ll.thespacedevs.com/2.2.0/astronaut/") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let decoder = JSONDecoder()
                let astronauts = try decoder.decode(ResponseData.self, from: data)
                DispatchQueue.main.async {
                    self.astraunauts = astronauts.results
                }
                print(astronauts.results)
                
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
