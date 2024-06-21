#!/bin/bash

echo "🚀 Preparing development environment..."

# Function to check if a port is in use and shut down the process using it
shut_down_service() {
  PORT=$1
  if lsof -i :$PORT; then
    PID=$(lsof -ti :$PORT)
    echo "🔍 Port $PORT is in use by process $PID. Attempting to shut down the process."
    if ps -p $PID > /dev/null; then
      echo "🛑 Process $PID is running. Attempting to kill it gracefully."
      kill $PID
      sleep 2  # Wait a moment to allow the process to terminate gracefully
      if ps -p $PID > /dev/null; then
        echo "⚠️ Process $PID did not terminate gracefully. Force killing it."
        kill -9 $PID
      fi
      echo "✅ Process $PID has been stopped."
    else
      echo "⚠️ No running process found with PID $PID. Manual intervention required."
      exit 1
    fi
  else
    echo "✅ Port $PORT is not in use."
  fi
}

# Check and shut down service using port 5432 (PostgreSQL)
shut_down_service 5432
