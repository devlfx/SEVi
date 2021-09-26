//
//  StayDetail2View.swift
//  Notification
//
//  Created by Luis Abraham Ortega Gonzalez on 16/09/21.
//

import SwiftUI

struct StayDetailView: View {
    // State to bind to the offset moddifier to fix the header
    @State var offset: CGFloat = 0
    @Environment(\.presentationMode) var presentationMode
    @StateObject var stayDetailVM = StayDetailViewModel()
    // Name for coordinate space
    let coordinateName = "scrollStayDetail"
    // Max height for the header view
    let maxHeight = UIScreen.main.bounds.height / 2.3
    var topEdge: CGFloat
    var stay: Stay
    var stayId: Int
    
    init(topEdge:CGFloat, stay: Stay) {
        self.topEdge = topEdge
        self.stay = stay
        stayId = stay.idEstancia ?? 0
        
    }
    
    

    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing:15){
                GeometryReader {
                    proxy in
                    
                    TopBar(topEdge: topEdge, offset: $offset,maxHeight:maxHeight,stay: stay)
                    .foregroundColor(.white)
                    .frame(maxWidth:.infinity)
                        // this modifier allows to simulate a sticky effect it acctually grows the frame and the shape within
                    .frame(height:getHeaderHeight(), alignment: .bottom)
                    .background(
                            Rectangle()
                                .fill(Color("Principal"))
                                .cornerRadius(getCornerRadius(), corners: [.bottomRight])
                                
                        )
                    .overlay(
                        HStack(spacing: 15.0) {
                            Button(action:{
                                self.presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Image(systemName: "xmark")
                            })
                        Spacer()
                            HStack{
                                Image("p1")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width:35, height:35)
                                    .clipShape(Circle())
                                
                                Text(stay.paciente.fullName())
                                    .font(.title2)
                            }
                            .opacity(Double(getTopBarTitleOpacity()))
                            
                            
                            Spacer()
                            Button(action:{
                                
                            }, label: {
                                Image(systemName: "text.justify")
                                    .font(.body.bold())
                            })
                        }
                        
                        .padding(.top,40)
                        .padding(.horizontal)
                        .frame(height: 80 )
                        .foregroundColor(.white)
                        .padding(.top,topEdge)
                        , alignment: .top
                    )
                }
                .frame(height:maxHeight)
                // this modifier makes we cant move the scroll view up
                .offset(y:-offset)
                .zIndex(1.0)
                if let stay = stayDetailVM.stay, let informes = stay.informes{
                    LazyVStack(spacing:15) {
                        ForEach(informes,id:\.idInforme){
                            inform in
                            if let id = inform.idInforme{
                                
                            
                            NavigationLink( destination: InformDetailView(informId: id),label: { InformCellView(inform: inform) })
                            }
                        }
                    }.padding(.horizontal).zIndex(0.0)
                }
                
            }
            // Modifier Assigned to the VStack because this is the header we want to fix.
            // 2 way binding with modifier so it's contents are better positioned.
            .modifier(OffsetModifier(offset: $offset,name: coordinateName))
        }
        .coordinateSpace(name: coordinateName)
        .navigationBarHidden(true)
        .onAppear(perform:fetchStay)

        
    }
    
    
    func getTopBarTitleOpacity() -> CGFloat{
        let progress = -(offset + 70) / (maxHeight - ( 80 + topEdge ) )
        return progress
        
    }
    
    func getHeaderHeight() -> CGFloat {
        
        let topHeight = maxHeight + offset
        
        return topHeight > (80 + topEdge) ? topHeight: (80 + topEdge)
        
    }
    
    func getCornerRadius() -> CGFloat {
        let progress = -offset / (maxHeight - (80 + topEdge))
        
        let value = 1 - progress
        
        let radius = value * 50
        
        return offset < 0 ? radius : 50
    }
    
    func fetchStay(){
        stayDetailVM.getStayDetails(stayId:self.stayId)
    }

}

struct StayDetailView_Previews: PreviewProvider {
    static var previews: some View {
//        DetailContainerView()
//        StayDetailView(topEdge:50,stay:Stay.example())
        let vm = AuthViewModel()
        let appDelegate = AppDelegate()
        ContentView().environmentObject(vm)
            .environmentObject(appDelegate.notificationDelegate)
    }
}



/**
 View with information in headers
 
 */
struct TopBar: View {
    var topEdge: CGFloat
    @Binding var offset: CGFloat
    var maxHeight: CGFloat
    var stay:Stay
    
    var body: some View {
        VStack(alignment:.center, spacing:15){
            Image("p1").resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            
            Text(stay.paciente.fullName())
                .font(.title.bold())
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            
            Text("identificador: \(stay.paciente.identificador)")
                .font(.body.bold())
            
            Text(stay.hospital.nombre)
                .fontWeight(.semibold)
                .foregroundColor(Color.white.opacity(0.9))
            
            
            
            if let date = stay.fechaIngreso {
                Text(date,style: .date)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white.opacity(0.9))
            }
            
            
            
        }
        .padding()
        .padding(.bottom)
        .opacity(Double(getOpacity()))
    }
    
    func getOpacity() -> CGFloat {
        let progress = -offset / 70
        let opacity = 1 - progress
        
        return offset < 0 ? opacity : 1
        
    }
}
