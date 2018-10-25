//
//  FileRenderer.swift
//  sbg
//
//  Created by Dawid Markowski on 09/10/2018.
//

import Stencil

class StencilFileRenderer: FileRenderer {
    func renderTemplate(name: String, context: [String: Any]?) throws -> String {
        return try Environment().renderTemplate(name: name, context: context)
    }
}
