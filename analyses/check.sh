mkdir analyses/output/checking

git log | tee analyses/output/checking/master_log.txt

git checkout playground
git log | tee analyses/output/checking/playground_log.txt

git checkout master