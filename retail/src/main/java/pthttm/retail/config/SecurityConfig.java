package pthttm.retail.config;

import com.google.api.Authentication;
import com.google.api.Http;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import pthttm.retail.service.CustomerDetailsService;

import pthttm.retail.service.EmployeeDetailsService;


@Configuration
@EnableWebSecurity
public class SecurityConfig {

    //    @Bean
//    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {
//        httpSecurity
//                .csrf(csrf -> csrf.disable()) // Disable CSRF protection (for testing only)
//                .authorizeHttpRequests((requests) -> requests
//                        .anyRequest().permitAll())
//                .logout(LogoutConfigurer::permitAll);
//        return httpSecurity.build();
//    }

    @Bean
    public DaoAuthenticationProvider customerAuthProvider(CustomerDetailsService customerDetailsService) {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(customerDetailsService);
        authProvider.setPasswordEncoder(new BCryptPasswordEncoder());
        return authProvider;
    }

    @Bean
    public DaoAuthenticationProvider employeeAuthProvider(EmployeeDetailsService employeeDetailsService) {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(employeeDetailsService);
        authProvider.setPasswordEncoder(new BCryptPasswordEncoder());
        return authProvider;
    }

    @Bean
    public SecurityFilterChain customerSecurityFilterChain(HttpSecurity http,
                                                           DaoAuthenticationProvider customerAuthProvider) throws Exception {
        http
                .csrf(csrf -> csrf.disable())
                .authenticationProvider(customerAuthProvider)
                .securityMatcher("/customer/**")  // Đảm bảo đường dẫn được áp dụng cho quyền của ROLE_EMPLOYEE
                .authorizeHttpRequests(authorize -> authorize
                        .requestMatchers("/customer/home").hasRole("CUSTOMER") // Cấp quyền truy cập cho ROLE_EMPLOYEE
                        .anyRequest().authenticated())
                .formLogin(form -> form
                        .loginPage("/customer/login")
                        .loginProcessingUrl("/customer/login")
                        .defaultSuccessUrl("/home", true)
                        .permitAll());

        return http.build();
    }

    @Bean
    public SecurityFilterChain employSecurityFilterChain(HttpSecurity http,
                                                         DaoAuthenticationProvider employeeAuthProvider) throws Exception {
        http
                .csrf(csrf -> csrf.disable())
                .authenticationProvider(employeeAuthProvider)
                .securityMatcher("/manage/**")  // Đảm bảo đường dẫn được áp dụng cho quyền của ROLE_EMPLOYEE
                .authorizeHttpRequests(authorize -> authorize
                        .requestMatchers("/manage/product").hasRole("EMPLOYEE") // Cấp quyền truy cập cho ROLE_EMPLOYEE
                        .anyRequest().authenticated())
                .formLogin(form -> form
                        .loginPage("/manage/login")
                        .loginProcessingUrl("/manage/login")
                        .defaultSuccessUrl("/manage/product", true)
                        .permitAll());

        return http.build();
    }

    @Bean
    public static PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationFailureHandler authenticationFailureHandler() {
        return new SimpleUrlAuthenticationFailureHandler("/login?error=true");
    }
}









//    @Autowired
//    private CustomerDetailsService customerDetailsService;
//
//    @Autowired
//    private EmployeeDetailsService employeeDetailsService;
//
//    @Bean
//    public DaoAuthenticationProvider customerAuthProvider() {
//        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
//        authProvider.setUserDetailsService(customerDetailsService);
//        authProvider.setPasswordEncoder(new BCryptPasswordEncoder());
//        return authProvider;
//    }
//
//    @Bean
//    public DaoAuthenticationProvider employAuthProvider() {
//        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
//        authProvider.setUserDetailsService(employeeDetailsService);
//        authProvider.setPasswordEncoder(new BCryptPasswordEncoder());
//        return authProvider;
//    }

//    @Bean
//    @Order(1)
//    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {
//        httpSecurity
//                .securityMatcher("/css/**", "/js/**", "/image/**","/fonts/**","/modal/**") // Áp dụng cho tài nguyên tĩnh
//                .csrf(csrf -> csrf.disable())
//                .authorizeHttpRequests(authorize -> authorize
//                        .anyRequest().permitAll() // Cho phép truy cập công khai
//                );
//        return httpSecurity.build();
//    }
//
//    @Bean
//    @Order(2)
//    public SecurityFilterChain manageFilterChain(HttpSecurity httpSecurity) throws Exception {
//        httpSecurity
//                .securityMatcher("/manage/**")
//                .csrf(csrf -> csrf.disable())
//                .authorizeHttpRequests(requests -> requests
//                        .requestMatchers("/manage/login", "/manage/forgot-password").permitAll()
//                        .anyRequest().hasRole("EMPLOYEE")
//                )
//                .formLogin(form -> form
//                        .loginPage("/manage/login")  // Trang đăng nhập cho nhân viên
//                        .defaultSuccessUrl("/manage/product", true)  // Trang thành công sau khi đăng nhập
//                        .failureHandler(authenticationFailureHandler())
//                        .permitAll()
//                )
//                .logout(LogoutConfigurer::permitAll);
//        return httpSecurity.build();
//    }
//
//    @Bean
//    @Order(3)
//    public SecurityFilterChain customerFilterChain(HttpSecurity httpSecurity) throws Exception {
//        httpSecurity
//                .securityMatcher("/customer/**")
//                .csrf(csrf -> csrf.disable())
//                .authorizeHttpRequests(requests -> requests
//                        .requestMatchers("/home",
//                                "/login", "/forgot-password", "/register", "/register/confirm",
//                                "/confirm/phone", "/confirm/phone/send-otp", "/confirm/email", "/confirm/email/send-otp"
//                        ).permitAll()
//                        .anyRequest().hasRole("CUSTOMER")
//                )
//                .formLogin(form -> form
//                        .loginPage("/customer/login")  // Trang đăng nhập cho khách hàng
//                        .defaultSuccessUrl("/home", true)  // Trang thành công sau khi đăng nhập
//                        .failureHandler(authenticationFailureHandler())
//                        .permitAll()
//                )
//                .logout(LogoutConfigurer::permitAll);
//        return httpSecurity.build();
//    }
