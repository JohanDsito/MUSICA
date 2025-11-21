package com.example.musica;

import java.util.Set;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.example.musica.infraestructura.model.User;
import com.example.musica.infraestructura.repository.UserRepository;

@SpringBootApplication
public class MusicaApplication {
public static void main(String[] args) {
            SpringApplication.run(MusicaApplication.class, args);
    }

    @Bean
    CommandLineRunner initDefaultUser(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        return args -> {
            if (userRepository.count() == 0) {
                User admin = new User("admin", passwordEncoder.encode("admin123"), Set.of("ROLE_ADMIN"));
                userRepository.save(admin);
            }
        };
    }

}
