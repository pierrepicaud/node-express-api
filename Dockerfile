# Latest LTS node version 
FROM node:16 as builder

# Production image
ENV NODE_ENV=Production

# The directory to post the app
WORKDIR /app

# Copy the package.json and the lockfile
COPY ["package.json", "package-lock.json", "./"]

# Install dependencies
USER 0
RUN npm ci --omit=dev

USER node 
COPY src/. .

FROM node:16-slim

COPY --from=builder /app /app
WORKDIR /app

# Start the server
CMD ["npm", "start"]
