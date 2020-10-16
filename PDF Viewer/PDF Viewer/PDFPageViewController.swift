//
//  PDFPageViewController.swift
//  PDF Viewer
//
//  Created by Jeremy Kemery on 10/15/20.
//

import PDFKit

class PDFPageViewController: UIViewController {

	@IBOutlet weak var pdfView: PDFView!

	var pdfDocument: PDFDocument? = nil
	var pageNumber: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		if let doc = pdfDocument, let page = doc.page(at: pageNumber)  {
			pdfView.document = doc
			pdfView.autoScales = true
			pdfView.displayDirection = .horizontal
			pdfView.displayMode = .singlePage
			pdfView.go(to: page)
		}
	}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
