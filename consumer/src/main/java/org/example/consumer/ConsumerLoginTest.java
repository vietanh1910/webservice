//package org.example.consumer;
//
//import com.mycompany.client.generated.AuthService;
//import com.mycompany.client.generated.AuthServiceImplService;
//
//public class ConsumerLoginTest {
//    public static void main(String[] args) {
//        // Tạo service từ WSDL
//        AuthServiceImplService service = new AuthServiceImplService();
//        AuthService auth = service.getAuthServiceImplPort();
//
//        // Gửi request login
//        String jwt = auth.login("admin", "123456");
//
//        System.out.println("JWT Token nhận được từ Provider: " + jwt);
//    }
//}
