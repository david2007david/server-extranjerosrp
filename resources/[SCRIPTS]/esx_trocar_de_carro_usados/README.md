# esx_trocar_de_carro_usados
Com este script você pode vender um veículo para outra pessoa.
Você só precisa de um contrato no seu inventário.
Não há transação de dinheiro incluída.
É apenas um script simples para mudar o proprietário de um veículo

### Requisitos
Essa ordem também se aplica na ordem de inicialização.
- Base events
- [mysql-async](https://github.com/brouznouf/fivem-mysql-async/releases/latest)
- [EssentialMode](https://essentialmode.com/) (es_admin2 included, a basic admin tool)
- [esplugin_mysql](https://forum.fivem.net/t/release-essentialmode-base/3665/1181)
- [async](https://github.com/ESX-Brasil/async)

### Download e Instalação

### Usando [fvm](https://github.com/qlaffont/fvm-installer)
```
fvm install --save --folder=essential esx-brasil/esx_trocar_de_carro_usados
```

### Usando Git

```
cd resources
git clone https://github.com/ESX-Brasil/esx_trocar_de_carro_usados [esx]/esx_trocar_de_carro_usados
```

### Manualmente
- Download https://github.com/ESX-Brasil/esx_trocar_de_carro_usados
- Coloque-o no diretório `resource/[esx]`

## Instalação
- Importar `br_contrato.sql` ou `en_contrato.sql` para seu banco de dados
- Configure seu `server.cfg` para se parecer com isso

```
start esx_trocar_de_carro_usados
```

# Discord

[![Join ESX Brasil](https://discordapp.com/api/guilds/432980396070666250/embed.png?style=banner2)](https://discord.gg/8zGbh3T)


# Legal
### License
esx_trocar_de_carro_usados - ESX for FiveM

Copyright (C) 2015-2018 ESX-Brasil

This program Is free software: you can redistribute it And/Or modify it under the terms Of the GNU General Public License As published by the Free Software Foundation, either version 3 Of the License, Or (at your option) any later version.

This program Is distributed In the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty Of MERCHANTABILITY Or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License For more details.

You should have received a copy Of the GNU General Public License along with this program. If Not, see http://www.gnu.org/licenses/.
