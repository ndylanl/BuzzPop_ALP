//
//
//import SwiftUI
//import CoreData
//
//struct RegisterView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//    @State private var username: String = ""
//    @State private var password: String = ""
//    @State private var showAlert = false
//
//    var body: some View {
//        NavigationView{
//            VStack {
//                TextField("Username", text: $username)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//                SecureField("Password", text: $password)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//                Button(action: register) {
//                    Text("Register")
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//            }
//            .alert(isPresented: $showAlert) {
//                Alert(
//                    title: Text("Success"),
//                    message: Text("Username and password have been saved."),
//                    dismissButton: .default(Text("OK"), action: {
//                        username = ""
//                        password = ""
//                    })
//                )
//            }
//            .navigationTitle("Register")
//            .navigationBarTitleDisplayMode(.inline)
//        }
//    }
//
//    private func register() {
//        let newUser = PenggunaApp(context: viewContext)
//        newUser.username = username
//        newUser.password = password
//
//        do {
//            try viewContext.save()
//            showAlert = true
//        } catch {
//            // Penanganan kesalahan saat menyimpan data
//        }
//    }
//}
//
//
//
//struct RegisterView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisterView()
//    }
//}
////