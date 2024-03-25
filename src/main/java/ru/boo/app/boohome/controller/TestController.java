package ru.boo.app.boohome.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.boo.app.boohome.dto.TestDto;

@RestController
public class TestController {
    @GetMapping("/test")
    public TestDto getTest() {
        return new TestDto("Hello, World with Boohome!");
    }
}
