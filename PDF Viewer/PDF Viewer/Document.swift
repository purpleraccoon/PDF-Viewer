//
//  Document.swift
//  PDF Viewer
//
//  Created by Jeremy Kemery on 10/14/20.
//

import UIKit
import PDFKit

class Document: UIDocument {

	lazy var pdfDocument = PDFDocument(url: fileURL)!
    
    override func contents(forType typeName: String) throws -> Any {
        // Encode your document with an instance of NSData or NSFileWrapper
        return Data()
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        // Load your document from contents
    }
}

