package com.xworkz.medisalesapp.service;

import com.xworkz.medisalesapp.dto.DistributorDto;
import com.xworkz.medisalesapp.dto.UserDto;
import com.xworkz.medisalesapp.entity.DistributorEntity;
import com.xworkz.medisalesapp.entity.UserEntity;
import com.xworkz.medisalesapp.repository.DistributerRepository;
import com.xworkz.medisalesapp.repository.MediSalesRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.*;
import java.util.HashMap;
import java.util.Map;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.JsonNode;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.xworkz.medisalesapp.configuration.SpringConfiguration;

@Slf4j
@Service
public class AjaxServiceImpl implements AjaxService {
   @Autowired
  private MediSalesRepository repository;
   @Autowired
   private MailService mailService;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private DistributerRepository distributerRepository;
    @Autowired
    private RestTemplate restTemplate;

    @Override
    public String checkEmail(String email) {
        boolean isExists = repository.checkMail(email);
        if(isExists)
            return "Email Already Exists";

        return "Email does not exists";
    }

    @Override
    public String checkPhone(String phone) {
        boolean isExists = repository.checkPhone(phone);
        if(isExists)
            return "PhoneNumber Already Exists";

        return "PhoneNumber does not exists";
    }

    @Override
    public String sendOtp(String email) {
       UserEntity userEntity= repository.getDtoByEmail(email);
       if(userEntity.getEmail()!=null){
           Random random = new Random();
           Integer otp = random.nextInt(9999);
           log.info("###################################################");
           log.info("OTP FOR {} IS :: {}", email, otp);
           log.info("###################################################");
           
           // mailService.sendRegistrationMessage("OTP Verification","Dear"+ userEntity.getContactPerson()+" YOUR OTP FOR VERIFICATION ::  "+otp,email);
           
           userEntity.setOtp(passwordEncoder.encode(otp.toString()));
           userEntity=repository.update(userEntity);
           return "OTP Sent Successfully";
       }else return "User not found";
    }

    @Override
    public List<DistributorDto> getProducts(){
        List<DistributorEntity> entities = distributerRepository.getAllDistributors();
        List<DistributorDto> dto = new ArrayList<>();


        for (DistributorEntity entity : entities) {
            DistributorDto distributorDto = new DistributorDto();
            BeanUtils.copyProperties(entity, distributorDto);
            dto.add(distributorDto);
        }

        return dto;
    }

    @Override
    public List<UserDto> getUser() {
        List<UserEntity> entities = repository.getAllUsers();
        List<UserDto> dto = new ArrayList<>();

        for (UserEntity entity : entities) {
            UserDto userDto = new UserDto();
            BeanUtils.copyProperties(entity, userDto);
            dto.add(userDto);
        }

        return dto;
    }

    @Override
    public int getStockByProduct(String productName) {
        return distributerRepository.getStockByProduct(productName);
    }

    @Override
    public String chatWithAi(String prompt) {
        String apiKey = SpringConfiguration.getEnv("AI_API_KEY");
        if (apiKey == null || apiKey.isEmpty()) {
            return "AI API Key not configured in environment.";
        }

        String url ="https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-lite:generateContent?key="+ apiKey;


        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);

            String knowledgeBase = "You are the MediSales ERP Assistant. Your goal is to help users use the system effortlessly: " +
                "1. To generate an invoice, tell them to go to 'Billing' and select the product and customer. " +
                "2. To check current stock levels, guide them to 'Inventory'. " +
                "3. To add new items to the system, tell them to go to 'New Stock' and enter the product details like Name, Quantity, and Dates. " +
                "4. To change profile or company details, send them to 'Settings'. " +
                "Answer in a friendly way and focus on helping them complete their tasks.";

            Map<String, Object> body = new HashMap<>();
            Map<String, Object> content = new HashMap<>();
            Map<String, Object> part = new HashMap<>();
            part.put("text", "You are a helpful assistant for MediSales ERP. Knowledge base: " + knowledgeBase + "\nUser asked: " + prompt);
            content.put("parts", new Object[]{part});
            body.put("contents", new Object[]{content});

            HttpEntity<Map<String, Object>> entity = new HttpEntity<>(body, headers);
            ResponseEntity<String> response = restTemplate.postForEntity(url, entity, String.class);

            ObjectMapper mapper = new ObjectMapper();
            JsonNode root = mapper.readTree(response.getBody());
            return root.path("candidates").get(0).path("content").path("parts").get(0).path("text").asText();

        } catch (Exception e) {
            log.error("Error calling Gemini API", e);
            return "Error connecting to AI: " + e.getMessage();
        }
    }
}
