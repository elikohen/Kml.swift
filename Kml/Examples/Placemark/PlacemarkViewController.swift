//
//  PlacemarkViewController.swift
//  Kml
//
//  Created by Koki Ibukuro on 8/17/15.
//  Copyright (c) 2015 asus4. All rights reserved.
//

import UIKit
import MapKit

// Placemark to MKAnnotation.
class PlacemarkViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        loadKml("sample")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    fileprivate func loadKml(_ path: String) {
        let url = Bundle.main.url(forResource: path, withExtension: "kml")
        KMLDocument.parse(url: url!, callback:
            { [unowned self] (kml) in
                // Add and Zoom to annotations.
                self.mapView.showAnnotations(kml.annotations, animated: true)
            }
        )
    }
}

extension PlacemarkViewController: MKMapViewDelegate {

}
