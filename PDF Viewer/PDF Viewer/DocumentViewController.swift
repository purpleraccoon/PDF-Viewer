//
//  DocumentViewController.swift
//  PDF Viewer
//
//  Created by Jeremy Kemery on 10/14/20.
//

import UIKit
import PDFKit

class DocumentViewController: UIPageViewController {
    var document: Document?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Access the document
        document?.open(completionHandler: { (success) in
			if success && self.document?.pdfDocument.pageCount ?? 0 > 0 {
                // Display the content of the document, e.g.:
				let storyBoard = UIStoryboard(name: "Main", bundle: nil)
				let pageVC = storyBoard.instantiateViewController(withIdentifier: "PDFPage") as! PDFPageViewController
				pageVC.pdfDocument = self.document?.pdfDocument
				pageVC.pageNumber = 0
				self.setViewControllers([pageVC], direction: .forward, animated: false, completion: nil)
            } else {
                // Make sure to handle the failed import appropriately, e.g., by presenting an error message to the user.
            }
        })
    }
    
//    @IBAction func dismissDocumentViewController() {
//        dismiss(animated: true) {
//            self.document?.close(completionHandler: nil)
//        }
//    }
}

extension DocumentViewController: UIPageViewControllerDataSource {
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
		if document?.pdfDocument.pageCount ?? 0 > (viewController as! PDFPageViewController).pageNumber {
			let storyBoard = UIStoryboard(name: "Main", bundle: nil)
			let pageVC = storyBoard.instantiateViewController(withIdentifier: "PDFPage") as! PDFPageViewController
			pageVC.pdfDocument = self.document?.pdfDocument
			pageVC.pageNumber = (viewController as! PDFPageViewController).pageNumber + 1
			return pageVC
		} else {
			return nil
		}
	}

	func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
		return nil
	}


}
