import SwiftUI

struct UserRegisterView: View {
    @EnvironmentObject var list:Shopping;
    @State var user:String = "";
    @State var pass:String = "";
    @State var confirm:String = "";
    @State var showingAlert = false;
    @State var message = "";
    var body: some View{
        VStack{
            Header(heading: "   Register")
            CustomDivider(color: .purple, height: 2)
            
            VStack{
                HStack{
                    Label("User Name", systemImage: "").padding()
                    TextField("Enter User Name", text: $user)
                }
                HStack{
                    Label("Password", systemImage: "").padding()
                    TextField("minimum 8 characters", text: $pass)
                }
                HStack{
                    Label("Confirm Password", systemImage: "").padding()
                    TextField("minimum 8 characters", text: $confirm)
                }
                VStack{
                    Label("", systemImage: "").padding()
                }
            }.frame(height: 250, alignment: .topLeading)
            
            CustomDivider(color: .purple, height: 2)
            Button("Register    "){
                message = "";
                if(user == ""){
                    showingAlert = true;
                    message += "Enter User Name.\n\n";
                }
                if(pass == ""){
                    showingAlert = true;
                    message += "Enter Password.\n\n";
                }
                if(pass.count < 8){
                    showingAlert = true;
                    message += "Minimum 8digit password.\n\n";
                }
                if(pass != confirm){
                    showingAlert = true;
                    message += "Password Not Matching.\n";
                }
                if(message==""){
                    list.userName = user;
                list.appState = 2
                }
            }.alert(message, isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            }
            .foregroundColor(.black)
                .font(.title2)
                .padding()
                .background(Color.yellow.cornerRadius(18))
                
            Button("Home    "){
                list.appState = 0;
            }
            .foregroundColor(.black)
                .font(.title2)
                .padding()
                .background(Color.yellow.cornerRadius(18))
        }
        Spacer()
    }
}


