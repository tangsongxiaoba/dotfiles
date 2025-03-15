# dotfiles

我的机子们的家目录的配置，持续更新中。

## usage

```bash
bash run.sh
```

会将当前文件夹复制到 `$HOME/.dotfiles/`（覆盖），然后自动将 `$HOME/.dotfiles/` 下的所有非隐藏的文件和文件夹链接到家目录下对应的隐藏文件和文件夹。

在 `.ignore` 和 `.ignore.local` 文件中添加的项则不会进行链接。`.ignore.local` 是被 `.gitignore` 忽略了的，因此不会被上传到 Git 中，作为本地配置。

在链接文件夹的过程中会先检查该文件夹下是否有 `init.sh`，若有则会先执行再链接。目前这个做法是为了给 `bin/` 目录下的可执行文件赋予可执行权限。
