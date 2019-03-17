NODE_VERSION=$1||'8.9.1'
MIRROR_DIR=http://npm.taobao.org/mirrors

# 安装系统软件
yum install deltarpm -y
# 安装 wget/nginx/scp/zip/unzip/bzip2/sshd/witch/sudo
yum install nginx openssh-server openssh-clients bzip2 openssl-server which sudo -y
# 已经有 wget zip unzip nginx
# 安装git及相关库
yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel -y
# fix 'Failed at the pngquant-bin@4.0.0 postinstall script', see at:https://github.com/imagemin/pngquant-bin/issues/78
yum install libpng-devel -y
# 安装 make gcc，node-sass需要
yum install make gcc-c++ -y

# 生成ssh key
ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key \
&& ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key \
&& ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key \
&& ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key
echo -e '
[program:sp-ssh]
command = sh -c "/usr/sbin/sshd -D"
autostart=true
startsecs=3
autorestart=true
startretries=64
' > /etc/supervisord.d/ssh.conf

# 清理缓存
rm -f /var/lib/rpm/__db* && yum clean all

cd /
mkdir -p supervisor/logs workspace/source workspace/nginx/{conf,logs}
chown -R root:root . .* /run /var/log/nginx

# 全局安装nvm
mkdir -p /usr/local/{nvm,node}
sudo -s
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | NVM_DIR=/usr/local/nvm bash
chmod -R 777 /usr/local/nvm
echo -e '
export NVM_DIR=/usr/local/nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# export NPM_CONFIG_PREFIX=/usr/local/node
# export PATH="/usr/local/node/bin:'$PATH'"
' > /etc/profile.d/nvm.sh

# 设置环境
source  ~/.bashrc ~/.bash_profile
export NVM_NODEJS_ORG_MIRROR=${MIRROR_DIR}/node
export SQLITE3_BINARY_SITE=${MIRROR_DIR}/sqlite3
nvm install v${NODE_VERSION}
nvm use v${NODE_VERSION}
nvm cache clear
npm config set registry https://registry.npm.taobao.org
npm i yarn pm2 -g
npm cache clean --force
echo -e "\
phantomjs_cdnurl='${MIRROR_DIR}'/phantomjs/\n\
sass_binary_site='${MIRROR_DIR}'/node-sass/\n\
electron_mirror='${MIRROR_DIR}'/electron/\n\
chromedriver_cdnurl='${MIRROR_DIR}'/chromedriver/\n\
operadriver_cdnurl='${MIRROR_DIR}'/operadriver/\n\
profiler_binary_host_mirror='${MIRROR_DIR}'/node-inspector/\n\
npm_config_profiler_binary_host_mirror='${MIRROR_DIR}'/node-inspector/\n\
" >> ~/.npmrc
