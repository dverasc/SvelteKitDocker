FROM node:14-alpine as builder
WORKDIR /app
# RUN npm i -D @sveltejs/adapter-static@next
COPY package.json package-lock.json ./
RUN npm install
COPY . .
# RUN npm update
RUN npm run build 
# && npm prune --production
FROM node:14-alpine

# FROM node:16.13.1-alpine3.14
USER node:node
WORKDIR /app
COPY --from=builder --chown=node:node /app/build ./build
COPY --from=builder --chown=node:node /app/node_modules ./node_modules
COPY --chown=node:node package.json .
ENV PORT 3000
EXPOSE 3000
CMD ["node","build"]
