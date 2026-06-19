# D11 第十一区品牌官网 · 部署指南

这是一个完整的静态网站，包含 HTML、CSS、产品图片和 JSON 数据文件。支持数据驱动，修改 `products.json` 即可更新产品信息。

---

## 方案一：Netlify Drop（最快，2 分钟上线）

**适合：** 快速上线、不想注册域名、需要永久链接

1. 打开 https://app.netlify.com/drop
2. 把 `d11-brand.zip` 文件直接拖进去
3. 等待 3 秒，获得 `xxx.netlify.app` 永久链接
4. 可选：在 Netlify 设置里绑定自定义域名

**优点：** 零配置、全球 CDN、HTTPS 自动、永久免费
**缺点：** 大陆访问可能较慢

---

## 方案二：GitHub Pages（最正式，推荐）

**适合：** 长期使用、需要自定义域名、品牌官网

1. 在 GitHub 创建新仓库（如 `d11-brand`）
2. 把本地代码 push 到仓库：
   ```bash
   git remote add origin https://github.com/你的用户名/d11-brand.git
   git push -u origin main
   ```
3. 进入仓库 Settings → Pages → 选择 Branch: main → 保存
4. 访问 `https://你的用户名.github.io/d11-brand/`
5. 可选：绑定自定义域名（如 `d11.com`），在 Pages 设置里添加即可

**优点：** 免费永久、支持自定义域名、版本管理
**缺点：** 大陆访问可能被墙或慢

---

## 方案三：Gitee Pages（国内访问快）

**适合：** 主要客户在大陆

1. 在 Gitee 创建新仓库（如 `d11-brand`）
2. 把代码 push 到 Gitee
3. 开启 Gitee Pages 服务
4. 获得 `xxx.gitee.io/d11-brand` 链接

**优点：** 大陆访问快、国内 CDN
**缺点：** 海外访问可能慢、需要实名认证

---

## 方案四：双轨部署（全球覆盖，推荐）

同时部署到两个平台，客户根据地区自动选择：

| 地区 | 访问地址 |
|------|---------|
| 海外 | `https://xxx.github.io/d11-brand/` |
| 国内 | `https://xxx.gitee.io/d11-brand/` |

---

## 后续维护（修改产品）

只需要编辑 `products.json` 文件，然后重新部署：

```json
{
  "name": "产品名称",
  "image": "products/图片文件名.jpg",
  "taobaoUrl": "https://item.taobao.com/item.htm?id=xxxxx",
  ...
}
```

- 换图片：替换 `products/` 目录下的文件，同步修改 `products.json` 中的 `image` 路径
- 改价格：修改 `products.json` 中的 `price`
- 改淘宝链接：修改 `products.json` 中的 `taobaoUrl`

---

## 文件结构

```
d11-brand/
├── d11-brand.html      # 主页面（入口文件）
├── logo.png              # 品牌 Logo
├── products.json         # 产品数据配置（修改此文件更新产品）
├── products/             # 产品图片文件夹
│   ├── yl_green_sweater.jpg
│   ├── hy_collar.jpg
│   └── ... (14 张产品图)
└── DEPLOY.md             # 本部署指南
```

---

## 技术栈

- 纯 HTML + CSS + JavaScript（无框架依赖）
- 数据驱动：`fetch('products.json')` 动态渲染产品卡片
- 图片使用相对路径，支持任意静态托管平台

---

## 常见问题

**Q：图片显示不出来？**
A：检查图片路径是否正确（区分大小写），确保 `products/` 目录和 HTML 文件在同一目录下。

**Q：淘宝链接打不开？**
A：修改 `products.json` 中的 `taobaoUrl`，替换为正确的淘宝商品链接。

**Q：如何添加新产品？**
A：在 `products.json` 中追加新的 JSON 对象，确保格式和已有产品一致。图片放入 `products/` 目录，路径写入 `image` 字段。

---

部署完成后，建议把 `d11-brand.zip` 作为备份保存。祝部署顺利！
