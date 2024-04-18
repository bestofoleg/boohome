package ru.boo.app.boohome.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import ru.boo.app.boohome.dto.TestDto;

import java.util.Map;

@Slf4j
@RestController
public class TestController {
    @GetMapping("/test")
    public TestDto getTest() {
        return new TestDto("Hello, World with Boohome!");
    }

    @PostMapping("/test/alice")
    public ResponseEntity<Void> testAlice(@RequestBody Map<String, Object> aliceRequest) {
        log.info("Получено сообщения с сервера Яндекс через Алису: {} ", aliceRequest);
        return ResponseEntity.ok().build();
    }
}
