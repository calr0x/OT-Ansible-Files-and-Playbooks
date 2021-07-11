#!/bin/bash

sed -i 's|#SystemMaxUse=|SystemMaxUse=50M|' /etc/systemd/journald.conf