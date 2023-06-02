cd ..
git add .
git commit -m "last"
git push
cd playbooks
ansible-playbook -i ./inventory/hosts ./push.yml