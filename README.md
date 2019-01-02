## dotfiles 列表 ##
- .pip
- .tmux.conf
- .pluginrc
- .vimrc
- .zshrc

## 依赖列表 ##
- git      >=2.13.1
- curl     >=7.55.1
- wget     >=1.12
- zsh    >=4.3.11
- [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)    其中集成tmux,autojump 等插件功能
- [pyenv](https://github.com/pyenv/pyenv#basic-github-checkout)  1.2.7-3-g5603eb51
- pip   >=10.0.1 from $HOME/.pyenv/versions/3.6.6/lib/python3.6/site-packages/pip (python 3.6)
- ctags  >=Exuberant Ctags 5.8
- autojump >=release-v19
- tmux 
***

## [更新yum源](https://yq.aliyun.com/ziliao/408380) ##
  1. 使用阿里云yum源
  2. sudo yum update

## [安装zsh](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH) ##
1. `zsh --version` 查看版本是否高于4.3.11，如果已经安装则ok
2. `sudo yum -y install zsh` yum安装zsh
3. `cat /etc/shells`  `zsh --version` 查看zsh 5.1.1已经安装成功
4. `chsh -s $(which zsh)`  使zsh为默认的shell
5. `echo $SHELL` 输出 `/bin/zsh`

## 安装oh-my-zsh ##
- `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
- `sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"`

## 安装pyenv ##

1. `git clone https://github.com/pyenv/pyenv.git ~/.pyenv`
2. ```
	echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
	echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
	echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc
	exec "$SHELL"
   ```

3. install virtualenv plugin

    ```shell
	git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
	echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
	exec "$SHELL"
    ```

4. 安装3.6.6版本
    `pyenv install 3.6.6`

## [git运行配置](https://git-scm.com/book/zh/v2/) ##

1. 安装git
   `sudo yum install git`
2. 配置git
   - 针对当前用户，编辑~/.gitconfig文件
   - 针对当前仓库编辑 .git/config
