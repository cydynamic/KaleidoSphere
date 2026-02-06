#!/bin/bash

# KaleidoSphere Test Runner
# Full Domain-Driven Coverage

echo "🚀 Running KaleidoSphere Tests..."

ROOT_DIR="$(cd "$(dirname "$0")/../../.." && pwd)"

# 1. Security (Critical)
echo "----------------------------------------"
echo "🛡️  Running Security Suite..."
promptfoo eval -c "${ROOT_DIR}/meta-studio/self-dev/tests/suites/security.yaml" --no-cache

# 2. Workflow (Core)
echo "----------------------------------------"
echo "🌊 Running Workflow Suite..."
promptfoo eval -c "${ROOT_DIR}/meta-studio/self-dev/tests/suites/workflow.yaml" --no-cache

# 3. Setup (Lifecycle)
echo "----------------------------------------"
echo "🏗️  Running Setup Suite..."
promptfoo eval -c "${ROOT_DIR}/meta-studio/self-dev/tests/suites/setup.yaml" --no-cache

# 4. Planning (Cognition)
echo "----------------------------------------"
echo "🧠 Running Planning Suite..."
promptfoo eval -c "${ROOT_DIR}/meta-studio/self-dev/tests/suites/planning.yaml" --no-cache

echo "----------------------------------------"
echo "🧰 Running Install Strategy Suite..."
promptfoo eval -c "${ROOT_DIR}/meta-studio/self-dev/tests/suites/install-strategy.yaml" --no-cache

echo "----------------------------------------"
echo "🧭 Running Workflow Strategy Suite..."
promptfoo eval -c "${ROOT_DIR}/meta-studio/self-dev/tests/suites/workflow-strategy.yaml" --no-cache

echo "----------------------------------------"
echo "✅ All Suites Completed."
