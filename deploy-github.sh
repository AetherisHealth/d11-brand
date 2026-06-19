#!/bin/bash
set -e

echo "╔══════════════════════════════════════════════════════╗"
echo "║     D11 第十一区品牌官网 · GitHub Pages 部署脚本     ║"
echo "╚══════════════════════════════════════════════════════╝"
echo ""

# 检查是否有 GitHub 用户名配置
if git config --global user.name > /dev/null 2>&1; then
    DEFAULT_USER=$(git config --global user.name)
    read -p "GitHub 用户名（默认: $DEFAULT_USER）: " GITHUB_USER
    GITHUB_USER=${GITHUB_USER:-$DEFAULT_USER}
else
    read -p "你的 GitHub 用户名: " GITHUB_USER
fi

if [ -z "$GITHUB_USER" ]; then
    echo "❌ 错误：需要提供 GitHub 用户名"
    exit 1
fi

read -p "仓库名（默认: d11-brand）: " REPO
REPO=${REPO:-d11-brand}

echo ""
echo "正在部署到 GitHub..."
echo ""

# 确保远程仓库配置正确
git remote remove origin 2>/dev/null || true
git remote add origin "https://github.com/$GITHUB_USER/$REPO.git" 2>/dev/null || git remote set-url origin "https://github.com/$GITHUB_USER/$REPO.git"

# 推送代码
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ 代码已成功推送到 GitHub！"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "📦 仓库地址: https://github.com/$GITHUB_USER/$REPO"
    echo ""
    echo "下一步：开启 GitHub Pages"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "1. 打开: https://github.com/$GITHUB_USER/$REPO/settings/pages"
    echo ""
    echo "2. 在 'Source' 部分选择:"
    echo "   ✅ Deploy from a branch"
    echo ""
    echo "3. 选择:"
    echo "   Branch: main"
    echo "   Folder: / (root)"
    echo ""
    echo "4. 点击 'Save'"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "⏱  约 2 分钟后，网站将在以下地址上线："
    echo ""
    echo "   🌐 https://$GITHUB_USER.github.io/$REPO/"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "💡 如需绑定自定义域名（如 d11.com）："
    echo "   在 Pages 设置页面添加 'Custom domain' 即可"
    echo ""
    echo "💡 如需修改产品："
    echo "   编辑 products.json → git commit → git push"
    echo "   网站会自动更新（约 1-2 分钟）"
    echo ""
else
    echo ""
    echo "❌ 推送失败。可能原因："
    echo "   1. GitHub 仓库 '$REPO' 尚未创建"
    echo "   2. 需要 GitHub 认证（建议使用 Personal Access Token）"
    echo ""
    echo "请先在 GitHub 创建仓库，然后重试。"
    echo "   创建地址: https://github.com/new?name=$REPO"
    echo ""
fi
