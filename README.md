### 自用 Redmi AX6（大分区）一键编译

基于 [VIKINGYFY/immortalwrt](https://github.com/VIKINGYFY/immortalwrt.git) `main`，目标机型 **redmi_ax6-stock**，带 NSS 加速。

## Workflows

| Workflow | 说明 |
|----------|------|
| **Build AX6 ImmortalWrt NSS** | 云编译固件 |

设备配置分目录维护：`config/AX6immortalwrt/ax6.config`、`diy/AX6immortalwrt/diy1.sh`、`diy/AX6immortalwrt/diy2.sh`、`files/AX6immortalwrt/`。

## 使用流程

1. **（可选）修改配置**
   - 直接使用仓库内现成的 `config/AX6immortalwrt/ax6.config` 即可编译，无需改动。
   - 需要调整插件或内核选项时，本地编辑 `config/AX6immortalwrt/ax6.config` 并提交。
2. 编译固件：运行 **Build AX6 ImmortalWrt NSS**
3. 在仓库 **Releases** 页面下载最新固件，刷入 **redmi_ax6-stock（大分区）** 机型

## 注意

- NSS 加速默认开启，**不要**在防火墙里额外打开系统硬件/软件流量分载，容易冲突。
- 大流量时 CPU 占用很低，说明 NSS 在起作用。
- 构建顺序是先执行 `diy/AX6immortalwrt/diy1.sh` 登记 DDNSTO 的 `nas` feed，再运行 `./scripts/feeds update -a` 和 `./scripts/feeds install -a`，最后执行 `diy/AX6immortalwrt/diy2.sh`；workflow 已按此顺序执行。
- 附加插件以 `config/AX6immortalwrt/ax6.config` 的选择为准；DDNSTO 使用额外 `nas` feed，`diy/AX6immortalwrt/diy2.sh` 使用上游 OpenAppFilter、aguowork 版 WeChatPush，并在 LuCI feed 缺少 AdGuard Home 时才添加备用源码。
- 默认 LAN 管理地址为 `192.168.31.1`，主机名为 `Redmi-AX6`。
- 自编译固件（自定义内核/NSS）**不建议**使用官方在线源安装 kmod 等内核相关包，容易 ABI 不匹配。

## opkg 软件源

若 **更新列表** 提示 `Signature check failed`：进入 **系统 → 软件包 → 配置**，注释或删除 `option check_signature` 后重试。

关闭签名校验有安全风险；不要用在线源安装 kmod，避免内核 ABI 不匹配。


![image](https://github.com/user-attachments/assets/89a32e90-f5e1-4f46-9d54-9ba8c6e85f9e)
![微信截图_20241116071804](https://github.com/user-attachments/assets/502012e5-83d0-4e4b-be8b-a53c1edd0f8b)
