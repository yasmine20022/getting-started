FROM node:20-slim
WORKDIR /app
COPY package*.json ./
RUN yarn install
EXPOSE 8000
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD curl --fail http://localhost:8000 || exit 1
USER 1001
CMD ["mkdocs", "serve", "-a", "0.0.0.0:8000"]