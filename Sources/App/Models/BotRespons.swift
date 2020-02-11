//
//  File.swift
//  
//
//  Created by Meet Gupta - Pro on 11/02/20.
//

import Fluent
import Vapor

final class BotResponse: Model, Content {
    static let schema = "responses"
    
    @ID(key: "id")
    var id: Int?

    @Field(key: "name")
    var name: String
    
    @Field(key: "yesterday")
    var yesterday: String
    
    @Field(key: "today")
    var today: String
    
    @Field(key: "blockers")
    var blockers: String

    init() { }

    init(id: Int? = nil, name: String, yesterday: String, today: String, blockers: String) {
        self.id = id
        self.name = name
        self.yesterday = yesterday
        self.today = today
        self.blockers = blockers
    }
}
