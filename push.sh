#!/bin/bash

# 记账 App 隐私政策 - GitHub 推送脚本

echo "🚀 准备推送隐私政策到 GitHub..."
echo ""

# 检查是否在正确的目录
if [ ! -f "privacy-policy.html" ]; then
    echo "❌ 错误：请在 smart-accounting-privacy 目录下运行此脚本"
    exit 1
fi

# 检查是否已配置远程仓库
if ! git remote get-url origin > /dev/null 2>&1; then
    echo "📝 配置远程仓库..."
    echo "请输入你的 GitHub 用户名（默认：steven6143）："
    read -r username
    username=${username:-steven6143}

    git remote add origin "https://github.com/$username/smart-accounting-privacy.git"
    echo "✅ 远程仓库已配置"
    echo ""
fi

# 显示当前状态
echo "📊 当前状态："
git status --short
echo ""

# 推送到 GitHub
echo "🔄 推送到 GitHub..."
echo ""
echo "⚠️  如果提示输入密码，请使用 Personal Access Token"
echo "   获取 Token：https://github.com/settings/tokens"
echo ""

git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ 推送成功！"
    echo ""
    echo "🌐 你的隐私政策将在 1-2 分钟后可以访问："
    echo "   https://steven6143.github.io/smart-accounting-privacy/privacy-policy.html"
    echo ""
    echo "📝 下一步："
    echo "   1. 访问上面的 URL 确认页面正常显示"
    echo "   2. 在 App Store Connect 中填写隐私政策 URL"
    echo "   3. 完成 App 隐私详情配置"
    echo ""
else
    echo ""
    echo "❌ 推送失败"
    echo ""
    echo "💡 可能的原因："
    echo "   1. 需要 Personal Access Token（不能使用密码）"
    echo "   2. 仓库尚未在 GitHub 上创建"
    echo "   3. 网络连接问题"
    echo ""
    echo "📖 请查看 部署指南.md 获取详细帮助"
    echo ""
fi
