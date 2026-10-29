FROM node:26-bookworm-slim AS builder

WORKDIR /app

ENV NEXT_TELEMETRY_DISABLED=1

# npmで依存関係をインストール
COPY front/package*.json ./
RUN npm ci

# Next.jsのソースコードをコピー
COPY front/ ./

# Next.jsを静的ファイルとしてビルド
RUN npm run build

# Nginxで配信
FROM nginx:alpine AS runner

COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/out/ /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
