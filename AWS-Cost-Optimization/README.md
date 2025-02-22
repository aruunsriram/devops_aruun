# 💰 AWS Cost Optimization Using Lambda & Event-Driven Serverless Architecture  

## 📌 Overview  
This project focuses on **automated cost optimization** in AWS by identifying and deleting **unused EBS snapshots** using **AWS Lambda** and an **event-driven serverless architecture**.  

Many AWS users accumulate **stale EBS snapshots**, leading to unnecessary storage costs. This solution helps **DevOps and Cloud Engineers** save costs by **automating stale resource management** without manual intervention.  

---

## 🚀 Features  
✅ **Automated Cleanup** – Identifies and deletes unneeded **EBS snapshots**.  
✅ **Event-Driven Execution** – Uses **AWS Lambda** triggered by a **CloudWatch Event Rule**.  
✅ **Serverless Architecture** – Fully managed, no need for dedicated infrastructure.  
✅ **Cost Optimization** – Prevents unnecessary AWS storage costs.  
✅ **Logging & Monitoring** – Integrated with **AWS CloudWatch** for logging and debugging.  
✅ **Secure Execution** – Runs with **IAM role permissions** for restricted access.  

---

## 🛠️ Tech Stack  
- **Cloud Provider**: AWS  
- **Services Used**: Lambda, CloudWatch, EC2, S3, IAM, SNS  
- **Programming Language**: Python (Boto3 SDK)  
- **Automation**: AWS Lambda & CloudWatch Event Rules  
- **Infrastructure as Code (IaC)**: Terraform (Optional)  

---

## ⚙️ Setup & Deployment  

### 1️⃣ Clone the Repository  
```sh  
git clone https://github.com/yourusername/aws-cost-optimization.git  
cd aws-cost-optimization  
```  

### 2️⃣ Install Required Dependencies  
```sh  
pip install boto3 awscli  
```  

### 3️⃣ Configure AWS Credentials  
```sh  
aws configure  
```  
Provide:  
- AWS **Access Key ID**  
- AWS **Secret Access Key**  
- Default **Region**  

### 4️⃣ Deploy AWS Lambda Function  

#### ✅ **Create IAM Role for Lambda**  
1. Go to **AWS IAM Console** → **Roles** → **Create Role**.  
2. Choose **AWS Service** → Select **Lambda**.  
3. Attach **AmazonEC2ReadOnlyAccess** and **AmazonEC2FullAccess** policies.  
4. **Create the role** and note down the **Role ARN**.  

#### ✅ **Upload & Configure Lambda Function**  
1. **Zip the Python script (`lambda_function.py`)**:  
   ```sh
   zip function.zip lambda_function.py
   ```  
2. Go to **AWS Lambda Console** → **Create Function** → **Author from scratch**.  
3. Assign the previously created **IAM Role**.  
4. Upload the **`function.zip`** file.  
5. Set up **CloudWatch Event Rule** to trigger Lambda every **24 hours**.

---

## 🔄 How It Works  
1. **Lambda retrieves all EBS snapshots** in the AWS account.  
2. **It checks if the snapshots are attached to any active EC2 instances.**  
3. **If a snapshot is unused, it is automatically deleted** to free up storage and reduce AWS costs.  
4. **CloudWatch logs execution details** and sends notifications (optional via SNS).  

---

## 📝 Example Code Snippet  

This AWS Lambda function fetches all EBS snapshots and **deletes those that are no longer attached to an active EC2 instance**.

```python
import boto3

def lambda_handler(event, context):
    ec2 = boto3.client('ec2')

    # Get all EBS snapshots owned by the user
    response = ec2.describe_snapshots(OwnerIds=['self'])

    # Get active EC2 instances
    instances_response = ec2.describe_instances(Filters=[{'Name': 'instance-state-name', 'Values': ['running']}])
    active_instance_ids = set()

    for reservation in instances_response['Reservations']:
        for instance in reservation['Instances']:
            active_instance_ids.add(instance['InstanceId'])

    # Process each snapshot
    for snapshot in response['Snapshots']:
        snapshot_id = snapshot['SnapshotId']
        volume_id = snapshot.get('VolumeId')

        if not volume_id:
            # Delete snapshot if not attached to any volume
            ec2.delete_snapshot(SnapshotId=snapshot_id)
            print(f"Deleted snapshot {snapshot_id} as it was not attached to any volume.")
        else:
            try:
                volume_response = ec2.describe_volumes(VolumeIds=[volume_id])
                if not volume_response['Volumes'][0]['Attachments']:
                    ec2.delete_snapshot(SnapshotId=snapshot_id)
                    print(f"Deleted snapshot {snapshot_id} as it was taken from a volume not attached to any running instance.")
            except ec2.exceptions.ClientError as e:
                if e.response['Error']['Code'] == 'InvalidVolume.NotFound':
                    # Delete if the associated volume does not exist
                    ec2.delete_snapshot(SnapshotId=snapshot_id)
                    print(f"Deleted snapshot {snapshot_id} as its associated volume was not found.")
```

---

## 🏆 Benefits  
✅ **Reduces AWS storage costs** by removing unused snapshots.  
✅ **Fully automated**, eliminating manual intervention.  
✅ **Event-driven & serverless**, ensuring efficiency.  
✅ **Improves cloud resource management** for AWS users.  

---

## 📢 Contributors  
Special thanks to **Abhishek Verramalla** for guidance on AWS cost optimization strategies.  

---

## 📚 License  
This project is licensed under the **MIT License** – see the [LICENSE](LICENSE) file for details.  
