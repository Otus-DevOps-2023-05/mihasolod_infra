# mihasolod_infra
mihasolod Infra repository

## ДЗ №4.

1. Исследовать способ подключения к someinternalhost в одну команду.

Решение:
```sh
ssh -i appuser -A -t appuser@51.250.3.116 ssh 10.128.0.19
```
2. Предложить вариант решения для подключения из консоли при помощи команды вида ssh someinternalhost из локальной консоли рабочего устройства, чтобы подключение выполнялось по алиасу someinternalhost.

Решение:

Добавить в ~/.ssh/config строки

Host someinternalhost
HostName 10.128.0.19
User appuser
ProxyCommand ssh -A appuser@bastion nc %h %p
```sh
Host bastion
HostName 51.250.3.116
User appuser
```
3. С помощью сервисов sslip.io/xip.io и Let’s Encrypt реализуйте использование валидного сертификата для панели управления VPN-сервера.

Решение:

Реализовано - https://51-250-3-116.sslip.io/

Общее имя (CN)	51-250-3-116.sslip.io
Организация (O)	<Не является частью сертификата>
Подразделение (OU)	<Не является частью сертификата>
Общее имя (CN)	R3
Организация (O)	Let's Encrypt
Подразделение (OU)	<Не является частью сертификата>
Дата выдачи	понедельник, 3 июля 2023 г. в 17:10:46
Срок действия	воскресенье, 1 октября 2023 г. в 17:10:45
Отпечаток SHA-256	E8 06 0B 82 CF 19 EB A6 44 A8 C6 03 3F B6 4E EA
81 97 37 17 E9 BD 09 43 8A 1D 48 2D EE 5B 8C 3F
Отпечаток SHA-1	4C B9 42 4C 9F BC C7 70 00 85 58 01 C0 11 49 98
07 68 46 D2

4. Добавьте в ваш репозиторий Infra (ветка cloud-bastion ):
   - файл setupvpn.sh
   - конфигурационный файл для подключения к VPN

Решение:

Файлы добавлены.

5. Опишите в README.md и получившуюся конфигурацию и данные для подключения.

Решение:
```sh
bastion_IP = 51.250.3.116
someinternalhost_IP = 10.128.0.19
```
## ДЗ №5.
```sh
testapp_IP = 51.250.92.247
testapp_port = 9292
```

Сделан cloud-config.yam для установки пакетов, деплоя приложения и его запуска.
Команда для создания инстанса с уже запущенным приложением.
```sh
yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --metadata-from-file user-data=cloud-config.yaml
```
## ДЗ №6.
Сборка образов VM при помощи Packer
- Сделан базовый шаблон
- Выполнена параметризация
- Сделан bake-образ
- Добавлен скрипт создания ВМ из образа create-reddit-vm.sh
