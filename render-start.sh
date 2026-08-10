#!/bin/bash
set -e

echo "=== GeekFaka Render Start Script ==="

# Ensure Prisma schema is transformed for PostgreSQL
echo "Ensuring PostgreSQL schema..."
sed -i 's/provider = "sqlite"/provider = "postgresql"/g' prisma/schema.prisma

# Push database schema
echo "Pushing database schema..."
npx prisma@5 db push --accept-data-loss

# Start the Next.js server
echo "Starting server..."
node .next/standalone/server.js
