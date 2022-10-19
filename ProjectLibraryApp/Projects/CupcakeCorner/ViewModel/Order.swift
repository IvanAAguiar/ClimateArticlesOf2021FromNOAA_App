//
//  Order.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 19/10/2022.
//

import Foundation

class Order: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
    }
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false {
        didSet {
            if !specialRequestEnabled {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    var isValidInput: Bool {
        if !isValidName() ||
        !isValidStreetAddress() ||
        !isValidCity() ||
        !isValidZip() {
            return false
        }
        return true
    }
    
    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2
        
        // complicated cakes cost more
        cost += (Double(type) / 2)
        
        // $1/cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }
        
        // $0.5/cake for extra sprinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        return cost
    }
    
    init() {}
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)
        
        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSprinkles, forKey: .addSprinkles)
        
        try container.encode(name, forKey: .name)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
    }
    
    required init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)
        
        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
        
        name = try container.decode(String.self, forKey: .name)
        streetAddress = try container.decode(String.self, forKey: .streetAddress)
        city = try container.decode(String.self, forKey: .city)
        zip = try container.decode(String.self, forKey: .zip)
    }
    
    // MARK: Validation Functions
    
    func isValidName() -> Bool {
        do {
            let namePattern = #"^[a-zA-Z]+(([\'\,\.\-][a-zA-Z])?[a-zA-Z]*)*$"#
            let nameTest = try NSRegularExpression(pattern: namePattern)
            let range = NSRange(location: 0, length: name.count)
            if nameTest.firstMatch(in: name, range: range) != nil || name.count >= 3{
                return true
            } else {
                return false
            }
        } catch let error {
            print(error.localizedDescription)
            return false
        }
    }
    
    func isValidStreetAddress() -> Bool {
        do {
            let streetPattern = #"\A(\d+[a-zA-Z]{0,1}\s{0,1}[-]{1}\s{0,1}\d*[a-zA-Z]{0,1}|\d+[a-zA-Z-]{0,1}\d*[a-zA-Z]{0,1})\s*+(.*)"#
            let streetAddressTest = try NSRegularExpression(pattern: streetPattern)
            let range = NSRange(location: 0, length: streetAddress.count)
            if streetAddressTest.firstMatch(in: streetAddress, range: range) != nil {
                return true
            } else {
                return false
            }
        } catch let error {
            print(error.localizedDescription)
            return false
        }
    }
    
    func isValidZip() -> Bool {
        do {
            let zipPattern = #"^\d{4}([-]|\s*)?(\d{3})?$"#
            let zipTest = try NSRegularExpression(pattern: zipPattern)
            let range = NSRange(location: 0, length: zip.count)
            if zipTest.firstMatch(in: zip, range: range) != nil {
                return true
            } else {
                return false
            }
        } catch let error {
            print(error.localizedDescription)
            return false
        }
    }
    
    func isValidCity() -> Bool {
        do {
            let cityPattern = #"^[a-zA-Z]+(([\'\,\.\-][a-zA-Z])?[a-zA-Z]*)*$"#
            let cityTest = try NSRegularExpression(pattern: cityPattern)
            let range = NSRange(location: 0, length: city.count)
            if cityTest.firstMatch(in: city, range: range) != nil {
                return true
            } else {
                return false
            }
        } catch let error {
            print(error.localizedDescription)
            return false
        }
    }
}

