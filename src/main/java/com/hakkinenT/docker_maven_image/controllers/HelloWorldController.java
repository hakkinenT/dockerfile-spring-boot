package com.hakkinenT.docker_maven_image.controllers;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(name = "/")
public class HelloWorldController {
    @GetMapping
    public ResponseEntity<String> helloWorld(){
        String message = "Hello World!";
        return ResponseEntity.ok(message);
    }
}
