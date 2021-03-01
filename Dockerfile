FROM python:3.6
COPY . /src
WORKDIR /src
RUN pip install -U pip && rm -rf ~/.cache/pip
RUN pip install -r requirements.txt && rm -rf ~/.cache/pip
# Install Baidu SDK
RUN cd baidu_sdk && pip install .
# Install Spacy model
RUN python -m spacy download en_core_web_sm

EXPOSE 8000

CMD python demo.py
