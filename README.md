# Rime.HK

用一條 Script 幫你 Set 好喺 Rime 用嘅「倉頡撈粵拼」。

## 功能特色

1. 兼容倉頡三代同五代，三代打慣手勢同五代變合理嘅碼都用得。
2. 將 rime-cangjie 字表裡面 Display 唔到嘅生僻字剷哂，揀字嘅時候唔會一堆正方形。
3. 唔需要轉輸入法就可以直接用粵拼打字。
4. 用粵拼嘅時候要用完整拼音，可以打多過一個字搵詞語。

## 安裝方法

1. 自己裝咗 Rime 先。
   * MacOS: [Squirrel](https://github.com/rime/squirrel)
   * Linux: [ibus-rime](https://github.com/rime/ibus-rime)
2. 喺 Terminal 打 `./install.sh`。
3. 重新部署 Rime 輸入法。

## 重碼問題

雖然呢個 Config 已經將重碼字嘅次序固定咗，但係字表裡面嘅次序未必同過去沿用廿幾年嘅次序完全一致，同時原本嘅次序亦有將更常用嘅字排咗去後面嘅情況，目前打算用以下準則慢慢改善：

1. 盡量將常用啲嘅字排最前。
2. 如果重碼嘅兩個字差唔多常用，會遵從[原本](http://input.foruto.com/cccl/cccl_article015.htm)嘅排位。
3. 生僻字唔理。
