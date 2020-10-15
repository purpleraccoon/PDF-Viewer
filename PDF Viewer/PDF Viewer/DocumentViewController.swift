//
//  DocumentViewController.swift
//  PDF Viewer
//
//  Created by Jeremy Kemery on 10/14/20.
//

import UIKit
import PDFKit

class DocumentViewController: UIViewController {
    
	@IBOutlet weak var pdfView: PDFView!
	@IBOutlet weak var documentNameLabel: UILabel!
    
    var document: Document?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

		pdfView.displayDirection = .horizontal
		pdfView.displayMode = .singlePage
        
        // Access the document
        document?.open(completionHandler: { (success) in
            if success {
                // Display the content of the document, e.g.:
                self.documentNameLabel.text = self.document?.fileURL.lastPathComponent
				self.pdfView.document = self.document!.pdfDocument
            } else {
                // Make sure to handle the failed import appropriately, e.g., by presenting an error message to the user.
            }
        })
    }
    
    @IBAction func dismissDocumentViewController() {
        dismiss(animated: true) {
            self.document?.close(completionHandler: nil)
        }
    }
}
