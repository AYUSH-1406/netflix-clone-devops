# 🎬 Netflix Clone – End‑to‑End DevOps CI/CD on AWS

<img width="1718" height="636" alt="image" src="https://github.com/user-attachments/assets/bf6b39de-15e7-4b02-b2d8-f540bcf06ab3" />
<img width="1491" height="742" alt="image" src="https://github.com/user-attachments/assets/5e5f395b-563a-4972-a1a6-22cc6c70501d" />



An end‑to‑end **enterprise‑style DevOps project** where a Netflix‑like frontend application is built, containerized, pushed to **Amazon ECR**, and deployed on **Amazon EKS** using a **Jenkins CI pipeline**.

This project demonstrates **real‑world DevOps practices**: clean Git hygiene, secure secrets handling, Docker, AWS, Kubernetes, and Jenkins pipelines.

---

## 🚀 Live Application

> Deployed on **AWS EKS** and exposed via **AWS Load Balancer**

🔗 **Application URL**:

```
http://k8s-netflixfrontend-cfd5113063-1624404641.ap-south-1.elb.amazonaws.com
```

### ✅ Application Running on EKS

![Netflix Clone Running on EKS](./docs/netflix-ui.png)

---

## 🧱 Architecture Overview

```
Developer
   │
   │  (git push)
   ▼
GitHub Repository
   │
   │  (webhook / poll SCM)
   ▼
Jenkins CI Pipeline
   │
   ├── Checkout Code
   ├── Docker Build
   ├── Login to Amazon ECR
   ├── Tag Docker Image
   ├── Push Image to ECR
   │
   ▼
Amazon ECR (Docker Registry)
   │
   │  (image pull)
   ▼
Amazon EKS Cluster
   │
   ├── Kubernetes Deployment
   ├── Kubernetes Service
   └── AWS Load Balancer (ELB)
           │
           ▼
        End Users
```

---

## 🛠️ Tech Stack

| Category         | Tools / Services        |
| ---------------- | ----------------------- |
| Cloud            | AWS                     |
| CI/CD            | Jenkins                 |
| Containerization | Docker                  |
| Registry         | Amazon ECR              |
| Orchestration    | Amazon EKS (Kubernetes) |
| IaC              | Terraform               |
| Frontend         | React + Vite            |
| OS (CI)          | Windows (Local Jenkins) |

---

## 📂 Repository Structure

```
Netflix-Clone-K8S-End-to-End-Project/
│
├── Application-Code/
│   ├── Dockerfile
│   ├── package.json
│   └── src/
│
├── Infra/
│   ├── vpc/
│   └── eks/
│
├── Jenkinsfile
├── .gitignore
└── README.md
```

> ⚠️ `.terraform/` directories are **explicitly ignored** as per DevOps best practices.

---

## 🔁 CI/CD Workflow (Step‑by‑Step)

### 1️⃣ Source Code Management

* Code pushed to **GitHub**
* Clean Git history (no binaries, no `.terraform`)

### 2️⃣ Jenkins Pipeline Trigger

* Jenkins pulls code from GitHub
* Reads `Jenkinsfile`

### 3️⃣ Docker Build

* Builds Docker image from `Application-Code/Dockerfile`
* Tags image using Jenkins build number

### 4️⃣ Authenticate to Amazon ECR

* Jenkins uses **AWS credentials stored securely**
* Logs into ECR using AWS CLI

### 5️⃣ Push Image to ECR

* Image tagged as:

  * `latest`
  * `<build-number>`
* Image successfully pushed to:

```
203071037199.dkr.ecr.ap-south-1.amazonaws.com/netflix-frontend
```

### 6️⃣ Kubernetes Deployment (EKS)

* EKS pulls image from ECR
* Pods created via Kubernetes Deployment
* Service exposes app via AWS ELB

---

## 🧪 Jenkins Pipeline Execution

### Jenkins Stage View

![Jenkins Pipeline Stage View](./docs/jenkins-pipeline.png)

### Key Stages:

* Checkout
* Docker Build
* Login to ECR
* Tag Image
* Push to ECR

---

## 🔐 Security & Best Practices

✔️ No secrets hardcoded in repo
✔️ AWS credentials stored in Jenkins Credentials Manager
✔️ `.terraform/` excluded from Git
✔️ Immutable Docker images
✔️ Build numbers used for traceability

---

## 📈 What This Project Demonstrates

* Real enterprise CI/CD workflow
* Docker + Kubernetes in production style
* Jenkins on Windows with `bat` execution
* AWS ECR & EKS integration
* Terraform hygiene & Git best practices

---

## 🧠 Key Learnings

* Jenkins `sh` vs `bat` (Linux vs Windows agents)
* Docker build context vs repo root
* Why `.terraform` must never be committed
* Secure CI/CD credentials handling
* End‑to‑end automation mindset

---

## 📌 Future Improvements

* Argo CD for GitOps deployment
* Helm charts for Kubernetes manifests
* HTTPS using ACM + Ingress
* Jenkins on EC2 / Kubernetes agent
* Monitoring with Prometheus & Grafana

---

## 👤 Author

**Ayush Srivastava**
DevOps | Cloud | Kubernetes | CI/CD

---

⭐ If you find this project helpful, consider giving it a star on GitHub!
