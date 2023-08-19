## Overview

This tool makes use of the Kafka Rest Proxy, easily produce test data to a specified Kafka cluster and topic.

## Getting Started

Follow these steps to begin using the Kafka Testing Tool:

- Install Docker
- Navigate to the root directory of the Kafka Testing Tool:
  - `cd /path/to/kafka-testing-tool`
  - Create a `.env` file, take a look at the .env.example file for reference.
  - `docker-compose up -d` - This will start the Kafka Rest Proxy in detatched mode.

## Usage

### Produce Data

- Navigate to the root directory of the Kafka Testing Tool:
  - `cd /path/to/kafka-testing-tool`
  - Produce data to a kafka:
    - Run the following command: `sh produce.sh -t <topic_name> -l <number of records> -d <json data file path>`


