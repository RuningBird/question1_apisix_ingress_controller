# APISIX Ingress Controller Helm Chart

这个项目包含一个用于安装 APISIX Ingress Controller 的 Helm Chart。

## 项目结构

```
.
├── README.md                    # 项目说明文档
└── apisix-ingress-controller/   # Helm Chart 目录
    ├── Chart.yaml              # Chart 定义文件
    ├── README.md               # Chart 使用说明
    ├── values.yaml             # Chart 默认配置值
    ├── charts/                 # 依赖的 Charts
    ├── crds/                   # 自定义资源定义
    │   ├── apisixroute.yaml    # ApisixRoute CRD
    │   └── apisixupstream.yaml # ApisixUpstream CRD
    └── templates/              # Kubernetes 资源模板
        ├── NOTES.txt           # 安装后的提示信息
        ├── _helpers.tpl        # 模板辅助函数
        ├── clusterrole.yaml    # ClusterRole 定义
        ├── clusterrolebinding.yaml # ClusterRoleBinding 定义
        ├── configmap.yaml      # ConfigMap 定义
        ├── deployment.yaml     # Deployment 定义
        ├── service.yaml        # Service 定义
        └── serviceaccount.yaml # ServiceAccount 定义
```

## 快速开始

### 安装 APISIX Ingress Controller

使用以下命令安装 APISIX Ingress Controller：

```bash
helm install my-apisix-ingress-controller ./apisix-ingress-controller
```

### 卸载 APISIX Ingress Controller

使用以下命令卸载 APISIX Ingress Controller：

```bash
helm uninstall my-apisix-ingress-controller
```

## 自定义配置

你可以通过修改 `values.yaml` 文件或使用 `--set` 参数来自定义配置。例如：

```bash
helm install my-apisix-ingress-controller \
  --set config.apisix.adminAPI="http://custom-apisix-admin:9180/apisix/admin" \
  ./apisix-ingress-controller
```

## 更多信息

请参考 `apisix-ingress-controller/README.md` 获取更多关于如何使用这个 Helm Chart 的详细信息。