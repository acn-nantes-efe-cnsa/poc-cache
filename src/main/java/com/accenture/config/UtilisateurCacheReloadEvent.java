package com.accenture.config;

import org.springframework.context.ApplicationEvent;

public class UtilisateurCacheReloadEvent  extends ApplicationEvent {
    public UtilisateurCacheReloadEvent(Object source) {
        super(source);
    }
}