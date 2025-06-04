package com.accenture.config;

import com.accenture.service.UtilisateurService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import java.util.concurrent.atomic.AtomicBoolean;

@Component
@RequiredArgsConstructor
@Slf4j
public class UtilisateurCacheManager {

    private final UtilisateurService utilisateurService;
    private final AtomicBoolean reloadInProgress = new AtomicBoolean(false);

    @EventListener(ApplicationReadyEvent.class)
    public void initCache() {
        log.info("Initialisation du cache");
        utilisateurService.getAllUtilisateurs(); // appelle la méthode @Cacheable
    }

    @Async
    @EventListener
    public void reloadCacheAsync(UtilisateurCacheReloadEvent event) {
        utilisateurService.getAllUtilisateurs();
        log.info("Cache rechargé en tâche de fond");
    }
}