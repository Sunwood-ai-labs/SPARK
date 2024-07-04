FROM python:3.12-slim

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Poetry のインストール
RUN curl -sSL https://install.python-poetry.org | python3 -

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"


# 作業ディレクトリの設定
WORKDIR /app

# Poetry の設定
ENV PATH="/root/.local/bin:$PATH"
# RUN poetry config virtualenvs.create false
RUN poetry config virtualenvs.in-project true
