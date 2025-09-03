import SwiftUI
import MapKit

struct OrderMapView: View {
    var order: Order
    @StateObject var viewModel = AccountViewModel()

    var body: some View {
        VStack {
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)

            OrderSummaryView(address: viewModel.user.address,
                             firstName: viewModel.user.firstName,
                             ammounnt: order.totalPrice)
                .padding()

            Spacer()
        }
        .onAppear {
            viewModel.retriveUser()
        }
        .navigationTitle("Order Details")
    }
}

struct MapView: UIViewRepresentable {
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate1 = CLLocationCoordinate2D(latitude: 28.4963, longitude: 77.08919) // Cyberhub
        let coordinate2 = CLLocationCoordinate2D(latitude: 28.451389, longitude: 77.100556) // The Camellias

        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = coordinate1
        annotation1.title = "Cyberhub"
        uiView.addAnnotation(annotation1)

        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = coordinate2
        annotation2.title = "The Camellias"
        uiView.addAnnotation(annotation2)

        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: coordinate1))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: coordinate2))
        request.transportType = .automobile

        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            guard let route = response?.routes.first else { return }
            uiView.addOverlay(route.polyline)
            uiView.setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20), animated: true)
        }
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView

        init(_ parent: MapView) {
            self.parent = parent
        }

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let routePolyline = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(polyline: routePolyline)
                renderer.strokeColor = UIColor.blue
                renderer.lineWidth = 4
                return renderer
            }
            return MKOverlayRenderer()
        }
    }
}

