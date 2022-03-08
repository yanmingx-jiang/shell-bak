#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os,subprocess
# 导入CSV安装包
import csv
import time
# import sh
# import codecs
rmrf = subprocess.Popen("ssh root@192.168.10.2 'rm -rf *.fio' && ssh root@192.168.10.3 'rm -rf *.fio' && ssh root@192.168.10.4 'rm -rf *.fio'", shell=True, stdout=subprocess.PIPE)
print(rmrf.stdout.read())
scpout = subprocess.Popen("scp -r *.fio root@192.168.10.2:~  && scp -r *.fio root@192.168.10.3:~ ", shell=True, stdout=subprocess.PIPE)
print(scpout.stdout.read())
cpuset = subprocess.Popen("ssh root@192.168.10.2 'cpupower frequency-set -g performance' && ssh root@192.168.10.3 'cpupower frequency-set -g performance' && ssh root@192.168.10.4 'cpupower frequency-set -g performance'", shell=True, stdout=subprocess.PIPE)
print(cpuset.stdout.read())
synclin = subprocess.Popen("ssh root@192.168.10.2 '/usr/bin/sync; /usr/bin/echo 3 > /proc/sys/vm/drop_caches' && ssh root@192.168.10.3 '/usr/bin/sync; /usr/bin/echo 3 > /proc/sys/vm/drop_caches' && ssh root@192.168.10.4 '/usr/bin/sync; /usr/bin/echo 3 > /proc/sys/vm/drop_caches' ", shell=True, stdout=subprocess.PIPE)
print(synclin.stdout.read())

node1 = subprocess.Popen("ssh root@192.168.10.2 'fio seq-read-libaio.fio' > out/node1-seq-read.fio.out 2>&1 &", shell=True, stdout=subprocess.PIPE)

node2 = subprocess.Popen("ssh root@192.168.10.3 'fio seq-read-libaio.fio' > out/node2-seq-read.fio.out 2>&1 &", shell=True, stdout=subprocess.PIPE)

# node3 = subprocess.Popen("ssh root@192.168.10.4 'fio seq-read-libaio.fio' > out/node3-seq-read.fio.out 2>&1 &", shell=True, stdout=subprocess.PIPE)

dstatout= subprocess.Popen("ssh root@192.168.10.2 'dstat -tcmynd -D total,sda,sdb,sdc,sdd,sde,sdf,sdg,nvme0n1 | tee ~/seq-read-dstat.txt 2>&1 &'", shell=True, stdout=subprocess.PIPE)

time.sleep(350)
killdstat = subprocess.Popen("ssh root@192.168.10.2 'kill -9 $(ps aux|grep dstat|grep -v grep|awk '\''{print $2}'\''|sed 1d)'", shell=True, stdout=subprocess.PIPE)
print(killdstat.stdout.read())
killdstat1 = subprocess.Popen("ssh root@192.168.10.2 'kill -9 $(ps aux|grep dstat|grep -v grep|awk '\''{print $2}'\'') '", shell=True, stdout=subprocess.PIPE)
print(killdstat1.stdout.read())
scp = subprocess.Popen("scp root@192.168.10.2:~/seq-read-dstat.txt /home/workspace/ceph/3node/test0304/out", shell=True, stdout=subprocess.PIPE)
print(scp.stdout.read())
# print(killdstat.stdout.read())
# for num in aaa:
#     print (num)
#     print(type(num))
# print(type(aaa)) #list
print("fin")


# 1. 创建文件对象
# f = open('top.csv','w',encoding='utf-8-sig',newline='')

# # 2. 基于文件对象构建 csv写入对象
# csv_writer = csv.writer(f)

# # 3. 构建列表头
# csv_writer.writerow(["姓名","年龄","性别"])

# # 4. 写入csv文件内容
# # for num in aaa:
# #     print (num)
# #     print(type(num))
# #     csv_writer.writerow(["l",'18',str(num)])
# csv_writer.writerow(["l",'18',bbb])
# csv_writer.writerow(["c",'20','男'])
# csv_writer.writerow(["w",'22','女'])

# # 5. 关闭文件
# f.close()

# if __name__ == "__main__":
#     file_name = "data.csv"
#     with open(file_name, "wb") as f:
#         f.write(codecs.BOM_GBK)
#         csv_write = csv.writer(f)
#         csv_write.writerows([["姓名", "年龄"], ["张三", 18]])