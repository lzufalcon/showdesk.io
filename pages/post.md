---
title: 我的
tagline: 录制并分享我的视频
layout: page
group: navigation
highlight: true
permalink: /post/
order: 30
---

[桌面秀][1]是一个开源项目，致力于更便捷地分享技术学习和操作过程。

它提供了配套的桌面会话录制工具和回放工具，从而轻松录制，即时分享。

## 录制与回放

### 方案一

基于 [pyvnc2swf][2]，我们添加了 noVNC 输出格式支持。

该工具已经集成进“桌面秀”代码仓库，安装和使用方式如下：

    $ git clone https://github.com/tinyclub/showdesk.io
    $ cd showdesk.io
    $ tools/install.sh

会在桌面创建两个快捷方式，一个为录制工具（noVNC REC），一个为播放器（noVNC Player）。

点击 `noVNC REC` 会自动打开本地 VNC 服务器并启动一个录制界面。可以通过菜单配置`File`（视频存放的文件名），`Title`，`Author`，`Tags` 和 `Description` 等信息。 
之后点击 "Start" 等到按钮变绿后，即可开始录制，录制完成后点击 "Stop"，退出后即可通过 noVNC Player 进行回放，该播放器通过浏览器启动，进入后选择视频列表中最新的一个，点击 Play 即可。视频默认存放在 `recordings/` 目录下。

### 方案二

基于 [noVNC][3]，我们添加了可以通过网页直接录制视频的功能，同样输出为 noVNC 格式。

该功能集成在 Cloud Ubuntu 项目中，下载并使用如下。

首先安装并启动 VNC 代理服务器：

    $ git clone https://github.com/tinyclub/cloud-ubuntu.git
    $ cd cloud-ubuntu/
    $ ./install
    $ ./pull web
    $ ./scripts/vnc-recorder.sh

接着开启一个 VNC 服务器：

    $ ./run base

之后通过 VNC 代理可访问该服务器：

    $ ./login/vnc

默认会自动连接，退出后可通过左侧的设置界面选择 `Record Screen` 并配置 `File`，`Title`，`Author`，`Tags` 和 `Description` 等信息。断开连接后会自动保存视频到 `noVNC/recordings` 目录下。通过左侧的播放按钮可以进到类似“方案一”的播放界面，操作同上。

## 通过桌面秀分享

如果需要分享上述视频，先 [Fork][4] 桌面秀，然后下载自己的仓库到本地，例如：

    $ git clone git@github.com/USER/showdesk.io.git

对上述录制好的视频文件进行必要的重命名，并配置好上述 `File`，`Title`，`Author`，`Tags` 和 `Description`，然后复制到自己代码仓库的 `recordings/` 目录下并执行下述命令自动压缩、拆分并生成会话和视频展示页面：

    $ ls recordings/
    $ tools/update-records.sh

其中压缩或者拆分后的文件存放在 `recordings/`，而会话页面存放在 `sessions/`，视频展示页面存放在 `_posts` 下面。

分享时把这几个文件提交到桌面秀代码仓库，并发起 Pull Request 即可。之后就可以通过会话页面或者视频展示页面进行访问，或者把会话页面嵌入到其他网站中。

会话页面的地址是一串 md5 码，可以在 `sessions/` 下的会话页面中找到 `permalink`，在它的前面追加上 `showdesk.io` 即可。

## 内嵌到博客中

也可以在桌面秀最终生成的视频展示页面中找到这样的内容，可以把它嵌入到任何网站中：

    <iframe src="http://showdesk.io/50bc346f53a19b4d1f813b428b0b7b49/?f=1" width="100%" marginheight="0" marginwidth="0" frameborder="0" scrolling="no" border="0" allowfullscreen></iframe>

如果要自适应视频大小，可以使用 [iframeresizer][5]，在网页中加入如下代码即可：

    <script type="text/javascript" src="https://raw.githubusercontent.com/davidjbradshaw/iframe-resizer/master/js/iframeResizer.min.js"></script>
    <script>
    function resize_iframe() {
        iFrameResize({
                log: false,
                autoResize: true,
                interval: -1,
                minHeight: 300,
                heightCalculationMethod: "lowestElement",
        });
    }

    $(document).ready(function () {
      resize_iframe();
      $('iframe').iframeAutoHeight({debug: false});
    });
    </script>

[1]: https://github.com/tinyclub/showdesk.io
[2]: https://github.com/tinyclub/pyvnc2swf
[3]: https://github.com/novnc/noVNC
[4]: https://github.com/tinyclub/showdesk.io#fork-destination-box
[5]: https://github.com/davidjbradshaw/iframe-resizer
