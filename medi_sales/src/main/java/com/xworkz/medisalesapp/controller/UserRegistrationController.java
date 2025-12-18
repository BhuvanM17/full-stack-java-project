package com.xworkz.medisalesapp.controller;

import com.xworkz.medisalesapp.dto.UserDto;
import com.xworkz.medisalesapp.service.MediSalesService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Slf4j
@Controller
@RequestMapping("/")
public class UserRegistrationController  {
@Autowired
  private   MediSalesService mediSalesService;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private com.xworkz.medisalesapp.service.DistributerService distributerService;
    @GetMapping("index")
    public String home() {
        return "index";
    }

    @GetMapping("signup")
    public String onClickRegister() {
        return "signup";
    }
    @GetMapping("signin")
    public String onClickSignin() {
        return "signin";
    }
    @GetMapping("otpSignIn")
    public String otpSignIn() {
        return "otpSignIn";
    }

    @PostMapping("registration")
    public String registration(@Valid UserDto userDto,BindingResult result, Model model ,BindingResult bindingResult){
        log.info("Processing signup form...");
            boolean hasErrors = bindingResult.hasErrors();

            if (hasErrors) {
                bindingResult.getAllErrors().forEach(error -> {
                    FieldError fieldError = (FieldError) error;
                    System.out.println(fieldError.getField() + " Error message: " + fieldError.getDefaultMessage());

                    if (fieldError.getField().equalsIgnoreCase("companyName")) {
                        model.addAttribute("companyNameError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("contactPerson")) {
                        model.addAttribute("contactPersonError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("businessType")) {
                        model.addAttribute("businessTypeError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("mobile")) {
                        model.addAttribute("mobileError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("email")) {
                        model.addAttribute("emailError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("address")) {
                        model.addAttribute("addressError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("password")) {
                        model.addAttribute("passwordError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("confirmPassword")) {
                        model.addAttribute("confirmPasswordError", fieldError.getDefaultMessage());
                    }
                });

                return "signup";
            }
        boolean isAdded = mediSalesService.validateAndSave(userDto);
        log.info("User successfully registered: {}", userDto);

        model.addAttribute("name",userDto.getContactPerson());
        return "response";
    }
    @GetMapping("login")
    public String login(@RequestParam String email, @RequestParam String password, Model model,HttpSession session) {
        log.info("Entered login");

        UserDto dto = mediSalesService.getDtoByEmailAndPassword(email,password);
        session.setAttribute("sessionDto",dto);
        if(dto.getNoOfAttempts()<=3) {
            if (dto.getEmail() != null&& passwordEncoder.matches(password, dto.getPassword())) {
                dto.setNoOfAttempts(0);
                dto.setNoOfLogins(dto.getNoOfLogins()+1);
                UserDto dto1= mediSalesService.update(dto);
                model.addAttribute("dto", dto1);
                
                // Fetch stats for dashboard
                java.util.List<com.xworkz.medisalesapp.dto.DistributorDto> stocks = distributerService.getAllProductsStocksByEmail(dto1.getEmail());
                model.addAttribute("totalProducts", stocks.size());
                double totalInventoryValue = stocks.stream().mapToDouble(s -> s.getRate() * s.getQuantity()).sum();
                model.addAttribute("inventoryValue", totalInventoryValue);
                long lowStockCount = stocks.stream().filter(s -> s.getQuantity() < 10).count();
                model.addAttribute("lowStockCount", lowStockCount);
                
                // Top 5 products for chart
                java.util.List<com.xworkz.medisalesapp.dto.DistributorDto> topProducts = stocks.stream()
                        .sorted((a, b) -> Integer.compare(b.getQuantity(), a.getQuantity()))
                        .limit(5)
                        .collect(java.util.stream.Collectors.toList());
                model.addAttribute("topProducts", topProducts);
                
                return "dashboard";
            }else {
                model.addAttribute("notFound", "Invalid Credentials");
                model.addAttribute("email",email);
                return "signin";
            }
        }else {
            model.addAttribute("notFound", "Account Blocked");
            model.addAttribute("email",email);
            return "otpSignIn";
        }
    }
    @GetMapping("dashboard")
    public String dashboard(HttpSession session, Model model) {
        log.info("Entered dashboard");
        UserDto dto = (UserDto) session.getAttribute("sessionDto");
        if (dto != null) {
            model.addAttribute("dto", dto);
            java.util.List<com.xworkz.medisalesapp.dto.DistributorDto> stocks = distributerService.getAllProductsStocksByEmail(dto.getEmail());
            model.addAttribute("totalProducts", stocks.size());
            double totalInventoryValue = stocks.stream().mapToDouble(s -> s.getRate() * s.getQuantity()).sum();
            model.addAttribute("inventoryValue", totalInventoryValue);
            long lowStockCount = stocks.stream().filter(s -> s.getQuantity() < 10).count();
            model.addAttribute("lowStockCount", lowStockCount);
            
            // Top 5 products for chart
            java.util.List<com.xworkz.medisalesapp.dto.DistributorDto> topProducts = stocks.stream()
                    .sorted((a, b) -> Integer.compare(b.getQuantity(), a.getQuantity()))
                    .limit(5)
                    .collect(java.util.stream.Collectors.toList());
            model.addAttribute("topProducts", topProducts);
        }
        return "dashboard";
    }
    @GetMapping("forgot-password")
    public String forgotPassword(){
        return "forgot-password";
    }
    @GetMapping("forget")
    public String forget( String email, String newPassword, String confirmPassword, Model model){
        log.info("Entered forget password ");
        boolean isUpdated;
        if (email != null && newPassword != null && confirmPassword != null) {

            if (newPassword.equals(confirmPassword)) {

                isUpdated = mediSalesService.updatePasswordByEmail(email, newPassword);

                if (isUpdated) {
                    model.addAttribute("valid", "Password Updated Successfully You can login now");
                    return "signin";
                } else {
                    model.addAttribute("Invalid", "Please provide valid email and passwords");
                    return "forgot-password";
                }
            } else {
                model.addAttribute("Invalid", "Passwords do not match");
                return "forgot-password";
            }
        } else {
            model.addAttribute("Invalid", "Please provide valid email and passwords");
            return "forgot-password";
        }

    }
    @GetMapping("fetchDto")
    public String fetch(@RequestParam String eMail, Model model, HttpSession session){
        UserDto dto=mediSalesService.getDtoByEmail(eMail);
        session.setAttribute("sessionDto",dto);
        model.addAttribute("dto",dto);

        return "update";
    }
    @PostMapping("updateProfile")
    public String update(UserDto dto, Model model, HttpServletRequest httpServletRequest){
        UserDto sessionDto = (UserDto) httpServletRequest.getSession().getAttribute("sessionDto");
        UserDto dto1 = mediSalesService.updateWithSeesionDto(dto,sessionDto);
        model.addAttribute("Successful","Updated SuccessFully");
        model.addAttribute("dto", dto1);
        return "update";
    }
    @GetMapping("sendOtp")
    public String verifyOtp(@RequestParam String email,String otp,Model model){
        boolean isOtpCorrect =  mediSalesService.validateOtp(email,otp);
        if(isOtpCorrect) {
            model.addAttribute("valid","Email verified Please reset your password");
            model.addAttribute("email",email);
            return "forgot-password";
        }
        else {
            model.addAttribute("msg","Please enter valid otp");
            return "otpSignIn";
        } }
        @GetMapping("createstock")
        public String getCreateStock(){
        return "createstock";
        }


}
