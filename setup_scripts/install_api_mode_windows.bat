if which node > /dev/null
    then
    echo "node is installed, skipping..."
    else
    echo "# Make sure node version > 12 is installed"
fi
cd ..
pip install torch==1.7.0+cpu torchvision==0.8.1+cpu -f https://download.pytorch.org/whl/torch_stable.html
python setup.py install
pushd .
if not exist %userprofile%\.alternat mkdir %userprofile%\.alternat
cd  %userprofile%\.alternat 
npm install apify 
popd
cd api
uvicorn message_processor:app --port 8080 --host 0.0.0.0 --reload 2>&1 | tee -a log.txt
