//
// Created by Karol on 05/10/2018.
//

import Foundation
import Stencil

struct ApplicationParameters {
    let generatorName: String
    let invocationParameters: [String: String]
}

protocol FileRenderer {
    func render(from template: String, parameters: [String: String]) throws -> String
}

protocol FileAdder {
    func addFile(with name: String, content: String, to directory: String)
}

protocol ProjectManipulator {
    func addToXCodeProject(file: String, target: String)
}

class Application {

    private let fileRenderer: FileRenderer
//    private let fileAdder: FileAdder
//    private let projectManipulator: ProjectManipulator

    init(fileRenderer: FileRenderer) {//}, fileAdder: FileAdder, projectManipulator: ProjectManipulator) {
        self.fileRenderer = fileRenderer
//        self.fileAdder = fileAdder
//        self.projectManipulator = projectManipulator
    }

    func run(parameters: ApplicationParameters) {
        guard parameters.generatorName == "cleanui" else {
            fatalError("Unknown generator: \(parameters.generatorName)")
        }

        let file = try! fileRenderer.render(from: "template", parameters: parameters.invocationParameters)
        print("FILE: \(file)")
//        fileAdder.addFile(with: "someName", content: file, to: parameters.invocationParameters["directory"]!)
//        projectManipulator.addToXCodeProject(file: file, target: parameters.invocationParameters["target"]!)
    }
}
