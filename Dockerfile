FROM myoung34/github-runner:ubuntu-jammy

RUN cd /tmp && wget https://github.com/future-architect/vuls/releases/download/v0.23.2/vuls_0.23.2_linux_amd64.tar.gz \
  && tar zxvf vuls_0.23.2_linux_amd64.tar.gz -C /tmp \
  && mv /tmp/vuls /usr/local/bin/vuls \
  && chmod +x /usr/local/bin/vuls \
  && wget https://github.com/sclevine/yj/releases/download/v5.1.0/yj-linux-amd64 \
  && mv /tmp/yj-linux-amd64 /usr/local/bin/yj \
  && chmod +x /usr/local/bin/yj \
  && wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | sudo apt-key add - \
  && echo "deb https://packages.cloudfoundry.org/debian stable main" | sudo tee /etc/apt/sources.list.d/cloudfoundry-cli.list \
  && apt update -y \
  && apt install -y fping nginx jq ldap-utils python3-openstackclient cf8-cli \
  && apt purge -y nodejs \
  && apt autoremove -y \
  && curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - \
  && apt install -y nodejs \
  && apt update -y \
  && apt upgrade -y \
  && rm -rf /tmp/*
