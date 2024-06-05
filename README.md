# ASCN Project

## Overview

Welcome to the GitHub repository for the ASCN Project from the Master's in Computer Engineering program at the University of Minho. This project focuses on deploying a Laravel application on Google Kubernetes Engine (GKE) and analyzing its performance and resilience under different user load scenarios.

## Introduction

This project explores the deployment of a Laravel application on Google Kubernetes Engine (GKE) to understand its performance and resilience under different user loads. Laravel, a robust PHP-based MVC framework, and GKE's scalable container orchestration capabilities are used to manage and optimize web applications efficiently.

## Architecture

The Laravel application is designed using the Model-View-Controller (MVC) architecture and includes the following components:

- **Frontend**: User interface components such as pages, forms, and UI elements.
- **Backend**: Built with the PHP Laravel framework, which includes controllers, routes, and models to handle business logic and request processing.
- **Database**: A MySQL database for storing and retrieving application data.
- **Integrations**: Optional enhancements including GitHub authentication, Algolia search, Twitter sharing, and Telegram notifications.

### Automation

**Ansible**

Ansible is used for automating the deployment and configuration of the Laravel application.

- **Agentless**: No agents required on target systems.
- **Secure**: Uses SSH for communication.
- **YAML-based**: Easy configuration with YAML files.

**GKE**

Google Kubernetes Engine (GKE) is used for container orchestration.

- **Scalable**: Automatically scales resources with Horizontal Pod Autoscaler (HPA) and Node Autoscaler.
- **Portable**: Ensures application consistency across environments.
- **Secure**: Provides secure communication between services.

### Monitoring

The project uses GKE's integrated monitoring tools to track CPU and RAM usage of all pods. Performance tests are conducted using Apache JMeter to simulate user behavior and identify bottlenecks.

## Results

### Initial Setup

- **5 Users**: Average response time of 1.3 seconds.
- **20 Users**: Average response time increased to 5.5 seconds.
- **75 Users**: Application became nearly unusable with a 20-second response time.

### Optimized Setup

- **5 Users**: Response time improved to 750ms.
- **20 Users**: With 6 pods, response time closer to 800ms.
- **75 Users**: Initial tests with 6 pods showed a 1.3-second response time, improving significantly with 20 pods.
