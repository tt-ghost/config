# EFE基础镜像

## 已装常用应用

|应用|描述|
|---|---|
|nginx||
|nvm|node版本管理工具|
|node||
|npm||
|yarn||
|pm2||

## 常用配置

- `node` 默认版本 `8.9.1`
- `npm` regisitry已指向滴滴内部镜像 `https://registry.npm.taobao.org`
- `npm` 部分依赖包指向taobao仓库，具体请查看 `~/.npmrc`

## 重要目录

```
|-- ...
|-- logs                     // 默认已创建，已挂载到宿主机的物理硬盘上，如果需要自定义日志采集，可以在此目录下创建相关子目录，并将日志放到此处
|   |-- nginx                // 默认未创建，若创建需要同时修改nginx日志目录
|       |-- error.log
|       `-- access.log
`-- workspace
    |-- source
    `-- nginx
        |-- logs
        `-- conf
```

- `/logs` 此为自定义日志采集日志目录，目前 nginx 日志放在 `/workspace/nginx/logs` 下，有 `access.log` 和 `error.log`
- `/workspace` 项目目录，可以在此目录中创建新目录用于站点根目录，如 `/workspace/prod`
- `/workspace/nginx/conf` nginx 默认已创建，自定义配置目录
- `/workspace/nginx/logs` nginx 默认未创建，日志目录
- `/workspace/source` 默认未创建，推荐业务部署相关信息放到此目录中


## 典型前端项目示例

- 第一步：前端项目大致如下
```
.
├── build.sh
├── deploy
│   ├── Dockerfile
│   ├── init.sh
│   ├── nginx-prod.conf
│   ├── nginx-test.conf
│   ├── nginx.conf
│   ├── start.conf
│   └── start.sh
├── dist
├── elevate
├── node_modules
├── package.json
├── src
└── ...
```

