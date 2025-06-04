# POC Cache Spring Boot

Ce projet est une preuve de concept (POC) démontrant la mise en place d'un système de cache avec Spring Boot.

## Prérequis

- Java 21
- Maven 3.6+
- Spring Boot 3.4.6

## Configuration du cache

### 1. Activation du cache

Le cache est activé via l'annotation `@EnableCaching` dans la classe principale de l'application :

```java
@SpringBootApplication
@EnableCaching
public class PocCacheApplication {
    public static void main(String[] args) {
        SpringApplication.run(PocCacheApplication.class, args);
    }
}
```

### 2. Dépendances Maven

Assurez-vous d'avoir la dépendance Spring Cache dans votre `pom.xml` :

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-cache</artifactId>
</dependency>
```

## Utilisation du cache

### 1. Mise en cache des résultats

La méthode `getAllUtilisateurs()` du service `UtilisateurService` est mise en cache avec l'annotation `@Cacheable` :

```java
@Cacheable("utilisateurs")
public List<Utilisateur> getAllUtilisateurs() {
    log.info("Appel de la méthode getAllUtilisateurs");
    return utilisateurRepository.findAll();
}
```

### 2. Vidage du cache

La méthode `removeUtilisateur()` utilise `@CacheEvict` pour vider le cache après une suppression :

```java
@CacheEvict(value = "utilisateurs", allEntries = true)
public void removeUtilisateur(int id) {
    log.info("Appel de la méthode removeUtilisateur");
    utilisateurRepository.deleteById(id);
}
```

## Points importants

- Le cache utilise par défaut un `ConcurrentHashMap` en mémoire
- Le nom du cache est "utilisateurs"
- Le cache est vidé à chaque suppression d'utilisateur (`allEntries = true`)
- Les logs permettent de vérifier le bon fonctionnement du cache

## Configuration avancée

Pour configurer un fournisseur de cache différent (comme Caffeine, EhCache, Redis), il suffit d'ajouter la dépendance correspondante et de configurer les propriétés dans `application.properties`.

## Tests

Pour tester le cache : (mise en place de Swagger pourt tester, sinon :)

1. Lancez l'application
2. Effectuez un GET sur `/utilisateurs` plusieurs fois de suite
3. Observez les logs : seul le premier appel déclenche un accès à la base de données
4. Supprimez un utilisateur avec un DELETE sur `/utilisateurs/{id}`
5. Effectuez à nouveau un GET sur `/utilisateurs` : le cache est rechargé

## Améliorations possibles

- Ajouter une configuration TTL (Time To Live) pour le cache
- Implémenter un fournisseur de cache distribué (Redis, Hazelcast)
- Ajouter des métriques de cache
- Configurer la taille maximale du cache
