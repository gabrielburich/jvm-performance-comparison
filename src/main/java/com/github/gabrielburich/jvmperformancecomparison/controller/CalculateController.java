package com.github.gabrielburich.jvmperformancecomparison.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/calculate")
public class CalculateController {

    @PostMapping("/plus-one")
    public ResponseEntity<Long> plusOne(@RequestBody Long value) {
        return ResponseEntity.ok().body(value + 1L);
    }

}
