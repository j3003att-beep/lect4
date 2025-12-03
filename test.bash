#!/bin/bash
# SPDX-FileCopyrighitText: 2022 Ryuichi Ueda
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

# 「あ」など数字以外が入ったらエラーが起きるのが正しい
echo "あ" | ./plus >/dev/null 2>&1
[ "$?" = "1" ] || ng ${LINENO}

# 出力は空であるべき
out=$(echo "あ" | ./plus 2>/dev/null)
[ "${out}" = "" ] || ng ${

