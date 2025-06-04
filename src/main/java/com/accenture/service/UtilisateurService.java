package com.accenture.service;


import com.accenture.config.UtilisateurCacheManager;
import com.accenture.config.UtilisateurCacheReloadEvent;
import com.accenture.model.Utilisateur;
import com.accenture.repository.UtilisateurRepository;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
@Slf4j
public class UtilisateurService {

    private UtilisateurRepository utilisateurRepository;
    private final ApplicationEventPublisher eventPublisher;


    @Cacheable(value = "utilisateurs" )
    public List<Utilisateur> getAllUtilisateurs() {
        log.info("Appel de la methode getAllUtilisateurs");
        return utilisateurRepository.findAll();
    }

    @CacheEvict(value = "utilisateurs", allEntries = true)
    public void removeUtilisateur(int id) {
        log.info("Appel de la methode removeUtilisateur");
        utilisateurRepository.deleteById(id);

        eventPublisher.publishEvent(new UtilisateurCacheReloadEvent(this));
    }
}
