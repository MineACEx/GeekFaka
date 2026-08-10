#!/bin/bash
set -e

echo "=== GeekFaka Render Build Script ==="

# Install dependencies
echo "Installing dependencies..."
yarn install

# Transform Prisma schema from sqlite to postgresql
echo "Transforming Prisma schema for PostgreSQL..."
sed -i 's/provider = "sqlite"/provider = "postgresql"/g' prisma/schema.prisma

# Generate Prisma client (force Prisma 5)
echo "Generating Prisma client..."
npx prisma@5 generate

# Build Next.js
echo "Building Next.js..."
yarn build

echo "=== Build Complete ==="
