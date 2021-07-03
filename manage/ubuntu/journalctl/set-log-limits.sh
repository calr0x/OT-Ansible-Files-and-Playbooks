#!/bin/bash

sed -i 's|#SystemMaxUse=|SystemMaxUse=150M|' /etc/systemd/journald.conf