import SwiftUI

struct UserRegisterView: View {
    @EnvironmentObject var list:Shopping;
    @State var userName:String = "";
    @State var pass:String = "";
    @State var confirm:String = "";
    var body: some View{
        VStack{
            Header(heading: "   Register")
            CustomDivider(color: .purple, height: 2)
            
            VStack{
                HStack{
                    Label("User Name", systemImage: "").padding()
                    TextField("Enter User Name", text: $userName)
                }
                HStack{
                    Label("Password", systemImage: "").padding()
                    TextField("minimum 8 characters", text: $pass)
                }
                HStack{
                    Label("Confirm Password", systemImage: "").padding()
                    TextField("minimum 8 characters", text: $pass)
                }
            }.frame(height: 250, alignment: .topLeading)
            
            CustomDivider(color: .purple, height: 2)
            Button("Register    "){
                list.appState = 2
            }
            .foregroundColor(.black)
                .font(.title2)
                .padding()
                .background(Color.yellow.cornerRadius(18))
                
                
        }
        Spacer()
    }
}


