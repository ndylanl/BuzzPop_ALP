//
//import SwiftUI
//import CoreData
//
//struct LoginView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//    @State private var username: String = ""
//    @State private var password: String = ""
//    @State private var isLoggedin = false
//    @State private var showAlert = false
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                TextField("Username", text: $username)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//                SecureField("Password", text: $password)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//                Button(action: login) {
//                    Text("Login")
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//
//                }
//                .padding()
//                .disabled(username.isEmpty || password.isEmpty)
//            }
//            .navigationTitle("Login")
//            .navigationBarItems(trailing: registerButton)
//            .alert(isPresented: $showAlert) {
//                Alert(
//                    title: Text("Error"),
//                    message: Text("Invalid username or password."),
//                    dismissButton: .default(Text("OK"), action: {
//                        username = ""
//                        password = ""
//                    })
//                )//pemberitahuan kalo username atau pass salah, trus nanti username sama pass nya auto clear
//            }
//            .background(
//                NavigationLink(
//                    destination: HomeView(username: username)
//                        .navigationBarBackButtonHidden(true),
//                    isActive: $isLoggedin,
//                    label: { EmptyView() }
//                ) //melakukan navgasi jika username dan password cocok
//            )
//        }//navigation view
//
//    }
//
//
//    private var registerButton: some View {
//        NavigationLink(destination: RegisterView()) {
//            Text("Register")
//        }
//    }
//
//    private func login() {
//
//        if checkCredentials(username: username, password: password) {
//            isLoggedin = true
//        } else {
//            showAlert = true
//        }
//        // melakukan validasi login di sini, seperti memeriksa apakah username dan password cocok dengan data yang ada di Core Data.
//    }
//
//
//
//    private func checkCredentials(username: String, password: String) -> Bool {
//        let fetchRequest: NSFetchRequest<PenggunaApp> = PenggunaApp.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "username == %@ AND password == %@", username, password)
//
//        do {
//            let results = try viewContext.fetch(fetchRequest)
//            return !results.isEmpty
//        } catch {
//            print("Error fetching data: \(error)")
//            return false
//        }
//    }
//    //melakukan permintaan pencarian menggunakan NSFetchRequest ke entitas PenggunaApp dalam managed object context (viewContext). setelah itu predikat di tetapkan untuk mencocokkan username dan  password.
//
//}
//
//
//
//
//
//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
