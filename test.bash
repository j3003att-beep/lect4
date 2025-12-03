#!/bin/bash
# SPDX-FileCopyrightText: 2022 Ryuichi Ueda
# SPDX-License-Identifier: BSD-3-Clause

ng(){
    echo NG at Line $1
    res=1
}

res=0

### I/O TEST ###

out=$(seq 5 | ./plus)
[ "${out}" = "15.0" ] || ng ${LINENO}

### STRANGE INPUT ###

# 数字以外 → エラー終了
echo "あ" | ./plus >/dev/null 2>&1
[ "$?" = "1" ] || ng ${LINENO}

# 出力は空であるべき
out=$(echo "あ" | ./plus 2>/dev/null)
[ "${out}" = "" ] || ng ${LINENO}

### EMPTY INPUT ###

# 空行入力 → エラー終了
out=$(echo | ./plus 2>/dev/null)
[ "$?" = "1" ] || ng ${LINENO}
[ "${out}" = "" ] || ng ${LINENO}

### RESULT ###
[ "$res" = "0" ] && echo OK
exit $res
