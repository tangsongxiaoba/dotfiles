# dotfiles

我的机子们的家目录的配置，持续更新中。

## usage

```bash
bash run.sh
```

会将当前文件夹覆盖为 `$HOME/.dotfiles/`，然后自动将 `$HOME/.dotfiles/` 下的所有非隐藏的文件和文件夹链接到家目录下对应的隐藏文件和文件夹。

在 `.ignore` 和 `.ignore.local` 文件中添加的项则不会进行链接。`.ignore.local` 是被 `.gitignore` 忽略了的，因此不会被上传到 Git 中，作为本地配置。