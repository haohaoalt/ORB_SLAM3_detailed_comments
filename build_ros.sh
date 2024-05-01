echo "Building ROS nodes"

# 打印更新前的 ROS_PACKAGE_PATH
echo "ROS_PACKAGE_PATH: ${ROS_PACKAGE_PATH}"

# 获取当前路径
CURRENT_PATH=$(pwd)

# 函数用于判断软件包是否存在，并更新 ROS_PACKAGE_PATH
update_ros_package_path() {
    export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:${CURRENT_PATH}/Examples/ROS
    echo "Updated ROS_PACKAGE_PATH: ${ROS_PACKAGE_PATH}"
}

# 软件包名称
PACKAGE_NAME="ORB_SLAM3"

# 在报错时手动调用该函数
# 示例：假设在报错时调用 update_ros_package_path 函数
if [ ! -d "$(rospack find ${PACKAGE_NAME} 2>/dev/null)" ]; then
    echo "Error: Package '${PACKAGE_NAME}' not found. Manually updating ROS_PACKAGE_PATH..."
    update_ros_package_path
fi

echo "Building ROS nodes"
cd Examples/ROS/ORB_SLAM3
mkdir build
cd build
cmake .. -DROS_BUILD_TYPE=Release
make -j
