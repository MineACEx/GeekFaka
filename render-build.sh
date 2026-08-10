#!/bin/bash
set -e

echo "=== GeekFaka Render Build Script ==="

# Install dependencies
echo "Installing dependencies..."
yarn install --frozen-lockfile

# Transform Prisma schema from sqlite to postgresql
echo "Transforming Prisma schema for PostgreSQL..."
sed -i 's/provider = "sqlite"/provider = "postgresql"/g' prisma/schema.prisma

# Generate Prisma client
echo "Generating Prisma client..."
npx prisma generate

# Build Next.js
echo "Building Next.js..."
yarn build

echo "=== Build Complete ==="