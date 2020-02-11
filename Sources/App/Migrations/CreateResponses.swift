//
//  File.swift
//  
//
//  Created by Meet Gupta - Pro on 11/02/20.
//

import Fluent

struct CreateResponses: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("responses")
            .field("id", .int, .identifier(auto: true))
            .field("name", .string, .required)
            .field("yesterday", .string, .required)
            .field("today", .string, .required)
            .field("blockers", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("responses").delete()
    }
}

