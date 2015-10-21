include:
  - node

packages:
  npm.installed:
    - pkgs:
      - coffee-script
      - bower
      - less
    - require:
      - pkg: nodejs
