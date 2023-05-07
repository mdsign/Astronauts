//
//  Astronaut.swift
//  astronauts
//
//  Created by m.maignanamoorthy on 04.05.23.
//

import Foundation

struct ResponseData: Codable {
    let results: [Astronaut]
}

struct Astronaut: Hashable, Codable {
    let id: Int
    let name: String
    let age: Int
    let profile_image_thumbnail: String
}

struct AstronautProfile: Codable {
    let name: String
    let profile_image: String
    var flights: [Flight]
}

struct Flight: Hashable, Codable {
    let name: String
}
