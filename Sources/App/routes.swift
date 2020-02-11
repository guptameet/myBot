import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }
    
    app.get("hello") { req in
        return "Hello, world!"
    }
    
    app.get("hello", ":name") { req -> String in
     
    guard let name = req.parameters.get("name") else {
     throw Abort(.notFound)
    }
      return "Hello \(name)"
    }
    
    app.post("botresponse") { req -> String in
        let response = try req.content.decode(BotResponse.self)
        return "Tobo bolta hai -- \(response.name) did \(response.today)."
    }
    
    let todoController = TodoController()
    app.get("todos", use: todoController.index)
    app.post("todos", use: todoController.create)
    app.on(.DELETE, "todos", ":todoID", use: todoController.delete)
}
