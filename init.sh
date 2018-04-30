echo 'Create links, remove default config from /etc/nginx/sites-enabled/default'
sudo ln -sf /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/test.conf
sudo rm /etc/nginx/sites-enabled/default 2> /dev/null
sudo ln -sf /home/box/web/etc/nginx.conf /etc/nginx/sites-available/test.conf
sudo rm /etc/nginx/sites-available/default 2> /dev/null
echo 'creare symbolic links to gunicorn configs'
sudo -s ln -sf /home/box/web/etc/hello.py  /etc/gunicorn.d/hello.py
#sudo -s ln -sf /home/box/web/etc/django-gunicorn.conf  /etc/gunicorn.d/django-gunicorn.conf
sudo /etc/init.d/nginx restart
sudo ln -sf /home/box/web/etc/gunicorn.conf /etc/gunicorn.d/test
sudo /etc/init.d/gunicorn restart
sudo /etc/init.d/mysql start
echo 'Done'
exit