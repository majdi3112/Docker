# The Missing Manual - Docker Demo Website

Deze repository bevat een Docker-setup voor een eenvoudige demo-website genaamd "De Ontbrekende Handleiding".

## Projectstructuur

```
.
├── Dockerfile              # Docker configuratie voor de webserver
├── html/                   # Website bestanden
│   ├── index.html         # Homepage van de website
│   └── buildtime.txt      # Wordt automatisch gegenereerd tijdens build
├── build-en-start-op-poort-81.sh    # Script om container te bouwen en starten
└── stop-en-remove-container.sh       # Script om container te stoppen en verwijderen
```

## Vereisten

- Docker geïnstalleerd op je systeem
- Bash-compatible shell (Linux/WSL2/macOS)
- Poort 81 beschikbaar op je systeem

## Installatie en Gebruik

1. Zorg dat de scripts uitvoerbaar zijn:
   ```bash
   chmod +x build-en-start-op-poort-81.sh stop-en-remove-container.sh
   ```

2. Bouw en start de container:
   ```bash
   ./build-en-start-op-poort-81.sh
   ```

3. Bezoek de website:
   - Open http://localhost:81/ in je browser
   - Bekijk de buildtijd op http://localhost:81/buildtime.txt

4. Stop en verwijder de container:
   ```bash
   ./stop-en-remove-container.sh
   ```

## Technische Details

- Base image: Ubuntu 20.04
- Webserver: Apache2
- Host poort: 81
- Container poort: 80
- Container naam: demo-container
- Image tag: demo-site:latest

## Cloud/Azure

Voor gebruik in de cloud moet je de volgende stappen uitvoeren:

1. Azure NSG (Network Security Group):
   - Voeg een inbound rule toe voor TCP poort 81
   - Prioriteit: 1000
   - Bron: * (of specifieke IP ranges)
   - Doel: VM IP
   - Service: Custom
   - Protocol: TCP
   - Poort: 81

2. Linux Firewall (WSL/VM):
   ```bash
   sudo ufw allow 81/tcp
   ```

## Probleemoplossing

1. **Poort 81 is al in gebruik:**
   Stop eerst andere services die poort 81 gebruiken.

2. **Container start niet:**
   Controleer of er geen oude containers zijn met:
   ```bash
   docker ps -a | grep demo-container
   ```

3. **Permissie geweigerd bij uitvoeren scripts:**
   Voer het chmod commando uit zoals beschreven bij "Installatie en Gebruik".

## Onderhoud

De container wordt automatisch herbouwd elke keer dat je `build-en-start-op-poort-81.sh` uitvoert. Dit zorgt ervoor dat:
- De nieuwste code wordt gebruikt
- Een nieuwe buildtime.txt wordt gegenereerd in UTC formaat
- Eventuele wijzigingen in de Dockerfile worden toegepast 