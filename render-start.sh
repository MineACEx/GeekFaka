#!/bin/bash
set -e

echo "=== GeekFaka Render Start Script ==="

# Ensure Prisma schema is transformed for PostgreSQL
echo "Ensuring PostgreSQL schema..."
sed -i 's/provider = "sqlite"/provider = "postgresql"/g' prisma/schema.prisma

# Start the Next.js server (database handled by application)
echo "Starting server..."
node .next/standalone/server.js
