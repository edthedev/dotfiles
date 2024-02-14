
```pwsh

# Install ipykernel at user level
pip install -U ipykernel

# Tell git to clean data out before committing a notebook
cp ~/dotfiles/files/gitattributes ~/.gitattributes
```

Did not work

```pwsh
# Create VirtualEnv
python -m venv ~/venvs/jupyter
./venvs/jupyter/Scripts/activate
pip install ipykernel

# Tell jupyter about our virtualenv
cd ~/venvs/jupyter
python -m ipykernel install --user --name=jupyter
```
