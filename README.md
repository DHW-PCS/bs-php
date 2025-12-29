# Blessing Skin PHP 镜像

用于搭配 Caddy 运行 Blessing Skin 的 PHP 镜像。容器内工作目录为 `/bs`。

## Caddyfile 和 Compose 示例

Caddyfile
``` 
bs.yourdomain.org {
    root * /bs/public   
    encode gzip
    php_fastcgi bs:9000
    file_server
    try_files {path} {path}/ /index.php?{query}
}
```

Docker Compose
``` yaml
services:
  bs:
    image: ghcr.io/dhw-pcs/bs-php:latest
    restart: always
    container_name: bs
    volumes:
      - ./app:/bs
    depends_on:
      - db
  caddy:
    image: caddy:latest
    container_name: caddy
    restart: always
    ports:
      - 80:80
      - 443:443
      - 443:443/udp
    volumes:
      - ./app:/bs
    depends_on:
      - bs
```

## 许可

本项目采用 GPL-3.0 许可证，详情见 [LICENSE](LICENSE)。
