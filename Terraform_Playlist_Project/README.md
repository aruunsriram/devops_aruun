

# **🚀 Creating Multiple Spotify Playlists Using Terraform**  

## **🟢 Introduction**  
### **What is this project about?**  
This project automates the creation of **Spotify playlists** using **Terraform**. Terraform, a popular **Infrastructure as Code (IaC)** tool, is usually used to manage cloud infrastructure, but here, we’re using it to interact with **Spotify’s API** to create and manage playlists dynamically.  

### **🌟 Why is this project useful?**  
- Automates **playlist management** instead of manually creating them.  
- Demonstrates how **Terraform** can be used beyond cloud computing.  
- Uses **OAuth authentication** and **API integration**, which are key concepts in **DevOps**.  
- Helps in learning **Terraform providers, modules, and data blocks** for automation.  

---

## **🛠 Prerequisites: What You Need to Set Up**  
Before starting, ensure you have the following:  

✅ **Terraform Installed** – Verify with `terraform -v`  
✅ **Docker Installed** – Needed for authentication  
✅ **Spotify Account** – Free account works  
✅ **Spotify Developer Account** – To access the API  
✅ **VS Code** – For writing and managing Terraform code  

---

## **📂 Step 1: Setting Up the Project Folder**  
- Create a new folder named **Spotify_TF**.  
- Open it in **VS Code**.  
- Inside this folder, create Terraform files:  
  - `provider.tf` → To define the **Spotify provider**  
  - `.env` → To store **Spotify API credentials**  
  - `playlist.tf` → To define **Spotify playlists**  

---

## **🎵 Step 2: Setting Up Spotify API & Developer Account**  
1️⃣ **Go to Spotify Developer Dashboard** ([developer.spotify.com](https://developer.spotify.com/dashboard))  
2️⃣ **Log in & Create an App**  
   - App Name: **Terraform Spotify Automation**  
   - Description: **Creating multiple playlists automatically**  
   - Redirect URI: `http://localhost:27228/callback`  
3️⃣ **Get API Credentials**  
   - Copy **Client ID** and **Client Secret**  
   - Store them in a `.env` file:  
     ```
     SPOTIFY_CLIENT_ID=your_client_id
     SPOTIFY_CLIENT_SECRET=your_client_secret
     ```

---

## **🐳 Step 3: Setting Up Docker for Authentication**  
Since Spotify requires **OAuth authentication**, we use a **Docker container** to handle authentication.  

🔹 Run this command to start the authentication service:  
```
docker run --rm -it -p 27228:27228 --env-file .env ghcr.io/conradludgate/spotify-auth-proxy
```  
🔹 This will:  
✅ Start a local authentication server on **port 27228**  
✅ Provide a **URL to authorize the app**  
✅ Once authorized, generate an **access token**  

👉 **Copy the API Key** from the terminal – this will be used in Terraform.  

---

## **🌍 Step 4: Initializing Terraform**  
Before applying any configuration, **initialize Terraform**:  
```
terraform init
```  
🔹 This will:  
✅ Download the **Spotify provider plugin**  
✅ Set up Terraform’s internal structure  

---

## **🎶 Step 5: Creating a Spotify Playlist Using Terraform**  
Now, we define **playlists** in Terraform.  

🔹 A **basic playlist** consists of:  
- Playlist name  
- Tracks (song IDs)  

🔹 We can also **automate track selection** by using **data blocks** that fetch songs dynamically based on a search query.  

---

## **📌 Step 6: Deploying the Playlist Using Terraform**  
1️⃣ **Plan the execution**  
```
terraform plan
```  
✅ This shows what Terraform will create/modify.  

2️⃣ **Apply the changes**  
```
terraform apply -auto-approve
```  
✅ This creates the **playlist on Spotify** 🎉  

👉 **Check your Spotify account** – you should see the newly created playlist!  

---

## **🔄 Step 7: Automating Track Selection (Optional)**  
Instead of manually adding tracks, we can use **Spotify’s search feature** in Terraform:  
- **Search for tracks dynamically**  
- **Automatically fetch track IDs**  
- **Add them to the playlist**  

---

## **🎯 Conclusion: What We Achieved?**  
✅ **Created Spotify playlists using Terraform**  
✅ **Integrated Spotify API with Terraform**  
✅ **Used OAuth authentication via Docker**  
✅ **Automated track selection dynamically**  
✅ **Learned Infrastructure as Code (IaC) beyond cloud computing**  

---

## **💡 Possible Enhancements**  
🔹 Automate multiple playlists at once  
🔹 Fetch trending songs dynamically  
🔹 Use Terraform variables to customize playlists  

---

## **🙌 Final Thoughts**  
This project is a fun way to explore **DevOps tools** in a creative space like **Spotify**! 🌍🚀  

👉 **What’s next?** Could we use Terraform for **other APIs like YouTube or Netflix?** Let’s discuss! 💬  

---

## **🎤 Q&A Session**  
- **What if the playlist doesn’t appear?**  
  - Check the **API key & authentication**.  
- **Can we use this with other music services?**  
  - Yes! With the right API, this method works for **Apple Music, YouTube Music, etc.**  
- **Why use Terraform for this?**  
  - It’s a great way to learn **IaC, API automation, and OAuth authentication**!  
