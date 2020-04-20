# starting with a fastai pytorch image on GCP

jupyter notebook --generate-config
echo "c.NotebookApp.token = ''" >> ~/.jupyter/jupyter_notebook_config.py

mkdir workspace
cd workspace

git clone https://github.com/fastai/nbdev
pip install -e nbdev

git clone https://github.com/fastai/fastcore
cd fastcore
pip install -e ".[dev]"
cd ..

git clone https://github.com/fastai/fastai2
cd fastai2
conda env create -f environment.yml
pip install -e ".[dev]"
source activate fastai2
cd ..

curl https://rclone.org/install.sh | sudo bash

mkdir setup_scripts && cd setup_scripts
wget https://raw.githubusercontent.com/radekosmulski/universe/master/config_scripts/basic.sh && bash basic.sh
wget https://raw.githubusercontent.com/radekosmulski/universe/master/config_scripts/basic_agent_forwarding_required.sh && bash basic_agent_forwarding_required.sh
cd ..

sudo apt install bmon
