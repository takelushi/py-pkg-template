FROM gitpod/workspace-full

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
RUN echo 'source $HOME/.poetry/env' >> /home/gitpod/.bashrc

# RUN pyenv install 3.8.10
# ENV PIPENV_VENV_IN_PROJECT=1
ENV PATH="${PATH}:/home/gitpod/.poetry/bin"
ENV PIP_USER=false
RUN poetry config virtualenvs.in-project true
