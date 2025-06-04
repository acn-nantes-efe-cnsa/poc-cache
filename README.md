# POC Cache Spring Boot

Ce projet est une preuve de concept (POC) démontrant la mise en place d'un système de cache avec Spring Boot, incluant une gestion événementielle pour le rechargement du cache.

## Prérequis

- Java 21
- Maven 3.6+
- Spring Boot 3.4.6

## Configuration du cache

### 1. Activation du cache

Le cache est activé via l'annotation `@EnableCaching` dans la classe principale de l'application. L'asynchronisme est également activé avec `@EnableAsync` :

```java
@SpringBootApplication
@EnableCaching
@EnableAsync
public class PocCacheApplication {
    public static void main(String[] args) {
        SpringApplication.run(PocCacheApplication.class, args);
    }
}
```

### 2. Dépendances Maven

Assurez-vous d'avoir les dépendances nécessaires dans votre `pom.xml` :

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-cache</artifactId>
</dependency>
```

## Architecture du cache

### 1. Gestion des événements de cache

Le projet utilise un système d'événements Spring pour gérer le rechargement du cache :

- `UtilisateurCacheReloadEvent` : Événement personnalisé déclenché lors de la modification des données
- `UtilisateurCacheManager` : Gère le rechargement asynchrone du cache

### 2. Initialisation du cache

Le cache est initialisé au démarrage de l'application via la méthode `initCache()` du `UtilisateurCacheManager` :

```java
@EventListener(ApplicationReadyEvent.class)
public void initCache() {
    log.info("Initialisation du cache");
    utilisateurService.getAllUtilisateurs(); // déclenche le chargement initial
}
```

## Utilisation du cache

### 1. Mise en cache des résultats

La méthode `getAllUtilisateurs()` du service `UtilisateurService` est mise en cache :

```java
@Cacheable("utilisateurs")
public List<Utilisateur> getAllUtilisateurs() {
    log.info("Appel de la méthode getAllUtilisateurs");
    return utilisateurRepository.findAll();
}
```

### 2. Vidage et rechargement du cache

La suppression d'un utilisateur déclenche le vidage du cache et son rechargement asynchrone :

```java
@CacheEvict(value = "utilisateurs", allEntries = true)
public void removeUtilisateur(int id) {
    log.info("Appel de la méthode removeUtilisateur");
    utilisateurRepository.deleteById(id);
    
    // Déclenche le rechargement asynchrone du cache
    eventPublisher.publishEvent(new UtilisateurCacheReloadEvent(this));
}
```

Le rechargement est géré de manière asynchrone par le `UtilisateurCacheManager` :

```java
@Async
@EventListener
public void reloadCacheAsync(UtilisateurCacheReloadEvent event) {
    utilisateurService.getAllUtilisateurs();
    log.info("Cache rechargé en tâche de fond");
}
```

## Points importants

- Le cache utilise par défaut un `ConcurrentHashMap` en mémoire
- Le rechargement du cache est effectué de manière asynchrone
- Les événements assurent la cohérence des données après modification
- Les logs permettent de suivre le cycle de vie du cache

## Configuration avancée

Pour configurer un fournisseur de cache différent (comme Caffeine, EhCache, Redis), il suffit d'ajouter la dépendance correspondante et de configurer les propriétés dans `application.properties`.

## Tests

Pour tester le cache : (mise en place de Swagger pourt tester, sinon :)

1. Lancez l'application
2. Effectuez un GET sur `/utilisateurs` plusieurs fois de suite
3. Observez les logs : seul le premier appel déclenche un accès à la base de données
4. Supprimez un utilisateur avec un DELETE sur `/utilisateurs/{id}`
5. Observez dans les logs le rechargement asynchrone du cache
6. Effectuez un nouveau GET sur `/utilisateurs` : les données sont fraîches

## Améliorations possibles

- Ajouter une configuration TTL (Time To Live) pour le cache
- Implémenter un fournisseur de cache distribué (Redis, Hazelcast)
- Ajouter des métriques de cache
- Configurer la taille maximale du cache
- Gérer les erreurs lors du rechargement asynchrone
