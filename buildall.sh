#!/bin/bash
set -eo pipefail

# 获取脚本所在的根目录
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "======================================"
echo "开始批量构建 Docker 镜像"
echo "根目录: ${ROOT_DIR}"
echo "======================================"
echo ""

# 查找所有的 build.sh 文件（排除 buildall.sh 和 buildAll.sh）
find "${ROOT_DIR}" -type f -name "build.sh" | while read -r build_script; do
    # 获取 build.sh 所在的目录
    build_dir="$(dirname "${build_script}")"
    
    echo "--------------------------------------"
    echo "发现构建脚本: ${build_script}"
    echo "切换目录到: ${build_dir}"
    echo "--------------------------------------"
    
    # 切换到 build.sh 所在目录并执行
    cd "${build_dir}"
    
    # 执行构建脚本
    if bash build.sh; then
        echo "✅ 构建成功: ${build_script}"
    else
        echo "❌ 构建失败: ${build_script}"
        # 可以选择继续或退出，这里选择继续
         exit 1
    fi
    
    echo ""
done

echo "======================================"
echo "批量构建完成！"
echo "======================================"
