# Laclede's LAN Unreal Tournament 99 Dedicated Freeplay Server

![Laclede's LAN Unreal Tournament 99 Dedicated Freeplay Server](https://raw.githubusercontent.com/LacledesLAN/gamesvr-ut99-freeplay/refs/heads/main/.misc/banner-ut99-freeplay.png "Laclede's LAN Unreal Tournament 99 Dedicated Freeplay Server")

This repository is maintained by [Laclede's LAN](https://lacledeslan.com). Its contents are heavily tailored and tweaked for use at our charity LAN-Parties. For third-parties we recommend using this repo only as a reference example and then building your own using [gamesvr-ut99](https://github.com/LacledesLAN/gamesvr-ut99) as the base image for your customized server.

## Linux Container

[![linux/amd64](https://github.com/LacledesLAN/gamesvr-ut99-freeplay/actions/workflows/build-linux-image.yml/badge.svg)](https://github.com/LacledesLAN/gamesvr-ut99-freeplay/actions/workflows/build-linux-image.yml)

### Download

```shell
docker pull lacledeslan/gamesvr-ut99-freeplay;
```

### Run Self Tests

The image includes a test script that can be used to verify its contents. No changes or pull-requests will be accepted to this repository if any tests fail.

```shell
docker run -it --rm lacledeslan/gamesvr-ut99-freeplay ./ll-tests/gamesvr-ut99-freeplay.sh;
```

### Run simple interactive server

```shell
docker run -it --rm --net=host lacledeslan/gamesvr-ut99-freeplay /app/ucc server DM-Hood.unr?game=Botpack.DeathMatchPlus -nohomedir -lanplay
```

## Custom Content

### Maps

| Name                        | Author                           | Notes                       |
| :-------------------------- | :------------------------------- | :-------------------------- |
| 1on1-Joust (CTF)            | Patrick 'KillRoy' Buijs          | 2-4 players, Bots supported |
| Ablee                       | David 'DavidM' Münnich           |  |
| Babylon                     | Rich 'Akuma' Eastwood            |  |
| Brickyard                   | Ken ''DrunKenobi'' Lynch         |  |
| Bond 007 Goldeneye Archives | Si "Kain" Cass                   |  |
| Bond 007 Goldeneye Basement | Si "Kain" Cass                   |  |
| Bond 007 Goldeneye Caves    | Goldabar                         |  |
| Bond 007 Goldeneye Complex  | Goldabar                         |  |
| Bond 007 Goldeneye Egyptian | Goldabar                         |  |
| Bond 007 Goldeneye Facility | Goldabar                         |  |
| Bond 007 Goldeneye Stack    | Si "Kain" Cass                   |  |
| Bond 007 Goldeneye Temple   | Si "Kain" Cass                   |  |
| Bond 007 Goldeneye Stack    | Si "Kain" Cass                   |  |
| Coagulate                   | Ken ''DrunKenobi'' Lynch         |  |
| Cold-Steel-Pressure         | Rich 'Akuma' Eastwood            |  |
| Core                        | Ken ''DrunKenobi'' Lynch         |  |
| Damnation                   | Eric "Ebolt" Boltjes             |  |
| Depot                       | Eric "Ebolt" Boltjes             |  |
| Dust                        | Cliff "CliffyB" Bleszinski       |  |
| Extortion                   | David 'DavidM' Münnich           |  |
| Flux                        | Glowing Angel                    |  |
| Gearbox                     | Cliff "CliffyB" Bleszinski       |  |
| Girder                      | Cliff "CliffyB" Bleszinski       |  |
| Google                      | Cliff "CliffyB" Bleszinski       |  |
| Halberd Castle              | Warren Marshall                  |  |
| Hood                        | Ken ''DrunKenobi'' Lynch         |  |
| Industrial                  | Warren Marshall                  |  |
| Infernal                    | Eric "Ebolt" Boltjes             |  |
| Instinct                    | Eric "Ebolt" Boltjes             |  |
| Loathing                    | Ken ''DrunKenobi'' Lynch         |  |
| Melnori                     | David 'DavidM' Münnich           |  |
| Nebula                      | Warren Marshall                  |  |
| Neo-Tokyo                   | Rich 'Akuma' Eastwood            |  |
| Outskirts                   | Warren Marshall                  |  |
| Paladin                     | Cliff "CliffyB" Bleszinski       |  |
| Pantheon                    | Warren Marshall                  |  |
| PS2_Brickyard               | Ken ''DrunKenobi'' Lynch         |  |
| PS2_Coagulate               | Ken ''DrunKenobi'' Lynch         |  |
| PS2_Coagulate               | Ken ''DrunKenobi'' Lynch         |  |
| PS2_Core                    | Ken ''DrunKenobi'' Lynch         |  |
| PS2_Hood                    | Ken ''DrunKenobi'' Lynch         |  |
| PS2_Loathing                | Ken ''DrunKenobi'' Lynch         |  |
| PS2_Sorayama                | Ken ''DrunKenobi'' Lynch         |  |
| Q2DM1 (The Edge)            | Converted by "VT\|CreepingDeath" |  |
| Sector-9                    | Rich 'Akuma' Eastwood            |  |
| Sorayama                    | Ken ''DrunKenobi'' Lynch         |  |
| Underlord                   | Rich 'Akuma' Eastwood            |  |

### Mutators

| Name                                  | Author                           | Notes                       |
| :------------------------------------ | :------------------------------- | :-------------------------- |
| Map-Vote 3.0.4                        | 'remote administrators to'       | aka `BDBMapVote304`         |
| Fatboy                                | jbP                              | Death is slimming...        |
| Relics                                | Epic Games                       |  |
| Unlimited Ammo                        | Unknown                          |  |

## Adding Content

When adding content to this `freeplay` server image:

* `.unr` (Map files) go in the `dist/content/Maps` directory.
* `.utx` (Texture and materials) go in the `dist/content/Textures` directory.
* `.uax` (Sound files) go in the `dist/content/Sounds` directory.
* `.umx` (Music files) go in the `dist/content/Music` directory.
* `.int`, `.u`, `.ini` go in the `dist/content/System` directory.
  * `.ini` files are configuration files.
  * `.int` files are package loaders.
  * `.u` files are compiled UnrealScript classes, often containing other resources like sounds or textures.

Other content types:

`.uc` - UnrealScript source code.
`.umod` files - These are self-installing packages that can be used to install mods and content.
`.uz` / `.uz2` - These are compressed versions of package files for faster downloads, and go on the 'HTTP fast downloads' server.

## Getting Started with Game Servers in Docker

[Docker](https://docs.docker.com/) is an open-source project that bundles applications into lightweight, portable, self-sufficient containers. For a crash course on running Dockerized game servers check out [Using Docker for Game Servers](https://github.com/LacledesLAN/README.1ST/blob/master/GameServers/DockerAndGameServers.md). For tips, tricks, and recommended tools for working with Laclede's LAN Dockerized game server repos see the guide for [Working with our Game Server Repos](https://github.com/LacledesLAN/README.1ST/blob/master/GameServers/WorkingWithOurRepos.md). You can also browse all of our other Dockerized game servers: [Laclede's LAN Game Servers Directory](https://github.com/LacledesLAN/README.1ST/tree/master/GameServers).
