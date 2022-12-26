chmod 0644 adjust_brightness.service
sudo mv adjust_brightness.service /etc/systemd/system/
sudo systemctl enable adjust_brightness.service
sudo systemctl start adjust_brightness.service
