import SwiftUI

struct RouteView: View {
    @Environment(\.colorScheme) var colorScheme

    let origin: String
    let destination: String

    let flightTimeLeft: Int
    let flightTimeTotal: Int

    var percentageCompleted: Double {
        Double(flightTimeTotal - flightTimeLeft) / Double(flightTimeTotal)
    }

    var body: some View {
        HStack {
            Text(origin)
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Capsule()
                        .frame(height: 4.0)
                        .foregroundColor(
                            colorScheme == .dark ?
                                .OneK.darkTrackColor :
                                .OneK.lightTrackColor
                        )
                    Capsule()
                        .frame(
                            width: geometry.size.width * CGFloat(percentageCompleted),
                            height: 4.0
                        )
                        .foregroundColor(Color.accentColor)
                    Image(systemName: "airplane")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .position(
                            x: geometry.size.width * CGFloat(percentageCompleted),
                            y: geometry.size.height / 2
                        )
                }
            }
            .frame(height: 24.0)
            Text(destination)
        }
    }
}

struct PlaneView_Previews: PreviewProvider {
    static var previews: some View {
        RouteView(
            origin: "SFO",
            destination: "FRA",
            flightTimeLeft: 123,
            flightTimeTotal: 527
        )
    }
}
